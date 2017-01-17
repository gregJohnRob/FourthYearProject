// ======================================================
// Hetero-OpenCL for 2D shallow water model
// Primary target is FPGA, but also meant to work with
// GPUs and CPUs
// By: Syed Waqar Nabi, Glasgow
// 2016.11.29
//
// ======================================================

//application specific header
#include "host-sw2d.h"
  //this application-specific header file (should) includes the generic host header

// -------------------------------------
// Globals
// -------------------------------------
  //timing variables
  double time_write_to_device[NTIMES];
  double time_total_alltimesteps_kernels[NTIMES];
  double time_read_from_device[NTIMES];

////////////////////////////////////////////////////////////////////////////////////////////////////////

int main(int argc, char** argv) {


  // =============================================================================
  // Generic Opencl/Local variables
  // =============================================================================
  int       quantum, checktick();
  double    t;
  int       k;
  int       BytesPerWord = sizeof(stypeHost);
  ssize_t   i,j;

  //for timing profile
  double start_timer, end_timer;

#ifdef OCL
  //opencl variables
  cl_int            err = CL_SUCCESS;
  cl_context        context;        // compute context
  cl_command_queue  commands;       // compute command queue
  cl_program        program;        // compute program
  cl_kernel         kernel;         // compute kernel

#endif


  printf(SLINE);
  printf("Host executable begins\n");
  printf(SLINE);

  printf("2D shallow water heterogenuous opencl model $\n"); printf(HLINE);

  // =============================================================================
  // Application-specific Opencl variables
  // =============================================================================
#ifdef OCL
  //device buffers
  cl_mem
     dev_hzero
    ,dev_eta
    ,dev_etan
    ,dev_h
    ,dev_wet
    ,dev_u
    ,dev_un
    ,dev_v
    ,dev_vn;
#endif

  // =============================================================================
  // Application-specific HOST DATA
  // =============================================================================

  //scalars
  stypeHost hmin = 0.05;
  stypeHost dx = 10.0;
  stypeHost dy = 10.0;
  stypeHost dt = 0.1;
  stypeHost g = 9.81;

  //arrays
  stypeHost *hzero,*eta  ,*etan ,*h    ,*wet  ,*u    ,*un   ,*v    ,*vn;

  posix_memalign ((void**)&hzero, ALIGNMENT, STREAM_ARRAY_SIZE*BytesPerWord);
  posix_memalign ((void**)&eta  , ALIGNMENT, STREAM_ARRAY_SIZE*BytesPerWord);
  posix_memalign ((void**)&etan , ALIGNMENT, STREAM_ARRAY_SIZE*BytesPerWord);
  posix_memalign ((void**)&h    , ALIGNMENT, STREAM_ARRAY_SIZE*BytesPerWord);
  posix_memalign ((void**)&wet  , ALIGNMENT, STREAM_ARRAY_SIZE*BytesPerWord);
  posix_memalign ((void**)&u    , ALIGNMENT, STREAM_ARRAY_SIZE*BytesPerWord);
  posix_memalign ((void**)&un   , ALIGNMENT, STREAM_ARRAY_SIZE*BytesPerWord);
  posix_memalign ((void**)&v    , ALIGNMENT, STREAM_ARRAY_SIZE*BytesPerWord);
  posix_memalign ((void**)&vn   , ALIGNMENT, STREAM_ARRAY_SIZE*BytesPerWord);

  //initialize host arrays
  //-------------------------
  sw2d_init_data_host(hzero, eta, etan, h, wet, u, un, v, vn, hmin, BytesPerWord);

  //set local parameters
  //--------------------

  // set epsilon for Shapiro filter
  stypeHost eps = 0.05;

  //runtime parameters
  //int ntot = 1000;
  int ntot = 10;

  //output parameter
  int nout = 5;

  // determine maximum water depth
  stypeHost hmax= 0.0;
  for (int j=1; j<= COLS-2; j++) {
    for (int k=1; k<=ROWS-2; k++) {
      hmax = MAX (hmax, *(h + j+COLS + k));
    }
  }

  //maximum phase speed
  stypeHost c = sqrt(2*g*hmax);

  //determine stability parameter
  stypeHost lambda = dt*sqrt(g*hmax)/MIN(dx,dy);

#ifdef OCL
  // =============================================================================
  // Setup for OCL if applicable
  // =============================================================================

  //checks clock precision etc
  oclh_timing_setup(u,  BytesPerWord);


  //display setup
  oclh_display_setup();

  //initialize opencl; create context, commansds, program, and kernel
  oclh_opencl_boilerplate(&context, &commands, &program, &kernel, argc, argv);

  //create read-write buffers of size STREAM_ARRAY_SIZE on device
  oclh_create_cldevice_buffer(&dev_hzero, &context, CL_MEM_READ_WRITE);
  oclh_create_cldevice_buffer(&dev_eta  , &context, CL_MEM_READ_WRITE);
  oclh_create_cldevice_buffer(&dev_etan , &context, CL_MEM_READ_WRITE);
  oclh_create_cldevice_buffer(&dev_h    , &context, CL_MEM_READ_WRITE);
  oclh_create_cldevice_buffer(&dev_wet  , &context, CL_MEM_READ_WRITE);
  oclh_create_cldevice_buffer(&dev_u    , &context, CL_MEM_READ_WRITE);
  oclh_create_cldevice_buffer(&dev_un   , &context, CL_MEM_READ_WRITE);
  oclh_create_cldevice_buffer(&dev_v    , &context, CL_MEM_READ_WRITE);
  oclh_create_cldevice_buffer(&dev_vn   , &context, CL_MEM_READ_WRITE);
#endif

  // =============================================================================
  // EXECUTION (all targets)
  // =============================================================================
   // Multiple APPLICATION executions, if we want multiple observations
    for (k=0; k<NTIMES; k++) {
    printf(HLINE); printf("Application Run # %d\n",k+1);
    //-----------------------------------------------
    // Write arrays to device memory, if applicable
    //-----------------------------------------------
    //NOTE: the host-device transfer is OUTSIDE time loop of the application
    //      but INSIDE the NTIMES loop as we want to run multiple, independent
    //      experiments.
#if TARGET!=HOST
    printf("Writing to device buffers\n");
#endif
    // Record times
    start_timer = mysecond();
#if TARGET==HOST
    //do nothing
#elif TARGET==MAXELER
    // //this is a hack... maxeler requires streams to be sized in multiples of 384 (bytes):TODO
    // #define STREAM_ARRAY_SIZE  384
    // LMemExample_writeLMem(STREAM_ARRAY_SIZE, 0 , a2d);
#else
//catch-all for OCL targets
    oclh_blocking_write_cl_buffer(&commands, &dev_hzero, hzero);
    oclh_blocking_write_cl_buffer(&commands, &dev_eta  , eta  );
    oclh_blocking_write_cl_buffer(&commands, &dev_etan , etan );
    oclh_blocking_write_cl_buffer(&commands, &dev_h    , h    );
    oclh_blocking_write_cl_buffer(&commands, &dev_wet  , wet  );
    oclh_blocking_write_cl_buffer(&commands, &dev_u    , u    );
    oclh_blocking_write_cl_buffer(&commands, &dev_un   , un   );
    oclh_blocking_write_cl_buffer(&commands, &dev_v    , v    );
    oclh_blocking_write_cl_buffer(&commands, &dev_vn   , vn   );
#endif
    end_timer = mysecond();
    time_write_to_device[k] = end_timer - start_timer;

    //-----------------------------------------------
    // Set args, global/local sizes (OCL only)
    //-----------------------------------------------
#ifdef OCL
  //set the arguments
  //bBuffer always exists, but is only initialized/set if needed
  oclh_set_kernel_args  ( &kernel
                        , &dt
                        , &dx
                        , &dy
                        , &g
                        , &eps
                        , &hmin
                        , &dev_eta
                        , &dev_un
                        , &dev_u
                        , &dev_wet
                        , &dev_v
                        , &dev_vn
                        , &dev_h
                        , &dev_etan
                        , &dev_hzero
                    );

  //set global and local sizes
  size_t globalSize[] = {0,0,0};
  size_t localSize[]  = {0,0,0};
  oclh_get_global_local_sizes(globalSize, localSize);
#endif


      // ------------------------------------------------------------------------
      //Kernel Executions start here
      // ------------------------------------------------------------------------
      //start time for THIS application execution
      //NOTE that this timer will time outside the TIME loop
      //times_kernel_exec[k] = mysecond();
#if TARGET==HOST
      printf("Starting time loop on host\n");
#else
      printf("Starting time loop on device\n");
#endif

      start_timer = mysecond();
      // top level (time) loop is on the host
      // TODO: Can we not move this to the device as well?


      for (int i=0;i<ntot;i++) {
#if TARGET==HOST
    // -----------------------------------------------------------------------------
    // HOST-only execution version
    // -----------------------------------------------------------------------------

    //call dyn (host version)
    //-------------------------
    sw2d_dyn_host(dt, dx, dy, g, eta, un, u, wet, v, vn, h, etan, BytesPerWord);

    //call shapiro (host version)
    //---------------------------
    sw2d_shapiro_host(wet,etan,eps,eta);

    //call updates (host version. in the original this is done in main)
    //-------------------------------------------------------------------
    sw2d_updates_host  (h , hzero, eta, u, un, v, vn, wet, hmin);
#else
    // -----------------------------------------------------------------------------
    // Device Execution Version
    // -----------------------------------------------------------------------------
    //launch kernel
    //-------------
    //printf(HLINE); printf("Launching the kernels on device\n"); printf(HLINE);

//MAXELER device target
#if TARGET==MAXELER
      LMemExample(STREAM_ARRAY_SIZE);
//ALL other OpenCL device targets (including CPU)
#else
      oclh_enq_cl_kernel(&commands, &kernel, globalSize, localSize);
#endif

#endif
//#else; #if TARGET==HOST
     }//time-loop: for (int i=0;i<ntot;i++)

     //---------------------------------------------------------------------
     //One complete execution of application (all time steps)  ends here
     //---------------------------------------------------------------------
      end_timer = mysecond();
      time_total_alltimesteps_kernels[k] = end_timer - start_timer;
      //times[k] = mysecond() - times[k];

    //-------------------------------------------
    // Read back the results
    //-------------------------------------------
#if TARGET!=HOST
    printf("Reading from device buffers\n");
#endif
//
//    start_timer = mysecond();
//#if TARGET==HOST
//     //do nothing
//#elif TARGET==MAXELER
//     //LMemExample_readLMem(STREAM_ARRAY_SIZE, 2 * STREAM_ARRAY_SIZE, c2d);
//#else
//    oclh_blocking_read_cl_buffer(&commands, &cBuffer, c2d);
//#endif
//    end_timer = mysecond();
//    time_read_from_device[k] = end_timer - start_timer;
    printf("End of Run\n"); printf(HLINE);
    }//for (k=0; k<NTIMES; k++)

  // =============================================================================
  // POST PROCESSING
  // =============================================================================
//
//   // Write output arrays
// #ifdef LOGRESULTS
//   start_timer = mysecond();
//   oclh_log_results(a2d, b2d, c2d);
//   end_timer = mysecond();
//   time_write2file = end_timer - start_timer;
// #endif
//
//   //verify results
//   start_timer = mysecond();
//   oclh_verify_results(a2d, b2d, c2d, scalarval);
//   end_timer = mysecond();
//   time_verify = end_timer - start_timer;
//

   // Calculate BW. Display and write to file
   oclh_calculate_performance();

   // Display overall timing profile
   //oclh_disp_timing_profile();

// Shutdown and cleanup
// -----------------------------------------
  free(hzero);
  free(eta  );
  free(etan );
  free(h    );
  free(wet  );
  free(u    );
  free(un   );
  free(v    );
  free(vn    );
#ifdef OCL
  //clReleaseObject(dev_hzero);
  //clReleaseObject(dev_eta  );
  //clReleaseObject(dev_etan );
  //clReleaseObject(dev_h    );
  //clReleaseObject(dev_wet  );
  //clReleaseObject(dev_u    );
  //clReleaseObject(dev_un   );
  //clReleaseObject(dev_v    );
  //clReleaseObject(dev_vn   );

  clReleaseProgram(program);
  clReleaseKernel(kernel);
  clReleaseCommandQueue(commands);
  clReleaseContext(context);
#endif

  printf(SLINE);
  printf("Host executable ends\n");
  printf(SLINE);


}

#include "host-generic.h"


// -------------------------------------
// Globals
// -------------------------------------
//array of randomized indices in both directions to simulate random access
//extern static int randi[STREAM_ARRAY_SIZE_DIM1],
//           randj[STREAM_ARRAY_SIZE_DIM2];

//timing variables (defined in host.c)
extern  double time_write_to_device[NTIMES];
extern  double time_total_alltimesteps_kernels[NTIMES];
extern  double time_read_from_device[NTIMES];


static double avgtime = 0
            , maxtime = 0
            , relstdev = 0
            , mintime = FLT_MAX;

static char  *label = "Kernel:      ";
static double bytes = 2 * sizeof(stypeHost) * STREAM_ARRAY_SIZE;

//double times[NTIMES];
//extern double time_write_to_device[NTIMES];
//extern double time_total_alltimesteps_kernels[NTIMES];
//extern double time_read_from_device[NTIMES];


//double time_a2d_togpu;
//double time_b2d_togpu;
//double time_kernels;
//double time_c2d_tohost;
//double time_write2file;
//double time_verify;

extern double mysecond();

//-------------------------------
//checktick()
//-------------------------------
int checktick() {
  int   i, minDelta, Delta;
  double  t1, t2, timesfound[M];

  //Collect a sequence of M unique time values from the system.
  for (i = 0; i < M; i++) {
    t1 = mysecond();
    while( ((t2=mysecond()) - t1) < 1.0E-6 );
    timesfound[i] = t1 = t2;
  }

  /*
  * Determine the minimum difference between these M values.
  * This result will be our estimate (in microseconds) for the
  * clock granularity.
  */

  minDelta = 1000000;
  for (i = 1; i < M; i++) {
    Delta = (int)( 1.0E6 * (timesfound[i]-timesfound[i-1]));
    minDelta = MIN(minDelta, MAX(Delta,0));
  }

  return(minDelta);
}

//-------------------------------
// mysecond()
//-------------------------------

/* A gettimeofday routine to give access to the wall
   clock timer on most UNIX-like systems.  */

double mysecond()
{
        struct timeval tp;
        struct timezone tzp;
        //void* tzp;
        int i;

        i = gettimeofday(&tp,&tzp);
        return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}


//----------------------------------------------------
// load_file_to_memory()
//----------------------------------------------------
int
load_file_to_memory(const char *filename, char **result)
{
  size_t size = 0;
  FILE *f = fopen(filename, "rb");
  if (f == NULL)
  {
    *result = NULL;
    return -1; // -1 means file opening fail
  }
  fseek(f, 0, SEEK_END);
  size = ftell(f); //current position
  fseek(f, 0, SEEK_SET);
  *result = (char *)malloc(size+1);
  if (size != fread(*result, sizeof(char), size, f))
  {
    free(*result);
    return -2; // -2 means file reading fail
  }
  fclose(f);
  (*result)[size] = 0;
  return size;
}

//----------------------------------------------------
// oclh_init_data()
//----------------------------------------------------
void oclh_init_data(stypeHost* a2d, stypeHost* b2d, stypeHost* c2d, int BytesPerWord) {
  // Initializaing the stream arrays
  // --------------------------------
  //randomize a2d, so that persistent DRAM content does not lead to false positives when verifying results
  time_t tt;
  srand((unsigned) time(&tt));
  int r = rand() % 50;

  for (int i=0; i<STREAM_ARRAY_SIZE_DIM1; i++) {
    for (int j=0; j<STREAM_ARRAY_SIZE_DIM2; j++) {
      *(a2d + i*STREAM_ARRAY_SIZE_DIM2 + j) = r+i+j;
      *(b2d + i*STREAM_ARRAY_SIZE_DIM2 + j) = i+j;
      *(c2d + i*STREAM_ARRAY_SIZE_DIM2 + j) = 0.0;
    }
  }
  printf("Host arrays initialized. Random integer = %d\n", r);
  printf(HLINE);
}

//----------------------------------------------------
// oclh_timing_setup()
//----------------------------------------------------
void oclh_timing_setup(stypeHost* a2d, int BytesPerWord){
  // Setting up measurements
  // --------------------------------
  int       quantum, checktick();

  double    t;

  // determine precision and check timing
  // -------------------------------------
  printf("This system uses %d bytes per array element.\n",  BytesPerWord);
  printf(HLINE);

  printf( "Array dimensions\t= %llu x %llu (elements)\n"
        , (unsigned long long) STREAM_ARRAY_SIZE_DIM1, (unsigned long long) STREAM_ARRAY_SIZE_DIM2);
  printf("Array size\t\t= %llu (elements), Offset = %d (elements)\n"
        , (unsigned long long) STREAM_ARRAY_SIZE, OFFSET);
  printf("Memory per array\t= %.1f MiB (= %.1f GiB).\n",
   BytesPerWord * ( (double) STREAM_ARRAY_SIZE / 1024.0/1024.0),
   BytesPerWord * ( (double) STREAM_ARRAY_SIZE / 1024.0/1024.0/1024.0));
  printf("Total memory required\t= %.1f MiB (= %.1f GiB).\n",
   (3.0 * BytesPerWord) * ( (double) STREAM_ARRAY_SIZE / 1024.0/1024.),
   (3.0 * BytesPerWord) * ( (double) STREAM_ARRAY_SIZE / 1024.0/1024./1024.));
  printf("Each kernel will be executed %d times.\n", NTIMES);
  printf("Bandwidth based on best, worst, and average times (excluding the first iteration)\n");
  printf("will be reported, along with relative standard deviation.\n");

  // Check clock precision and estimated testing time
  // -------------------------------------------------
  // Get initial value for system clock
  printf(HLINE);
  if  ( (quantum = checktick()) >= 1)
    printf("Your clock granularity/precision appears to be "
      "%d microseconds.\n", quantum);
  else {
    printf("Your clock granularity appears to be "
      "less than one microsecond.\n");
    quantum = 1;
  }

  // Estimate test time
  t = mysecond();
  for (int i=0; i<STREAM_ARRAY_SIZE_DIM1; i++)
    for (int j=0; j<STREAM_ARRAY_SIZE_DIM2; j++)
      *(a2d + i*STREAM_ARRAY_SIZE_DIM2 + j)
        = 2.0E0 * *(a2d + i*STREAM_ARRAY_SIZE_DIM2 + j);
  t = 1.0E6 * (mysecond() - t);

  printf(HLINE);
  printf( "Each test below will take on the order"
          " of %d microseconds.\n", (int) t  );
  printf("   (= %d clock ticks)\n", (int) (t/quantum) );
  printf("Increase the size of the arrays if this shows that\n");
  printf("you are not getting at least 20 clock ticks per test.\n");
  printf(HLINE);
  printf("WARNING -- The above is only a rough guideline.\n");
  printf("For best results, please be sure you know the\n");
  printf("precision of your system timer.\n");
  printf(HLINE);

}


//----------------------------------------------------
// display setup()
//----------------------------------------------------
void oclh_display_setup(){
 // Display experimental setup
  //---------------------------------------
  printf(SLINE);
  printf("Experimental Setup \n");
  printf(HLINE);
  printf("TARGET                  = %d [AOCL, SDACCEL, GPU, CPU]            \n", TARGET                 );
  printf("VECTOR_SIZE             = %d                                      \n", VECTOR_SIZE            );
  printf("STREAM_ARRAY_SIZE_DIM1  = %d                                      \n", STREAM_ARRAY_SIZE_DIM1 );
  printf("STREAM_ARRAY_SIZE       = %d                                      \n", STREAM_ARRAY_SIZE      );
  printf("LOOPING management      = %d [API, KERNEL]                        \n", LOOPING                );
  printf("NESTING                 = %d [FLAT_LOOPING, NESTED_LOOPING]       \n", NESTING                );
  printf(HLINE);
}



#ifdef OCL
//----------------------------------------------------
// oclh_opencl_boilerplate()
//----------------------------------------------------
int  oclh_opencl_boilerplate ( cl_context*       context_ref
                            , cl_command_queue* commands_ref
                            , cl_program*       program_ref
                            , cl_kernel*        kernel_ref
                            , int               argc
                            , char**            argv
) {
  printf(SLINE);
  printf("OpenCL Setup \n");
  printf(HLINE);

  // Error Handling
  // -----------------------------------------
  cl_int err = CL_SUCCESS;

  // Init OpenCL variables
  // -----------------------------------------

  cl_uint           platformIdCount = 0; //# of platforms
  cl_uint           num_devices;
  cl_platform_id    platform_id;    // platform id
  cl_device_id*     all_device_ids; // compute device id
  cl_device_id      device_id;      // compute device id

  cl_context        context = *context_ref;        // compute context
  cl_command_queue  commands= *commands_ref;       // compute command queue
  cl_program        program = *program_ref;        // compute program
  cl_kernel         kernel  = *kernel_ref;         // compute kernel

  char cl_platform_vendor[1001];
  char cl_platform_name[1001];
  char cl_platform_version[1001];

  if (argc != 2){
    printf("%s <inputfile>\n", argv[0]);
    return EXIT_FAILURE;
  }

  // PLATFORM: Query and connect
  // -----------------------------------------
  // get number of platforms
  err = clGetPlatformIDs  ( 0
                          , NULL
                          , &platformIdCount
                          );
  CHECK_ERRORS(err,"");
  printf ("Number of platforms:\t%d\n", platformIdCount);

  // Connect to first platform
  err = clGetPlatformIDs  ( 1
                          ,&platform_id
                          ,NULL
                          );
  CHECK_ERRORS(err, "Error: Failed to find an OpenCL platform!\n");

  //get platform vendor
  err = clGetPlatformInfo ( platform_id
                          , CL_PLATFORM_VENDOR
                          , 1000
                          , (void *)cl_platform_vendor
                          , NULL
                          );
  CHECK_ERRORS(err, "Error: clGetPlatformInfo(CL_PLATFORM_VENDOR) failed!");
  printf("CL_PLATFORM_VENDOR:\t%s\n",cl_platform_vendor);

  //get platform name
  err = clGetPlatformInfo ( platform_id
                          , CL_PLATFORM_NAME
                          , 1000
                          , (void *)cl_platform_name
                          , NULL
                          );
  CHECK_ERRORS(err, "Error: clGetPlatformInfo(CL_PLATFORM_NAME) failed!");
  printf("CL_PLATFORM_NAME:\t%s\n",cl_platform_name);

  //get OpenCL platform version
  err = clGetPlatformInfo ( platform_id
                          , CL_PLATFORM_VERSION
                          , 1000
                          , (void *)cl_platform_version
                          , NULL
                          );
  CHECK_ERRORS(err, "Error: clGetPlatformInfo(CL_PLATFORM_VERSION) failed!");
  printf("CL_PLATFORM_VERSION:\t%s\n",cl_platform_version);

  // DEVICE: Query, connect and display info
  // -----------------------------------------
  // Connect to a compute device
  //
  //get number of devices
  printf(HLINE);
  printf("Device details\n");
  printf(HLINE);
  err = clGetDeviceIDs  ( platform_id
                        , CL_DEVICE_TYPE_ALL
                        , 0
                        , NULL
                        , &num_devices
                        );
  CHECK_ERRORS(err, "Query for number of devices failed");
  printf("NUMBER OF DEVICES:\t%d\n",num_devices);

  //*** Choosing the right device target ****
  //It looks like the way the host is compiled and linked, only the
  //the relevant FPGA device is visible, so we can essentially just
  //pick the first device, and it should work for AOCL and SDACCEL
  //but this is not robust.
  all_device_ids = new cl_device_id[num_devices];

  //test
  #if TARGET==AOCL
    printf("TARGET = AOCL\n");
  #elif TARGET==SDACCEL
    printf("TARGET = SDACCEL\n");
  #elif TARGET==CPU
    printf("TARGET = CPU (Intel)\n");
  #elif TARGET==GPU
    printf("TARGET = GPU (NVIDIA)\n");
  #else
    #error Invalid TARGET definition.
  #endif


  #if (TARGET == GPU)
    err = clGetDeviceIDs  ( platform_id
                          , CL_DEVICE_TYPE_GPU
                          , num_devices
                          , all_device_ids
                          , NULL
                          );
    device_id = all_device_ids[0]; //pick the first device
  //FPGA targets (Identified as Accelerators)
  #elif (TARGET == SDACCEL) || (TARGET == AOCL)
    err = clGetDeviceIDs  ( platform_id
                          , CL_DEVICE_TYPE_ACCELERATOR
                          , num_devices
                          , all_device_ids
                          , NULL
                          );
    device_id = all_device_ids[0]; //pick the first device
  #elif (TARGET == CPU)
    err = clGetDeviceIDs  ( platform_id
                          , CL_DEVICE_TYPE_CPU
                          , num_devices
                          , all_device_ids
                          , NULL
                          );
    device_id = all_device_ids[0]; //pick the first device
  #else
    #error Inbvalid device.
  #endif

  CHECK_ERRORS(err, "Error: Failed to create a device group!\n");
  printf("DEVICE ID:\t\t%d\n",device_id);

  OCLBASIC_PRINT_TEXT_PROPERTY    (CL_DEVICE_NAME                         );
  OCLBASIC_PRINT_TEXT_PROPERTY    (CL_DEVICE_VENDOR                       );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_VENDOR_ID                    , cl_uint );
  OCLBASIC_PRINT_TEXT_PROPERTY    (CL_DEVICE_VERSION                      );
  OCLBASIC_PRINT_TEXT_PROPERTY    (CL_DRIVER_VERSION                      );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_ADDRESS_BITS                 , cl_uint );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_AVAILABLE                    , cl_bool );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_ENDIAN_LITTLE                , cl_bool );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_GLOBAL_MEM_CACHE_SIZE        , cl_ulong);
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_GLOBAL_MEM_CACHELINE_SIZE    , cl_uint );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_GLOBAL_MEM_SIZE              , cl_ulong);
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_IMAGE_SUPPORT                , cl_bool );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_LOCAL_MEM_SIZE               , cl_ulong);
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_MAX_CLOCK_FREQUENCY          , cl_uint);
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_MAX_COMPUTE_UNITS            , cl_uint);
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_MAX_CONSTANT_ARGS            , cl_uint);
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_MAX_CONSTANT_BUFFER_SIZE     , cl_ulong);
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS     , cl_uint );
  //OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_MAX_WORK_GROUP_SIZE          , cl_uint );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_MEM_BASE_ADDR_ALIGN          , cl_uint );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE     , cl_uint );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_PREFERRED_VECTOR_WIDTH_CHAR  , cl_uint );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_PREFERRED_VECTOR_WIDTH_SHORT , cl_uint );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_PREFERRED_VECTOR_WIDTH_INT   , cl_uint );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_PREFERRED_VECTOR_WIDTH_LONG  , cl_uint );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_PREFERRED_VECTOR_WIDTH_FLOAT , cl_uint );
  OCLBASIC_PRINT_NUMERIC_PROPERTY (CL_DEVICE_PREFERRED_VECTOR_WIDTH_DOUBLE, cl_uint );

  printf(HLINE);

  // Create a compute context
  // -----------------------------------------
  context = clCreateContext ( 0
                            , 1
                            , &device_id
                            , NULL
                            , NULL
                            , &err
                            );
  CHECK_ERRORS(err, "Error: Failed to create a compute context!\n");
  printf("Context creation:\tOK\n");

  // Command Queue
  // -----------------------------------------
  commands = clCreateCommandQueue ( context
                                  , device_id
                                  , 0
                                  //, CL_QUEUE_PROFILING_ENABLE
                                  , &err
                                  );
  CHECK_ERRORS(err, "Error: Failed to create a command commands!\n");
  printf("Command Queue creation:\tOK\n");
  printf(HLINE);

  // Create Program Objects - FPGA targets
  // -----------------------------------------
  // For FPGA Kernel build happens offline
  // Load binary from disk
  // binary already built by aocl/sdaccel
  #if (TARGET == AOCL) || (TARGET == SDACCEL)
    unsigned char *kernelbinary;
    char *fpgabin=argv[1];
    //kernel is passed as the argument
    //load kernel binary from file into memory
    printf("OCLH: loading %s\n", fpgabin);
    int n_i = load_file_to_memory(fpgabin, (char **) &kernelbinary);

    if (n_i < 0) {
      printf("Error: Failed to load kernel from fpga-bin: %s\n", fpgabin);
      return EXIT_FAILURE;
    }

    size_t n = n_i;

    // Create the compute program from offline compiled binary
    program = clCreateProgramWithBinary ( context
                                        , 1
                                        , &device_id
                                        , &n
                                        , (const unsigned char **) &kernelbinary
                                        , NULL
                                        , &err
                                        );
    if ((!program) || (err!=CL_SUCCESS)) {
      printf("OCLH: Error: Failed to create compute program from binary %d!\n", err);
      return EXIT_FAILURE;
    }

  //
  // Create Program Objects - CPU targets
  // ------------------------------------
  // TODO: convert to C for uniformit

  #elif (TARGET == CPU) || (TARGET == GPU)
    char *clsource=argv[1];
    printf("OCLH: Reading kernel source: %s\n", clsource);

    std::ifstream in (clsource);
    std::string result  ( (std::istreambuf_iterator<char> (in))
                        , std::istreambuf_iterator<char> ()
                        );
    size_t lengths [1] = { result.size () };
    const char* sources [1] = { result.data () };
    program = clCreateProgramWithSource ( context
                                        , 1
                                        , sources
                                        , lengths
                                        , &err
                                        );
    CHECK_ERRORS (err,"");
    printf("OCLH: Created program with source: %s\n", clsource);
  // Create Program Objects - GPU targets
  // ------------------------------------
  //#elif TARGET == GPU
 //   #error GPU targets not yet configured.
  #else
    #error Invalid TARGET specificaion.
  #endif

  // Build the program -
  // -----------------------------------------
  #if (TARGET==AOCL) || (TARGET==SDACCEL)
    err = clBuildProgram  ( program
                          , 0
                          , NULL
                          , NULL
                          , NULL
                          , NULL
                          );
  #elif (TARGET==CPU) || (TARGET==GPU)
    //char* options = getCpuKernelCompilerOptions(); //TODO
    //char* OPTIONS = OPENCLCOMPILERSTRING;
    //cout << "OPENCLCOMPILERSTRING "<< OPENCLCOMPILERSTRING << endl;
    err = clBuildProgram  ( program
                          , 0
                          , NULL
                          , NULL
                          , NULL
                          , NULL
                          );
//  #elif (TARGET==GPU)
//    #error GPU unsupported.
  #else
    #error Invalid TARGET.
  #endif

  if (err != CL_SUCCESS) {
    size_t len;
    char buffer[2048];

    printf("Error: Failed to build program executable!\n");
    clGetProgramBuildInfo(program, device_id, CL_PROGRAM_BUILD_LOG, sizeof(buffer), buffer, &len);
    printf("%s\n", buffer);
    printf("Test failed\n");
    return EXIT_FAILURE;
  }

  printf("OCLH: Program built\n");

  // Create the kernel - same for all targets?
  // -----------------------------------------
  // Create the compute kernel in the program we wish to run
  const char *kernel_name = "Kernel";
  kernel = clCreateKernel ( program
                          , kernel_name
                          , &err
                          );
  if (!kernel || err != CL_SUCCESS) {
    printf("OCLH: Error: Failed to create compute kernel!\n");
    return EXIT_FAILURE;
  }

  printf("OCLH: Kernel created\n");

  //update the opencl variables in the main's scope, as the local ones will
  //go out of scope
  *context_ref  = context ;       // compute context
  *commands_ref = commands;       // compute command queue
  *program_ref  = program ;       // compute program
  *kernel_ref   = kernel  ;       // compute kernel

}//oclh_opencl_boilerplate

//----------------------------------------------------
// oclh_create_device_buffer()
//----------------------------------------------------
void oclh_create_cldevice_buffer ( cl_mem*        buffer
                                 , cl_context*    context
                                 , cl_mem_flags   flag
) {
  // Create buffer and copy data
  // -----------------------------------------
  // Create the input and output arrays in device memory for our calculation
  //*buffer = clCreateBuffer(*context, CL_MEM_READ_ONLY,  sizeof(stypeHost) * STREAM_ARRAY_SIZE, NULL, NULL);
  *buffer = clCreateBuffer(*context, flag,  sizeof(stypeHost) * STREAM_ARRAY_SIZE, NULL, NULL);

  if (!(*buffer)) {
    CHECK_ERRORS(-1, "OCLH:Error: Failed to allocate device memory!");
  }
  printf("OCLH: Created a buffer of size %d bytes in device memory\n", STREAM_ARRAY_SIZE);

}

//----------------------------------------------------
// oclh_blocking_write_cl_buffer()
//----------------------------------------------------
void oclh_blocking_write_cl_buffer ( cl_command_queue* commands
                                  , cl_mem*           dbuffer
                                  , stypeHost*        hbuffer
) {
  cl_int   err = CL_SUCCESS;
  cl_event writeevent;
  //write array to device memory
  //----------------------------
  err = clEnqueueWriteBuffer  ( *commands
                              , *dbuffer
                              , CL_TRUE
                              , 0
                              , sizeof(stypeHost) * STREAM_ARRAY_SIZE
                              , hbuffer
                              , 0
                              , NULL
                              , &writeevent);
  CHECK_ERRORS(err, "OCLH: Error: Failed to write to source array a!");
  clWaitForEvents(1, &writeevent);
}


//----------------------------------------------------
// oclh_blocking_read_cl_buffer()
//----------------------------------------------------
void oclh_blocking_read_cl_buffer ( cl_command_queue* commands
                                  , cl_mem*           dbuffer
                                  , stypeHost*        hbuffer
) {
  cl_int   err = CL_SUCCESS;
  cl_event readevent;
    //read array from device memory (same buffer to which we wrote)
    //----------------------------
    err = clEnqueueReadBuffer ( *commands
                              , *dbuffer
                              , CL_TRUE
                              , 0
                              , sizeof(stypeHost) * STREAM_ARRAY_SIZE
                              , hbuffer
                              , 0
                              , NULL
                              , &readevent );
    CHECK_ERRORS(err, "Error: Failed to read output array!");
    clWaitForEvents(1, &readevent);
}


//----------------------------------------------------
// oclh_set_kernel_args()
//----------------------------------------------------

void oclh_set_kernel_args ( cl_kernel* kernel
                          , stypeHost* dt
                          , stypeHost* dx
                          , stypeHost* dy
                          , stypeHost* g
                          , stypeHost* eps
                          , stypeHost* hmin
                          , cl_mem*    dev_eta
                          , cl_mem*    dev_un
                          , cl_mem*    dev_u
                          , cl_mem*    dev_wet
                          , cl_mem*    dev_v
                          , cl_mem*    dev_vn
                          , cl_mem*    dev_h
                          , cl_mem*    dev_etan
                          , cl_mem*    dev_hzero
                          ){
  cl_int   err = CL_SUCCESS;
  err  = clSetKernelArg(*kernel, 0, sizeof(stypeHost),  (void *) dt);
  err |= clSetKernelArg(*kernel, 1, sizeof(stypeHost),  (void *) dx);
  err |= clSetKernelArg(*kernel, 2, sizeof(stypeHost),  (void *) dy);
  err |= clSetKernelArg(*kernel, 3, sizeof(stypeHost),  (void *) g);
  err |= clSetKernelArg(*kernel, 4, sizeof(stypeHost),  (void *) eps);
  err |= clSetKernelArg(*kernel, 5, sizeof(stypeHost),  (void *) hmin);
  err |= clSetKernelArg(*kernel, 6, sizeof(cl_mem),     dev_eta);
  err |= clSetKernelArg(*kernel, 7, sizeof(cl_mem),     dev_un);
  err |= clSetKernelArg(*kernel, 8, sizeof(cl_mem),     dev_u);
  err |= clSetKernelArg(*kernel, 9, sizeof(cl_mem),     dev_wet);
  err |= clSetKernelArg(*kernel,10, sizeof(cl_mem),     dev_v);
  err |= clSetKernelArg(*kernel,11, sizeof(cl_mem),     dev_vn);
  err |= clSetKernelArg(*kernel,12, sizeof(cl_mem),     dev_h);
  err |= clSetKernelArg(*kernel,13, sizeof(cl_mem),     dev_etan);
  err |= clSetKernelArg(*kernel,14, sizeof(cl_mem),     dev_hzero);

  CHECK_ERRORS(err, "Error: Failed to set kernel arguments!");
}


//----------------------------------------------------
// oclh_get_global_local_sizes()
//----------------------------------------------------
void oclh_get_global_local_sizes ( size_t* globalSize
                                , size_t* localSize
){
  // --- GLOBAL SIZE ---------
  //API-looping over work-items handled by enquing multiple work-items
  #if (LOOPING==API)
    globalSize[0] = (STREAM_ARRAY_SIZE / VECTOR_SIZE) ;
  //Kernel-looping (explicit). Single work-item launched via API, looping here
  #elif (LOOPING==KERNEL)
    globalSize[0] = 1 ;
  #else
    #error Undefined LOOPING.
  #endif
  printf("Global size = %d \n", globalSize[0]);

  // LOCAL SIZE -----------
  //FPGA
  #ifdef REQ_WORKGROUP_SIZE
    size_t temp[] = {REQ_WORKGROUP_SIZE};
    localSize[0] = temp[0];
    localSize[1] = temp[1];
    localSize[2] = temp[2];
    #define LOCAL_SIZE localSize
    printf("Local Size = %d, %d, %d\n", localSize[0], localSize[1], localSize[2]);
  #else
    #define LOCAL_SIZE NULL
    printf("Local Size = NULL\n");
  #endif
}

//----------------------------------------------------
// oclh_enq_cl_kernel()
//----------------------------------------------------
void oclh_enq_cl_kernel  ( cl_command_queue* commands
                        , cl_kernel*        kernel
                        , size_t*           globalSize
                        , size_t*           localSize
) {
    cl_int   err = CL_SUCCESS;
    cl_event kernelevent;
    // ------------------
    // Kernel
    // ------------------
    err = clEnqueueNDRangeKernel  ( *commands
                                  , *kernel
                                  , 1
                                  , NULL
                                  , globalSize
                                  //,localSize
                                  , LOCAL_SIZE
                                  , 0
                                  , NULL
                                  , &kernelevent
                                  );
    clWaitForEvents(1, &kernelevent);
}


#endif
//#ifdef OCL

//----------------------------------------------------
// oclh_log_results
//----------------------------------------------------
void oclh_log_results  ( stypeHost* a2d
                      , stypeHost* b2d
                      , stypeHost* c2d
){
  printf("OCLH: Logging data to OUT.log\n");
  FILE * myfile;
  myfile = fopen ("OUT.log","w");

  for (int i = 0; i < STREAM_ARRAY_SIZE_DIM1; ++i)
    for (int j = 0; j < STREAM_ARRAY_SIZE_DIM2; ++j) {
      fprintf(myfile, " %d \t %d \t \t:"
                      "  a2d[i][j] = %lf"
#if (KERNELBENCH==ADD) || (KERNELBENCH==TRIAD)
                      "\t b2d[i][j] = %lf"
#endif
                       "\t c2d[i][j] =  %lf\n"
                       ,i
                       ,j
                       ,*(a2d + i*STREAM_ARRAY_SIZE_DIM2 + j)
#if (KERNELBENCH==ADD) || (KERNELBENCH==TRIAD)
                       ,*(b2d + i*STREAM_ARRAY_SIZE_DIM2 + j)
#endif
                       ,*(c2d + i*STREAM_ARRAY_SIZE_DIM2 + j)
       );
  }
  fclose(myfile);
  printf("OCLH: Results from device written to LOG file\n");
}

//----------------------------------------------------
// oclh_verify_results()
//----------------------------------------------------
int oclh_verify_results ( stypeHost* a2d
                        , stypeHost* b2d
                        , stypeHost* c2d
                        , stypeHost scalarval
){
  // verify results
  // -----------------------------------------
  printf(SLINE);

  stypeHost goldval;
  for (int i = 0; i < STREAM_ARRAY_SIZE_DIM1; ++i)
    for (int j = 0; j < STREAM_ARRAY_SIZE_DIM2; ++j) {

      //compute the golden value, depending on the kernel
      #if   KERNELBENCH == COPY
        goldval = (*(a2d + i*STREAM_ARRAY_SIZE_DIM2 + j));
      #elif KERNELBENCH == MUL
        goldval = scalarval * (*(a2d + i*STREAM_ARRAY_SIZE_DIM2 + j));
      #elif KERNELBENCH == ADD
        goldval = (*(a2d + i*STREAM_ARRAY_SIZE_DIM2 + j)) + (*(b2d + i*STREAM_ARRAY_SIZE_DIM2 + j));
      #elif KERNELBENCH == TRIAD
        goldval = (*(a2d + i*STREAM_ARRAY_SIZE_DIM2 + j)) + scalarval * (*(b2d + i*STREAM_ARRAY_SIZE_DIM2 + j));
      #else
        #error Invalid value for macro KERNELBENCH
      #endif

      //compare with result from device
      //if ( (*(c2d + i*STREAM_ARRAY_SIZE_DIM2 + j)) != (*(a2d + i*STREAM_ARRAY_SIZE_DIM2 + j)) ) {
      if ( (*(c2d + i*STREAM_ARRAY_SIZE_DIM2 + j)) != goldval) {
      printf("*** TEST FAILED ***. Device results do not match locally computed results!\n");
      printf("At failure, i = %d, j = %d, expected value = %lf, computed value = %lf\n"
              , i
              , j
              , goldval
              , *(c2d + i*STREAM_ARRAY_SIZE_DIM2 + j) );
        return EXIT_FAILURE;
      }//if
    }//for
  printf("*** TEST PASSED ***. Device results match locally computed results!\n");
  return(1);
//
}

//----------------------------------------------------
// oclh_calculate_bandwidth()
//----------------------------------------------------
void oclh_calculate_performance(
){
  printf(SLINE);
  printf("OCLH: Bandwidth results\n");
  printf(HLINE);
  int  k;

  for (k=1; k<NTIMES; k++) { /* note -- skip first iteration */
        printf ("Time taken by %dth run of the application = %f\n"
                  ,k, time_total_alltimesteps_kernels[k]);
        avgtime = avgtime + time_total_alltimesteps_kernels[k];
        mintime = MIN(mintime, time_total_alltimesteps_kernels[k]);
        maxtime = MAX(maxtime, time_total_alltimesteps_kernels[k]);
  }
//
//  //--- MEAN ---
//  avgtime = avgtime/(double)(NTIMES-1);
//
//  //--- RELATIVE STANDARD DEVIATION ---
//  for (k=1; k<NTIMES; k++) { /* note -- skip first iteration */
//      relstdev = relstdev + pow((time_total_alltimesteps_kernels[k]-avgtime), 2); //accumulate (x-m)^2
//  }
//
//  relstdev = relstdev /(double)(NTIMES-1);  //variance
//  relstdev = sqrt(relstdev);                //stdev
//  relstdev = relstdev/avgtime;           //relative stdev
//
//  //--- LOG ---
//  printf("Function    Best (MB/s)   Worst (MB/s)   Avg (MB/s)  RelStdev  Avg time     Min time     Max time\n");
//  printf("%s%12.1f %12.1f %12.1f %12.2f %11.6f  %11.6f  %11.6f\n", label,
//          1.0E-06 * bytes/mintime, 1.0E-06 * bytes/maxtime, 1.0E-06 * bytes/avgtime,
//          relstdev,
//          avgtime,
//          mintime,
//          maxtime);
//  printf(HLINE);
//
//  //print summary to file as well (ugly! combine print to screen and file in a single place)
//  FILE * rfile;
//  rfile = fopen ("RESULTS.log","w");
//
//  fprintf (rfile, "Function    Best (MB/s)   Worst (MB/s)   Avg (MB/s)  RelStdev  Avg time     Min time     Max time\n");
//  fprintf(rfile, "%s%12.1f %12.1f %12.1f %12.2f %11.6f  %11.6f  %11.6f\n", label,
//     1.0E-06 * bytes/mintime, 1.0E-06 * bytes/maxtime, 1.0E-06 * bytes/avgtime,
//     relstdev,
//     avgtime,
//     mintime,
//     maxtime);
//  fprintf(rfile, HLINE);
//  fclose (rfile);
//  printf("OCLH: Results of BW from benchmark written to file: RESULTS.log\n");
}

//----------------------------------------------------
// oclh_disp_timing_profile()
//----------------------------------------------------
void oclh_disp_timing_profile(){
//  printf(SLINE);
//  printf("Application overall timing profile\n");
//  printf(HLINE);
//  printf ("Transfer of arrays from host to device took : %f s\n", time_a2d_togpu);
//  printf ("All kernel executions in total took   : %f s\n", time_kernels);
//  printf ("Transfer of c2d from GPU to host took : %f s\n", time_c2d_tohost);
//  #if LOGRESULTS
//  printf ("Writing results to file took          :  %f s\n", time_write2file);
//  #endif
//  printf ("Verification of results took          :  %f s\n", time_verify);
}

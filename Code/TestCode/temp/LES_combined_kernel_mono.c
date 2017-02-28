// This is the combined kernel (super-kernel)
// GPU kernel is the default, can be set on scons command line with kernel=...
//256
// Physical property set
// IBM parameter set (Feedback force by Goldstein)
inline float SQR(float x) {return x*x; }
inline float sqr(float x) {return x*x; }
inline unsigned int FTNREF3D(
                int ix, int jx, int kx,
                        unsigned int iz,unsigned int jz,
                                int i_lb, int j_lb, int k_lb
                                        ) {
        return (iz*jz*(kx-k_lb)+iz*(jx-j_lb)+ix-i_lb);
}
inline unsigned int FTNREF3D0(
                int ix, int jx, int kx,
                        unsigned int iz,unsigned int jz
                                ) {
        return iz*jz*kx+iz*jx+ix ;
}
inline unsigned int FTNREF1D(int ix,int i_lb) {
            return ix-i_lb;
}
// These functions take the lower and upper bounds, rather than the range and the lower bound
inline unsigned int FTNREF3Du(int ix,int jx,int kx,unsigned int i_ub,unsigned int j_ub,int i_lb,int j_lb,int k_lb) {
    return (i_ub - i_lb + 1)*(j_ub - j_lb + 1)*(kx - k_lb)+(i_ub - i_lb + 1)*(jx - j_lb)+(ix - i_lb);
}
// For lower bounds all 0
inline unsigned int FTNREF3Du0(int ix,int jx,int kx,unsigned int i_ub,unsigned int j_ub) {
    return (i_ub + 1)*(j_ub + 1)*kx+(i_ub + 1)*jx+ix;
}
//#define 1 1
inline int4 calc_loop_iters(int idx, int im, int jm, int km, int i_off, int j_off, int k_off) {
    int4 ijk;
    // jki
    int ik_range = km*im;
    ijk.s1=  j_off + idx/ik_range; //j
    ijk.s2 = k_off + idx % ik_range / im; //k
    ijk.s0 = i_off + idx % im; //i
    return ijk;
}
// WV: TODO: I suppose I could use an enum
// Also, this could go into a header file
// TODO: considering that im,jm,km are always identical to ip,jp,kp which are constants,
// I could simply define the constants using macros and remove these pesky arguments
// module_velnw__bondv1_init_uvw_ocl -> TODO: maybe merge with bondv1?
void velnw__bondv1_init_uvw_kernel (
     float2 * p,
     float4 * uvw,
     float4 * fgh,
     float * dxs,
     float * dys,
     float * dzs,
     float * dzn,
     float * z2,
     unsigned int* n_ptr,
    const unsigned int im,
    const unsigned int jm,
    const unsigned int km,
    const float dt
        ) ;
// module_bondv1
void bondv1_calc_uout_kernel (
		 float* aaat,
		 float* bbbt,
     float4 * uvw,
     float * uout_ptr,
     float * aaa_chunks,
     float * bbb_chunks,
    const unsigned int im,
    const unsigned int jm,
    const unsigned int km
);
void bondv1_calc_uvw_kernel(
         float4* uvw,
         float4 *uvwsum,
         float4* fgh,
         float4 *mask1,
         float16* diu,
         float * dxs,
         float* dzs,
         float* dx1,
         float* dy1,
         float* dzn,
         float *sm,
         float * uout_ptr,
        const float dt,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
        ) ;
//#include "velfg_kernel.h" // CPU OK
// module_les_ocl
//#include "feedbf__les_calc_sm_kernel.h" // CPU OK
void vel2(
     float4 * uvw,
     float16 * diu,
	float16* cov_ijk,
	float16* cov_ijk_p1,
	float16* diu_ijk,
	float16* diu_ijk_p1,
     float * dzs,
     float * dx1,
     float * dy1,
     float * dzn,
    const unsigned int im,
    const unsigned int jm,
    const unsigned int km,
    int i,int j,int k
	);
void velfg__feedbf__les_calc_sm_kernel(
         float4* uvw,
         float4 *uvwsum,
         float4* fgh,
         float4 *mask1,
         float16* diu,
         float * dxs,
         float* dzs,
         float* dx1,
         float* dy1,
         float* dzn,
         float *sm,
         float * uout_ptr,
        const float dt,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
        ) ;
void les_bound_sm_kernel (
         float4 *fgh,
         float *dx1, float *dy1, float *dzn,
         float16 *diu,
         float *sm,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
        );
void les_calc_visc__adam_kernel (
		 float4 *fgh,
		 float4 *fgh_old,
		 float *dx1, float *dy1, float *dzn,
		 float16 *diu,
		 float *sm,
		const unsigned int im,
		const unsigned int jm,
		const unsigned int km
);
// module_press_ocl
void bondfgc_ ( float4 *fgh,const int im,const int jm,const int km,int i,int j, int k) ;
void press_rhsav_kernel (
		   float* rhsavs_th,
		   float* areas_th,
		 float4* uvw,
		 float4* fgh,
         float *rhs,
		 float *dx1, float *dy1, float *dzn,
         float* chunks_num,
         float* chunks_denom,
        const float dt,
		const unsigned int im,
		const unsigned int jm,
		const unsigned int km
		        );
//#define NITERS 20000
//#define WASTE_TIME
//#define POISON_CACHE
float calc_reltmp0(
         float2* p_scratch,
         float* rhs,
        float rhsav,
        const  float *cn1,
        const  float *cn2l,const  float *cn2s,
        const  float *cn3l,
        const  float *cn3s,
        const  float *cn4l,
        const  float *cn4s,
        unsigned int i, unsigned int j, unsigned int k,
        const unsigned int ip,
        const unsigned int jp,
        const unsigned int kp
        ) ;
float calc_reltmp1(
         float2* p_scratch,
         float* rhs,
        float rhsav,
        const  float *cn1,
        const  float *cn2l,const  float *cn2s,
        const  float *cn3l,
        const  float *cn3s,
        const  float *cn4l,
        const  float *cn4s,
        unsigned int i, unsigned int j, unsigned int k,
        const unsigned int ip,
        const unsigned int jp,
        const unsigned int kp
        ) ;
float calc_reltmp_mp_rb(
		 float2* p_scratch,
         float* rhs,
        float rhsav,
        const  float *cn1,const  float *cn2l,const  float *cn2s,const  float *cn3l,const  float *cn3s,const  float *cn4l,const  float *cn4s,
        unsigned int i, unsigned int j, unsigned int k,
        unsigned int j_lhs,unsigned int k_lhs,
        unsigned int nrd,
        const unsigned int ip,
        const unsigned int jp,
        const unsigned int kp
        ) ;
float calc_reltmp_mp_db(
		 float2* p_scratch,
         float* rhs,
        float rhsav,
        const  float *cn1,const  float *cn2l,const  float *cn2s,const  float *cn3l,const  float *cn3s,const  float *cn4l,const  float *cn4s,
        unsigned int i, unsigned int j, unsigned int k,
        unsigned int j_lhs,unsigned int k_lhs,
        unsigned int nrd,
        const unsigned int ip,
        const unsigned int jp,
        const unsigned int kp
        ) ;
// ====================================================== 2 ===========================================================
void press_sor_kernel (
         float* sor_chunks,
//         float* tmp_chunks,
         float4* uvw,
//         float* p,
         float2* p_scratch,
         float *rhs,
        const  float *cn1,const  float *cn2l,const  float *cn2s,const  float *cn3l,const  float *cn3s,const  float *cn4l,const  float *cn4s,
         float *chunks_num,
         float *chunks_denom,
         float *val_ptr,
         unsigned int *nrd_ptr,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
        );
void press_pav_kernel (
		 float* pavs_th,
		 float* pcos_th,
         float2* p2,
         float *dx1, float *dy1, float *dzn,
		 float *chunks_num,
		 float *chunks_denom,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
		);
void press_adj_kernel (
         float2* p2,
         float *pav_ptr,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
        );
void boundp12c_( float2 *p2,const unsigned int im,const unsigned int jm,const unsigned int km);
void boundp_new ( float2 *p2,const unsigned int im,const unsigned int jm,const unsigned int km,unsigned int idx_g,unsigned int idx_l);
// ====================================================== 2 ===========================================================
void press_boundp_kernel (
		 float2* p2,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
        );
// --------------------------------------------------------------------------------
// The actual kernel
// --------------------------------------------------------------------------------
__kernel void LES_combined_kernel_mono (
//		 float* p,
		 float2* p2,
		 float4* uvw,
		 float4* uvwsum,
		 float4* fgh,
		 float4* fgh_old,
		 float* rhs,
		const  float4* mask1,
		 float16* diu,
		 float* sm,
		const  float* dxs,
		const  float* dys,
		const  float* dzs,
		const  float* dx1,
		const  float* dy1,
		const  float* dzn,
		const  float* z2,
		const  float* cn1,
		const  float* cn2l,
		const  float* cn2s,
		const  float* cn3l,
		const  float* cn3s,
		const  float* cn4l,
		const  float* cn4s,
		 float* val_ptr, // we use this for any transfer of scalar values
		 float* chunks_num,
		 float* chunks_denom,
		 unsigned int* n_ptr, // also used for nrd
		 unsigned int* state_ptr,
		const float dt,
		const unsigned int im,
		const unsigned int jm,
		const unsigned int km
        ) {
	unsigned int gl_id = get_global_id(0);
	unsigned int gr_id = get_group_id(0);
	unsigned int l_id =  get_local_id(0);
	 float loc_th_1[128];
	 float loc_th_2[128];
    int n = *n_ptr;
    int state = *state_ptr;
    switch (state) {
        case 0:
            {
            	if (gl_id==0) {
                // do nothing
            	}
                break;
            }
        case 1:
            {
            	velnw__bondv1_init_uvw_kernel(p2, uvw, fgh, dxs, dys, dzs, dzn,
            			z2,
            			n_ptr, im, jm, km,dt);
                break;
            }
        case 2:
            {
                bondv1_calc_uout_kernel(
                		loc_th_1, loc_th_2,
                		uvw,
                		val_ptr,
                		chunks_num,
                		chunks_denom,
                		im, jm, km
                );
                break;
            }
        case 3:
            {
            	// diu is UNUSED
            	bondv1_calc_uvw_kernel(
            			uvw,uvwsum,fgh,mask1,diu,dxs,dzs,dx1,dy1,dzn,sm,val_ptr,dt,im,jm,km
            	);
                break;
            }
        case 4:
            {
            	velfg__feedbf__les_calc_sm_kernel(
            			uvw,uvwsum,fgh,mask1,diu,dxs,dzs,dx1,dy1,dzn,sm,val_ptr,dt,im,jm,km
            	);
                break;
            }
//        case 31:
//            {
//            	velfg_kernel(
//            			uvw,fgh,diu,dzs,dx1,dy1,dzn,val_ptr,im,jm,km
//            	);
//                break;
//            }
//
//        case 32:
//            {
//            	feedbf__les_calc_sm_kernel(
//            			uvw,uvwsum,fgh,mask1,diu,dxs,dzs,dx1,dy1,dzn,sm,val_ptr,dt,im,jm,km
//            	);
//                break;
//            }
        case 5:
            {
                les_bound_sm_kernel(fgh,  dx1,dy1,dzn,diu, sm, im, jm, km);
                break;
            }
        case 6:
            {
                les_calc_visc__adam_kernel (
                		fgh,
                		fgh_old,
                		dx1,dy1,dzn,
                		diu,
                		sm,
                		im,
                		jm,
                		km
                );
                break;
            }
        case 7:
            {
                press_rhsav_kernel(
                		loc_th_1, loc_th_2,
				uvw, fgh, rhs, dx1,dy1,dzn,
		      chunks_num, chunks_denom,
		      dt,im, jm, km
		      );
            break;
            }
        case 8:
            {
                press_sor_kernel(
                		loc_th_1,
//                		loc_th_2,
                		uvw,
//                		p,
                		p2,
                		rhs, cn1,cn2l,cn2s,cn3l,cn3s,cn4l,cn4s,
                		chunks_num, chunks_denom, val_ptr, n_ptr,
                		im, jm, km
                );
                break;
            }
        case 9:
            {
                press_pav_kernel(loc_th_1, loc_th_2,p2,dx1,dy1,dzn,chunks_num, chunks_denom, im, jm, km );
                break;
            }
        case 10:
            {
                press_adj_kernel(p2, val_ptr, im, jm, km );
                break;
            }
        case 11:
            {
                press_boundp_kernel(p2, im, jm, km);
                break;
            }
        default:
            n=1;
            // do nothing
    };
} // END of LES_kernel
// ====================================================== SUBKERNEL DEFINITIONS ===========================================================
 void velnw__bondv1_init_uvw_kernel (
     float2 * p,
     float4 * uvw,
     float4 * fgh,
     float * dxs,
     float * dys,
     float * dzs,
     float * dzn,
     float * z2,
     unsigned int* n_ptr,
    const unsigned int im,
    const unsigned int jm,
    const unsigned int km,
    const float dt
        ) {
  const unsigned int ip = im;
  const unsigned int jp = jm;
  const unsigned int kp = km;
  unsigned int n = *n_ptr;
  const float inv_ro = 1/1.1763;
  unsigned int idx = get_global_id(0);
  if (idx<(im+1)*jm*km) {
//	  uvw[idx]=(float4)(0.0f, 0.0f, 0.0f, 0.0f);
  int4 ijk = calc_loop_iters(idx,im+1,jm,km,0,1,1); // i starts at 0
  int j = ijk.s1;
  int k = ijk.s2;
  int i = ijk.s0;
	if (i>0) {
		float mp_ijk = -p[FTNREF3D0(i,j,k,ip+3,jp+3)].s0  ;
		float pzu = inv_ro*(mp_ijk + p[FTNREF3D0(i + 1,j,k,ip+3,jp+3)].s0) / dxs[i];
		float pzv = inv_ro*(mp_ijk + p[FTNREF3D0(i,j + 1,k,ip+3,jp+3)].s0) / dys[j];
		float pzw = inv_ro*(mp_ijk + p[FTNREF3D0(i,j,k + 1,ip+3,jp+3)].s0) / dzs[k-1];
		float4 uvw_ijk = uvw[FTNREF3D(i,j,k,ip+2,jp+3,0,-1,-1)];
		float4 fgh_ijk = fgh[FTNREF3D0(i,j,k,ip+1,jp+1)];
		uvw_ijk.s0 += dt * (fgh_ijk.s0 - pzu);
		uvw_ijk.s1 += dt * (fgh_ijk.s1 - pzv);
		if (k!=km) {
		uvw_ijk.s2 += dt * (fgh_ijk.s2 - pzw);
		}
		uvw_ijk.s3 = 0.0F;
		uvw[FTNREF3D(i,j,k,ip+2,jp+3,0,-1,-1)]=uvw_ijk;
	}
// WV: For model coupling, and actually to make it more generic anyway, this code should be taken out
// Instead, we should transfer the wind profile from the host
// This means I need a wind profile array over all j and k
	if (i<2) { // so i = 0 or 1
		float uval = 5.0f * pow(((z2[k-1] + 0.5f * dzn[k+1]) / 600.0f),0.2f);
		if (k>78) {
		   uval = uvw[FTNREF3D(i,j,77,ip+2,jp+3,0,-1,-1)].s0;
		}
		uvw[FTNREF3D(i,j,k,ip+2,jp+3,0,-1,-1)]=(float4)(uval, 0.0f, 0.0f, 0.0f);
	}
	else { // on the first time step, copy the values from i==1 to all i
		if ( n == 1 ) {
			uvw[FTNREF3D(i,j,k,ip+2,jp+3,0,-1,-1)] = uvw[FTNREF3D(1,j,k,ip+2,jp+3,0,-1,-1)];
		}
	}
} // idx range
}
 void bondv1_calc_uout_kernel (
		 float* aaat,
		 float* bbbt,
     float4* uvw,
     float* uout_ptr,
     float* aaa_chunks,
     float* bbb_chunks,
    const unsigned int im,
    const unsigned int jm,
    const unsigned int km
        ) {
	const int ip=im;
	const int jp=jm;
	const int kp=km;
// On my Mac, local mem does not work. So we simply create jp threads that loop over k and i
	unsigned int l_id = get_local_id(0);
	unsigned int gl_id = get_global_id(0);
	unsigned int gr_id =  get_group_id(0);
	unsigned int nunits = get_num_groups(0);
	  unsigned int j_range = jm;
		unsigned int j_start =  (j_range / nunits)*gr_id;
		unsigned int j_stop = (j_range / nunits)*(gr_id+1);
		if (gr_id==nunits-1) {
			j_stop=j_range;
		}
//	unsigned int j =  get_group_id(0)+1;
		float maxa = 0.0f; //
		float minb = 0.0f; // this should of course be a large number to be correct!
		 // we could of course do a limited number of threads
		 // if km is not divisible by 128, we need to correct
		 unsigned int kl_bound = (km % 128) == 0 ? km/128 : km/128 +1;
		 for (unsigned int jl=j_start;jl<j_stop;jl++) {
			 unsigned int j = jl+1;
		  for (unsigned int kl=0;kl<kl_bound;kl++) {
			  unsigned int k = 1+kl*128 +l_id;
			  if (k<=km) {
				  float u_im_j_k=uvw[FTNREF3D(im,j,k,ip+2,jp+3,0,-1,-1)].s0;
				  maxa = fmax(maxa,u_im_j_k);
				  minb = fmin(minb,u_im_j_k);
			  }
		  }
		 }
		 aaat[l_id] = maxa;
		 bbbt[l_id] = minb;
		  barrier(CLK_LOCAL_MEM_FENCE);
		  if (l_id==0) {
			float aaa=0.0f;
		  	float bbb=0.0f; // So I not this will be 0 unless one of the uvw[] values is smaller than 0!
		    for (unsigned int jj=0;jj<128;jj++) {
		        aaa=fmax(aaat[jj],aaa);
		        bbb=fmin(bbbt[jj],bbb);
		    }
		    aaa_chunks[gr_id] = aaa ;
		    bbb_chunks[gr_id] = bbb ;
		  }
}
 void bondv1_calc_uvw_kernel(
         float4* uvw,
         float4 *uvwsum,
         float4* fgh,
         float4 *mask1,
         float16* diu, // UNUSED
         float * dxs,
         float* dzs,
         float* dx1,
         float* dy1,
         float* dzn,
         float *sm,
         float * uout_ptr,
        const float dt,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
        ) {
    const float vn = 15.83F*1E-6F; // FIXME: taken from set.f, should maybe be a macro?
    const float alpha = -10.0F; // FIXME: should be macro
    const float beta = -1.0F; // FIXME: should be macro
    const float cs0 = 0.1F;// FIXME: should be macro
    const float csx1 = cs0;
    const unsigned int ip = im;
    const unsigned int jp = jm;
	const unsigned int kp = km;
	unsigned int idx=get_global_id(0);
// BONDV1_CALC_UVW
	unsigned int gl_id=idx;
    float uout = *uout_ptr;
// 0:ip+1,=> ip+2; -1:jp+1 => jp+3; -1:kp+1 => kp+3  :: uvw
    if (gl_id < (km*jm) ) {
    	unsigned int k = (gl_id / jm) + 1;
    	unsigned int j = (gl_id % jm) + 1;
    		  float4 uvw_im_j_k =  uvw[FTNREF3D(im,j,k,ip+2,jp+3,0,-1,-1)];
    	      float4 uvw_imp1_j_k = uvw[FTNREF3D(im + 1,j,k,ip+2,jp+3,0,-1,-1)] ;
    	      float4 uvw_imm1_j_k = uvw[FTNREF3D(im - 1,j,k,ip+2,jp+3,0,-1,-1)];
    	      float u_im_j_k = uvw_im_j_k.s0;
    	      float v_im_j_k = uvw_im_j_k.s1;
    	      float w_im_j_k = uvw_im_j_k.s2;
    	      float u_imm1_j_k = uvw_imm1_j_k.s0;
    	      float v_imp1_j_k = uvw_imp1_j_k.s1 ;
    	      float w_imp1_j_k = uvw_imp1_j_k.s2;
    	      u_im_j_k   = u_im_j_k   - dt * uout * (u_im_j_k   - u_imm1_j_k) / dxs[im]; // NaN!
    	      v_imp1_j_k = v_imp1_j_k - dt * uout * (v_imp1_j_k - v_im_j_k )  / dxs[im];
    	      w_imp1_j_k = w_imp1_j_k - dt * uout * (w_imp1_j_k - w_im_j_k )  / dxs[im];
    	      // Now reassign to memory
    	      uvw_im_j_k = (float4)(u_im_j_k,v_im_j_k,w_im_j_k,0.0f );
    	      uvw[FTNREF3D(im,j,k,ip+2,jp+3,0,-1,-1)]=uvw_im_j_k; // causes error in uvwsum
    	      uvw_imp1_j_k = (float4)(uvw_imp1_j_k.s0,v_imp1_j_k,w_imp1_j_k,0.0f );
    	      uvw[FTNREF3D(im + 1,j,k,ip+2,jp+3,0,-1,-1)]=uvw_imp1_j_k;
    } else if (gl_id < (km*jm)+ (km+2)*(im+2) ) {
    	//! --side flow condition; periodic
    	unsigned int k = (gl_id - (km*jm)) / (im+2);
    	unsigned int i = (gl_id - (km*jm)) % (im+2);
    	          float4 uvw_i_0_k = uvw[FTNREF3D(i,0,k,ip+2,jp+3,0,-1,-1)];
    	          float4 uvw_i_1_k = uvw[FTNREF3D(i,1,k,ip+2,jp+3,0,-1,-1)];
    	          float4 uvw_i_jm_k = uvw[FTNREF3D(i,jm,k,ip+2,jp+3,0,-1,-1)];
    	          float4 uvw_i_jmp1_k = uvw[FTNREF3D(i,jm+1,k,ip+2,jp+3,0,-1,-1)];
    	          uvw_i_0_k.s0 = uvw_i_jm_k.s0; //
    	          uvw_i_jmp1_k.s0 = uvw_i_1_k.s0; //
    	          uvw_i_0_k.s1 = uvw_i_jm_k.s1; //
    	          uvw_i_jmp1_k.s1 = uvw_i_1_k.s1;//
    	          if (k<km+1) {
    	          uvw_i_0_k.s2 = uvw_i_jm_k.s2; //
    	          uvw_i_jmp1_k.s2 = uvw_i_1_k.s2; //
    	          }
    	          // Now reassign to memory
    	          uvw[FTNREF3D(i,0,k,ip+2,jp+3,0,-1,-1)]=uvw_i_0_k;  // causes main error in uvwsum
    	          uvw[FTNREF3D(i,jm+1,k,ip+2,jp+3,0,-1,-1)]=uvw_i_jmp1_k;  // causes error in uvwsum
    } else if (gl_id <  (km*jm)+ (km+2)*(im+2)+(im+3)*(jm+3)) {
    	// the reason for this condition is that it allows us to pad the range to be a multiple of 32/64 etc
    	//! -------top and underground condition
    	unsigned int j = (gl_id - (km*jm)- (km+2)*(im+2)) / (im+3) - 1;
    	unsigned int i = (gl_id - (km*jm) - (km+2)*(im+2)) % (im+3) - 1;
        float4 uvw_i_j_0 =  uvw[FTNREF3D(i,j,0,ip+2,jp+3,0,-1,-1)];
        float4 uvw_i_j_1 =  uvw[FTNREF3D(i,j,1,ip+2,jp+3,0,-1,-1)];
        float4 uvw_i_j_km = uvw[FTNREF3D(i,j,km,ip+2,jp+3,0,-1,-1)];
        float4 uvw_i_j_kmp1 = uvw[FTNREF3D(i,j,km+1,ip+2,jp+3,0,-1,-1)];
        if ( (j>-1 && j< jm+1) && (i>-1) ) {
        uvw_i_j_0.s0 = -uvw_i_j_1.s0;
        uvw_i_j_kmp1.s0 = uvw_i_j_km.s0;
        uvw_i_j_0.s1 = -uvw_i_j_1.s1;
        uvw_i_j_kmp1.s1 = uvw_i_j_1.s1;
        }
        uvw_i_j_0.s2 = 0.0F;
        uvw_i_j_km.s2 = 0.0F;
        uvw[FTNREF3D(i,j,0,ip+2,jp+3,0,-1,-1)] = uvw_i_j_0;
        uvw[FTNREF3D(i,j,km + 1,ip+2,jp+3,0,-1,-1)] = uvw_i_j_kmp1;
        uvw[FTNREF3D(i,j,km,ip+2,jp+3,0,-1,-1)] = uvw_i_j_km;
    }
} // END of bondv1_calc_uvw_kernel
//#include "velfg_kernel.cl"
//#include "feedbf__les_calc_sm_kernel.cl"
// Problem is that there must be a bug as this does leads to divergence in SOR!
//#define NEW_VELFG
// This is the unified loop of vel2, this replaces the call to the original vel2. I guess I can wrap it in the vel2 function.
 void velfg__feedbf__les_calc_sm_kernel(
         float4* uvw,
         float4 *uvwsum,
         float4* fgh,
         float4 *mask1,
         float16* diu,
         float * dxs,
         float* dzs,
         float* dx1,
         float* dy1,
         float* dzn,
         float *sm,
         float * uout_ptr,
        const float dt,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
        ) {
    const float vn = 1.583e-05F; // FIXME: taken from set.f, should maybe be a macro?
    const float alpha = -10.0F; // FIXME: should be macro
    const float beta = -1.0F; // FIXME: should be macro
    const float cs0 = 0.1F;// FIXME: should be macro
    const float csx1 = cs0;
    const unsigned int ip = im;
    const unsigned int jp = jm;
	const unsigned int kp = km;
	unsigned int idx=get_global_id(0);
	unsigned int gl_id=get_global_id(0);
//	if (gl_id == 0) {
//	for (unsigned int idx = 0;idx<im*jm*km;idx++) {
	if (idx<im*jm*km) {
    int4 ijk=calc_loop_iters(idx,im,jm,km,1,1,1); // so all ranges 1..im, 1..jm, 1..km, and we go to ip+1 for dx1, OK
    int j = ijk.s1;
    int k = ijk.s2;
    int i = ijk.s0;
// VELFG
    float16 cov_ijk, cov_ijk_p1, diu_ijk, diu_ijk_p1;
    float4 fgh_ijk;
    vel2(
            uvw, //  float4*
            diu, //  float16*
            &cov_ijk, &cov_ijk_p1, // float16;
            &diu_ijk, &diu_ijk_p1, // float16;
            dzs, dx1, dy1, dzn, //  float*
            im, jm, km, // const unsigned int
            i,j,k
        );
      float covx1 = (dx1[i+2]*cov_ijk.s0+dx1[i+1]*cov_ijk_p1.s0) /(dx1[i+1]+dx1[i+2]);
      float covy1 = (cov_ijk.s1+cov_ijk_p1.s1)/2.0F;
      float covz1 = (cov_ijk.s2+cov_ijk_p1.s2)/2.0F;
      float covc = covx1+covy1+covz1;
      float dfu1_ijk = 2.0F*(-diu_ijk.s0+diu_ijk_p1.s0)/(dx1[i+1]+dx1[i+2]) + (-diu_ijk.s1+diu_ijk_p1.s1)/dy1[j] +   (-diu_ijk.s2+diu_ijk_p1.s2)/dzn[k+1];
      float df = vn*dfu1_ijk;
      fgh_ijk.s0 = (-covc+df);
      covx1 = (cov_ijk.s3+cov_ijk_p1.s3)/2.0F;
      covy1 = (dx1[j+1]*cov_ijk.s4+dx1[j]*cov_ijk_p1.s4) /(dx1[j]+dx1[j+1]);
      covz1 = (cov_ijk.s5+cov_ijk_p1.s5)/2.0F;
      covc = covx1+covy1+covz1;
      float dfv1_ijk = (-diu_ijk.s3+diu_ijk_p1.s3)/dx1[i+1] +2.0F*(-diu_ijk.s4+diu_ijk_p1.s4)/(dy1[j]+dy1[j+1]) +(-diu_ijk.s5+diu_ijk_p1.s5)/dzn[k+1];
      float dg = vn*dfv1_ijk;
      fgh_ijk.s1 = (-covc+dg); // FIXME: could we use fgh[i,j,k] instead?
      // what happens if we would set this for k=km? Apparently, nothing!
//      if (k!=km) {
          covx1 = (cov_ijk.s6+cov_ijk_p1.s6)/2.0F;
          covy1 = (cov_ijk.s7+cov_ijk_p1.s7)/2.0F;
          covz1 = (dzn[k+1+1]*cov_ijk.s8+dzn[k+1]*cov_ijk_p1.s8) /(dzn[k+1]+dzn[k+1+1]);
          covc = covx1+covy1+covz1;
          float dfw1_ijk= (-diu_ijk.s6+diu_ijk_p1.s6)/dx1[i+1] +(-diu_ijk.s7+diu_ijk_p1.s7)/dy1[j] +(-diu_ijk.s8+diu_ijk_p1.s8)/dzs[k+1];
          float dh = vn*dfw1_ijk;
          fgh_ijk.s2 = (-covc+dh);
//      }
//          fgh[FTNREF3Du0(i,j,k,im,jm) ]= fgh_ijk;
// FEEDBF
  	  	float4 uvw_ijk = uvw[FTNREF3D(i,j,k,ip+2,jp+3,0,-1,-1)]; // 0:ip+1,-1:jp+1,-1:kp+1 => ip+2, jp+3, 0,-1,-1
  	    float4 uvwsum_ijk = uvwsum[FTNREF3D0(i,j,k,ip+1,jp+1)]; //  save time! RISKY!
  	    float4 mask1_ijk = mask1[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)];// -1:ip+1,-1:jp+1,0:kp+1 => ip+3, jp+3, -1,-1,0
//  	    float4 fgh_ijk= fgh[FTNREF3D0(i,j,k,ip+1,jp+1)];
  	    uvwsum_ijk.s0 = (uvwsum_ijk.s0 + uvw_ijk.s0)*mask1_ijk.s0;
  	    uvwsum_ijk.s1 = (uvwsum_ijk.s1 + uvw_ijk.s1)*mask1_ijk.s1;
  	    uvwsum_ijk.s2 = (uvwsum_ijk.s2 + uvw_ijk.s2)*mask1_ijk.s2;
        float f1x = alpha * uvwsum_ijk.s0 * dt;
        float f1y = alpha * uvwsum_ijk.s1  * dt;
        float f1z = alpha * uvwsum_ijk.s2  * dt;
        float f2x = beta * uvw_ijk.s0 * mask1_ijk.s0;
        float f2y = beta * uvw_ijk.s1 * mask1_ijk.s1;
        float f2z = beta * uvw_ijk.s2 * mask1_ijk.s2;
        float fx = f1x + f2x;
        float fy = f1y + f2y;
        float fz = f1z + f2z;
        fgh_ijk.s0 += fx;
        fgh_ijk.s1 += fy;
        fgh_ijk.s2 += fz;
        fgh_ijk.s3=0.0F;
        fgh[FTNREF3D0(i,j,k,ip+1,jp+1)]= fgh_ijk;
        uvwsum[FTNREF3D0(i,j,k,ip+1,jp+1)] = uvwsum_ijk;
// LES_CALC_SM
  // 9vec: -1:ip+2,0:jp+2,0:kp+2 => ip+2 - (-1) + 1 ,jp+2 - 0 + 1, -1,0,0 = ip+4,jp+3,-1,0,0
  // 8x
  //float16
  diu_ijk=diu[FTNREF3D(i,j,k,ip+4,jp+3,-1,0,0)];
  // 2x
  float16 diu_im1_jk = diu[FTNREF3D(i - 1,j,k,ip+4,jp+3,-1,0,0)] ;
  float16 diu_i_jp1_k = diu[FTNREF3D(i,j + 1,k,ip+4,jp+3,-1,0,0)];
  float16 diu_i_jm1_k = diu[FTNREF3D(i,j - 1,k,ip+4,jp+3,-1,0,0)];
  float16 diu_ij_kp1 = diu[FTNREF3D(i,j,k + 1,ip+4,jp+3,-1,0,0)];
  float16 diu_ip1_jk = diu[FTNREF3D(i + 1,j,k,ip+4,jp+3,-1,0,0)];
  float16 diu_ij_km1 = diu[FTNREF3D(i,j,k - 1,ip+4,jp+3,-1,0,0)];
  // 1x
  float16 diu_im1_jp1_k = diu[FTNREF3D(i - 1,j + 1,k,ip+4,jp+3,-1,0,0)];
  float16 diu_im1_j_kp1 = diu[FTNREF3D(i - 1,j,k + 1,ip+4,jp+3,-1,0,0)];
  float16 diu_ip1_jm1_k = diu[FTNREF3D(i + 1,j - 1,k,ip+4,jp+3,-1,0,0)];
  float16 diu_ip1_j_km1 = diu[FTNREF3D(i + 1,j,k - 1,ip+4,jp+3,-1,0,0)];
  float16 diu_i_jm1_kp1 = diu[FTNREF3D(i,j - 1,k + 1,ip+4,jp+3,-1,0,0)];
  float16 diu_i_jp1_km1 = diu[FTNREF3D(i,j + 1,k - 1,ip+4,jp+3,-1,0,0)];
  //! --length scale
//! ----
  // brought inside loop for parallelization
	float delx1_ = cbrt( dx1[FTNREF1D(0,-1)] * dy1[FTNREF1D(0,0)] * dzn[FTNREF1D(k,-1)] );  // cube root
	float cs_dx = SQR((csx1 * delx1_));
//! --calculation of sgs eddy viscosity coeficient
	float dudxx1 = diu_ijk.s0;
	// i-1,j,k ; i-1,j+1,k ; i,j,k, i, j+1,k
	float dudyx1 = (diu_im1_jk.s1 + diu_im1_jp1_k.s1 + diu_ijk.s1 + diu_i_jp1_k.s1) * 0.25F;
	float dudzx1 = (diu_im1_jk.s2 + diu_im1_j_kp1.s2 + diu_ijk.s2 + diu_ij_kp1.s2) * 0.25F;
	float dvdxx1 = (diu_ijk.s3 + diu_i_jm1_k.s3 + diu_ip1_jk.s3 + diu_ip1_jm1_k.s3) * 0.25F;
	float dvdyx1 = diu_ijk.s4;
	float dvdzx1 = (diu_i_jm1_k.s5 + diu_i_jm1_kp1.s5 + diu_ijk.s5 + diu_ij_kp1.s5) * 0.25F;
	float dwdxx1 = (diu_ijk.s6 + diu_ij_km1.s6 + diu_ip1_jk.s6 + diu_ip1_j_km1.s6) * 0.25F;
	float dwdyx1 = (diu_ijk.s7 + diu_ij_km1.s7 + diu_i_jp1_k.s7 + diu_i_jp1_km1.s7) * 0.25F;
	float dwdzx1 = diu_ijk.s8;
	//! --abl or channel
	sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)] = cs_dx * sqrt(2.0F * (SQR(dudxx1) + SQR(dvdyx1) + SQR(dwdzx1)) + SQR((dudyx1 + dvdxx1)) + SQR((dwdyx1 + dvdzx1)) + SQR((dudzx1 + dwdxx1)));
	}
//	} // for
//	} // if gl_id == 0
} // END of velfg__feedbf__les_calc_sm_kernel
// This is the unified loop of vel2, this replaces the call to the original vel2. I guess I can wrap it in the vel2 function.
void vel2(
     float4 * uvw,
     float16 * diu,
	float16* cov_ijk,
	float16* cov_ijk_p1,
	float16* diu_ijk,
	float16* diu_ijk_p1,
     float * dzs,
     float * dx1,
     float * dy1,
     float * dzn,
    const unsigned int im,
    const unsigned int jm,
    const unsigned int km,
    int i, int j, int k
	) {
	const unsigned int u0 = 0;
// add calc of i,j,k from idx. get idx with ocl call
    const unsigned int ip = im;
    const unsigned int jp = jm;
	const unsigned int kp = km;
	float4 uvw_i_j_k     =uvw[FTNREF3D(i,j,k,ip+2     ,jp+3,0,-1,-1)];
	float4 uvw_im1_j_k   =uvw[FTNREF3D(i-1,j,k,ip+2   ,jp+3,0,-1,-1)];
	float4 uvw_i_jm1_k   =uvw[FTNREF3D(i,j-1,k,ip+2   ,jp+3,0,-1,-1)];
	float4 uvw_i_j_km1   =uvw[FTNREF3D(i,j,k-1,ip+2   ,jp+3,0,-1,-1)];
	float4 uvw_ip1_j_k   =uvw[FTNREF3D(i+1,j,k,ip+2   ,jp+3,0,-1,-1)];
	float4 uvw_i_jp1_k   =uvw[FTNREF3D(i,j+1,k,ip+2   ,jp+3,0,-1,-1)];
	float4 uvw_i_0_k     =uvw[FTNREF3D(i,0,k,ip+2     ,jp+3,0,-1,-1)];
	float4 uvw_i_1_k     =uvw[FTNREF3D(i,1,k,ip+2     ,jp+3,0,-1,-1)];
	float4 uvw_i_j_kp1   =uvw[FTNREF3D(i,j,k+1,ip+2   ,jp+3,0,-1,-1)];
	float4 uvw_i_jm_k    =uvw[FTNREF3D(i,jm,k,ip+2    ,jp+3,0,-1,-1)];
	float4 uvw_im_j_k    =uvw[FTNREF3D(im,j,k,ip+2    ,jp+3,0,-1,-1)];
	float4 uvw_imm1_j_k  =uvw[FTNREF3D(im-1,j,k,ip+2  ,jp+3,0,-1,-1)];
	float4 uvw_i_jmm1_k  =uvw[FTNREF3D(i,jm-1,k,ip+2  ,jp+3,0,-1,-1)];
	float4 uvw_ip1_jmm1_k=uvw[FTNREF3D(i+1,jm-1,k,ip+2,jp+3,0,-1,-1)];
    float4 uvw_i_jmm1_kp1=uvw[FTNREF3D(i,jm-1,k+1,ip+2,jp+3,0,-1,-1)];
    float4 uvw_im1_j_kp1 =uvw[FTNREF3D(i-1,j,k+1,ip+2 ,jp+3,0,-1,-1)];
    float4 uvw_im1_jp1_k =uvw[FTNREF3D(i-1,j+1,k,ip+2 ,jp+3,0,-1,-1)];
    float4 uvw_ip1_jm1_k =uvw[FTNREF3D(i+1,j-1,k,ip+2 ,jp+3,0,-1,-1)];
    float4 uvw_i_jm1_k1  =uvw[FTNREF3D(i,j-1,k+1,ip+2 ,jp+3,0,-1,-1)];
    float4 uvw_ip1_0_k   =uvw[FTNREF3D(i+1,0,k,ip+2   ,jp+3,0,-1,-1)];
    float4 uvw_i_jp1_km1 =uvw[FTNREF3D(i,j+1,k-1,ip+2 ,jp+3,0,-1,-1)];
    float4 uvw_ip1_j_km1 =uvw[FTNREF3D(i+1,j,k-1,ip+2 ,jp+3,0,-1,-1)];
//    float4 uvw_i_j_k=uvw[FTNREF3Du(i,j,k,ip+1,jp+1,0,-1,-1)];
    float u_i_j_k=uvw_i_j_k.s0;
    float v_i_j_k=uvw_i_j_k.s1;
    float w_i_j_k=uvw_i_j_k.s2;
//    float4 uvw_im1_j_k=uvw[FTNREF3Du(i-1,j,k,ip+1,jp+1,0,-1,-1)];
    float u_im1_j_k= uvw_im1_j_k.s0;
    float v_im1_j_k= uvw_im1_j_k.s1;
    float w_im1_j_k= uvw_im1_j_k.s2;
//    float4 uvw_i_jm1_k=uvw[FTNREF3Du(i,j-1,k,ip+1,jp+1,0,-1,-1)];
    float u_i_jm1_k = uvw_i_jm1_k.s0;
    float v_i_jm1_k = uvw_i_jm1_k.s1;
    float w_i_jm1_k = uvw_i_jm1_k.s2;
//    float4 uvw_i_j_km1=uvw[FTNREF3Du(i,j,k-1,ip+1,jp+1,0,-1,-1)];
    float u_i_j_km1= uvw_i_j_km1.s0;
    float v_i_j_km1= uvw_i_j_km1.s1;
    float w_i_j_km1= uvw_i_j_km1.s2;
//    float4 uvw_ip1_j_k=uvw[FTNREF3Du(i+1,j,k,ip+1,jp+1,0,-1,-1)];
    float u_ip1_j_k= uvw_ip1_j_k.s0;
    float v_ip1_j_k= uvw_ip1_j_k.s1;
    float w_ip1_j_k= uvw_ip1_j_k.s2;
//    float4 uvw_i_jp1_k=uvw[FTNREF3Du(i,j+1,k,ip+1,jp+1,0,-1,-1)];
    float u_i_jp1_k= uvw_i_jp1_k.s0;
    float v_i_jp1_k= uvw_i_jp1_k.s1;
    float w_i_jp1_k= uvw_i_jp1_k.s2;
//    float4 uvw_i_0_k=uvw[FTNREF3Du(i,0,k,ip+1,jp+1,0,-1,-1)];
    float u_i_0_k= uvw_i_0_k.s0;
    float v_i_0_k= uvw_i_0_k.s1;
    float w_i_0_k= uvw_i_0_k.s2;
//    float4 uvw_i_1_k=uvw[FTNREF3Du(i,1,k,ip+1,jp+1,0,-1,-1)];
    float u_i_1_k= uvw_i_1_k.s0;
    float v_i_1_k= uvw_i_1_k.s1;
    float w_i_1_k= uvw_i_1_k.s2;
//    float4 uvw_i_j_kp1=uvw[FTNREF3Du(i,j,k+1,ip+1,jp+1,0,-1,-1)];
    float u_i_j_kp1 = uvw_i_j_kp1.s0;
    float v_i_j_kp1 = uvw_i_j_kp1.s1;
    float w_i_j_kp1 = uvw_i_j_kp1.s2;
//    float4 uvw_i_jm_k=uvw[FTNREF3Du(i,jm,k,ip+1,jp+1,0,-1,-1)];
    float u_i_jm_k = uvw_i_jm_k.s0;
    float v_i_jm_k = uvw_i_jm_k.s1;
    float w_i_jm_k = uvw_i_jm_k.s2;
//    float4 uvw_im_j_k=uvw[FTNREF3Du(im,j,k,ip+1,jp+1,0,-1,-1)];
    float u_im_j_k = uvw_im_j_k.s0;
//    float4 uvw_imm1_j_k=uvw[FTNREF3Du(im-1,j,k,ip+1,jp+1,0,-1,-1)];
    float u_imm1_j_k = uvw_imm1_j_k.s0;
//    float4 uvw_i_jmm1_k=uvw[FTNREF3Du(i,jm-1,k,ip+1,jp+1,0,-1,-1)];
    float u_i_jmm1_k = uvw_i_jmm1_k.s0;
    float v_i_jmm1_k = uvw_i_jmm1_k.s1;
    float w_i_jmm1_k = uvw_i_jmm1_k.s2;
//    float4 uvw_ip1_jmm1_k=uvw[FTNREF3Du(i+1,jm-1,k,ip+1,jp+1,0,-1,-1)];
    float v_ip1_jmm1_k = uvw_ip1_jmm1_k.s1;
//    float4 uvw_i_jmm1_kp1=uvw[FTNREF3Du(i,jm-1,k+1,ip+1,jp+1,0,-1,-1)];
    float v_i_jmm1_kp1 = uvw_i_jmm1_kp1.s1;
//    float4 uvw_im1_j_kp1=uvw[FTNREF3Du(i-1,j,k+1,ip+1,jp+1,0,-1,-1)];
    float u_im1_j_kp1 = uvw_im1_j_kp1.s0;
//    float4 uvw_im1_jp1_k=uvw[FTNREF3Du(i-1,j+1,k,ip+1,jp+1,0,-1,-1)];
    float u_im1_jp1_k = uvw_im1_jp1_k.s0;
//    float4 uvw_ip1_jm1_k=uvw[FTNREF3Du(i+1,j-1,k,ip+1,jp+1,0,-1,-1)];
    float v_ip1_jm1_k = uvw_ip1_jm1_k.s1;
//    float4 uvw_i_jm1_k1=uvw[FTNREF3Du(i,j-1,k+1,ip+1,jp+1,0,-1,-1)];
    float v_i_jm1_kp1 = uvw_i_jm1_k1.s1;
//    float4 uvw_ip1_0_k=uvw[FTNREF3Du(i+1,0,k,ip+1,jp+1,0,-1,-1)];
    float v_ip1_0_k = uvw_ip1_0_k.s1;
//    float4 uvw_i_jp1_km1=uvw[FTNREF3Du(i,j+1,k-1,ip+1,jp+1,0,-1,-1)];
    float w_i_jp1_km1 = uvw_i_jp1_km1.s2;
//    float4 uvw_ip1_j_km1=uvw[FTNREF3Du(i+1,j,k-1,ip+1,jp+1,0,-1,-1)];
    float w_ip1_j_km1 = uvw_ip1_j_km1.s2;
   // dx1 has a lb of -1, so we have dx1(i) => dx1[i- (-1)] = dx1[i+1]
   // dy1 has a lb of 0, so we have dy1(i) => dy1[i]
   // dzs has a lb of -1, so we have dzs(i) => dzs[i+1]
   // dzn has a lb of -1, so we have dzn(i) => dzn[i+1]
    float nou1_i_j_k = (u_im1_j_k+u_i_j_k)/2.0F;
    float nou1_ip1_j_k = (i==im) ? (u_im1_j_k+u_i_j_k)/2.0F : (u_i_j_k+u_ip1_j_k)/2.0F;
    float diu1_i_j_k =  (-u_im1_j_k + u_i_j_k)/dx1[i+1];
    float diu1_ip1_j_k = (i==im) ? diu1_i_j_k : (-u_i_j_k+u_ip1_j_k)/dx1[i+2];
    float cov1_i_j_k = nou1_i_j_k*diu1_i_j_k;
    float cov1_ip1_j_k = nou1_ip1_j_k*diu1_ip1_j_k;
    float nou2_i_j_k = (j==0) ? (dx1[i+2]*v_i_jmm1_k+dx1[i+1]*v_ip1_jmm1_k) /(dx1[i+1]+dx1[i+2]) :  (dx1[i+2]*v_i_jm1_k+dx1[i+1]*v_ip1_jm1_k) /(dx1[i+1]+dx1[i+2]);
    float nou2_i_jp1_k = (j==jm) ? (dx1[i+2]*v_i_0_k+dx1[i+1]*v_ip1_0_k) /(dx1[i+1]+dx1[i]) : (dx1[i]*v_i_j_k+dx1[i+1]*v_ip1_j_k) /(dx1[i+1]+dx1[i+2]);
    float diu2_i_j_k = (j==0) ? 2.0F*(-u_i_jmm1_k+u_i_jm_k)/(dy1[j-1]+dy1[j]) : 2.0F*(-u_i_jm1_k+u_i_j_k)/(dy1[j-1]+dy1[j]);
    float diu2_i_jp1_k = (j==jm) ? 2.0F*(-u_i_0_k+u_i_1_k)/(dy1[j-1]+dy1[j]) :  2.0F*(-u_i_j_k+u_i_jp1_k)/(dy1[j-1]+dy1[j]);
    float cov2_i_j_k = nou2_i_j_k*diu2_i_j_k;
    float cov2_i_jp1_k = nou2_i_jp1_k*diu2_i_jp1_k;
    float nou4_i_j_k = (dy1[j+1]*u_im1_j_k+dy1[j]*u_im1_jp1_k) /(dy1[j]+dy1[j+1]);
    float nou4_ip1_j_k = (i==im) ? nou4_i_j_k : (dy1[j+1]*u_i_j_k+dy1[j]*u_i_jp1_k) /(dy1[j]+dy1[j+1]);
    float diu4_i_j_k = 2.0F*(-v_im1_j_k+v_i_j_k)/(dx1[i]+dx1[i+1]);
    float diu4_ip1_j_k = (i==im) ? diu4_i_j_k : 2.0F*(-v_i_j_k+v_ip1_j_k)/(dx1[i]+dx1[i+1]);
    float cov4_i_j_k = (nou4_i_j_k-u0)*diu4_i_j_k;
    float cov4_ip1_j_k = (nou4_ip1_j_k-u0)*diu4_ip1_j_k;
    float nou5_i_j_k = (j==0) ? (v_i_jmm1_k+v_i_jm_k)/2.0F : (v_i_jm1_k+v_i_j_k)/2.0F;
    float nou5_i_jp1_k = (j==jm) ? (v_i_0_k+v_i_1_k)/2.0F : (v_i_j_k+v_i_jp1_k)/2.0F;
    float diu5_i_j_k = (j==0) ? (-v_i_jmm1_k+v_i_jm_k)/dy1[j] : (-v_i_jm1_k+v_i_j_k)/dy1[j];
    float diu5_i_jp1_k = (j==jm) ?  (-v_i_0_k+v_i_1_k)/dy1[1] : (-v_i_j_k+v_i_jp1_k)/dy1[j+1];
    float cov5_i_j_k = nou5_i_j_k*diu5_i_j_k;
    float cov5_i_jp1_k = nou5_i_jp1_k*diu5_i_jp1_k;
    float nou9_i_j_k = (w_i_j_km1+w_i_j_k)/2.0F;
    float nou9_i_j_kp1 = (w_i_j_k+w_i_j_kp1)/2.0F;
    float diu9_i_j_k = (-w_i_j_km1+w_i_j_k)/dzn[k+1];
    float diu9_i_j_kp1 = (-w_i_j_k+w_i_j_kp1)/dzn[k+2];
    float cov9_i_j_k = nou9_i_j_k*diu9_i_j_k;
    float cov9_i_j_kp1 = nou9_i_j_kp1*diu9_i_j_kp1;
    float nou3_i_j_k = (dx1[i+2]*w_i_j_km1+dx1[i+1]*w_ip1_j_km1) /(dx1[i+1]+dx1[i+2]);
    float nou3_i_j_kp1 = (dx1[i+2]*w_i_j_k+dx1[i+1]*w_ip1_j_k) /(dx1[i+1]+dx1[i+2]);
    float diu3_i_j_k = (-u_i_j_km1+u_i_j_k)/dzs[k];
    float diu3_i_j_kp1 = (-u_i_j_k+u_i_j_kp1)/dzs[k+1];
    float cov3_i_j_k = nou3_i_j_k*diu3_i_j_k;
    float cov3_i_j_kp1 = nou3_i_j_kp1*diu3_i_j_kp1;
    float nou6_i_j_k = (dy1[j+1]*w_i_j_km1+dy1[j]*w_i_jp1_km1) /(dy1[j]+dy1[j+1]);
    float nou6_i_j_kp1 = (dy1[j+1]*w_i_j_k+dy1[j]*w_i_jp1_k) /(dy1[j]+dy1[j+1]);
    float diu6_i_j_k = (-v_i_j_km1+v_i_j_k)/dzs[k];
    float diu6_i_j_kp1 = (-v_i_j_k+v_i_j_kp1)/dzs[k+1];
    float cov6_i_j_k = nou6_i_j_k*diu6_i_j_k;
    float cov6_i_j_kp1 = nou6_i_j_kp1*diu6_i_j_kp1;
    //      if (k<km) { // need this shield? What happens if I do it for k==km?
    float nou7_i_j_k = (dzn[k+2]*u_im1_j_k+dzn[k+1]*u_im1_j_kp1) /(dzn[k+1]+dzn[k+2]);
    float nou7_ip1_j_k = (i==im) ? nou7_i_j_k : (dzn[k+2]*u_i_j_k+dzn[k+1]*u_i_j_kp1) /(dzn[k+1]+dzn[k+2]);
    float diu7_i_j_k = 2.0F*(-w_im1_j_k+w_i_j_k)/(dx1[i]+dx1[i+1]);
    float diu7_ip1_j_k = (i==im) ? diu7_i_j_k  : 2.0F*(-w_i_j_k+w_ip1_j_k)/(dx1[i+1]+dx1[i+2]);
    float cov7_i_j_k = (nou7_i_j_k-u0)*diu7_i_j_k;
    float cov7_ip1_j_k = (nou7_ip1_j_k-u0)*diu7_ip1_j_k;
    float nou8_i_j_k = (j==0) ? (dzn[k+2]*v_i_jmm1_k+dzn[k+1]*v_i_jmm1_kp1) /(dzn[k+1]+dzn[k+2]) : (dzn[k+2]*v_i_jm1_k+dzn[k+1]*v_i_jm1_kp1) /(dzn[k+1]+dzn[k+2]);
    float nou8_i_jp1_k = (j==jm) ? : (dzn[k+2]*v_i_j_k+dzn[k+1]*v_i_j_kp1) /(dzn[k+1]+dzn[k+2]);
    float diu8_i_j_k = (j==0) ? 2.0F*(-w_i_jmm1_k+w_i_jm_k)/(dy1[jm-1]+dy1[jm]) : 2.0F*(-w_i_jm1_k+w_i_j_k)/(dy1[j-1]+dy1[j]);
    float diu8_i_jp1_k =(j==jm) ?  2.0F*(-w_i_0_k+w_i_1_k)/(dy1[0]+dy1[1]): 2.0F*(-w_i_j_k+w_i_jp1_k)/(dy1[j]+dy1[j+1]);
    float cov8_i_j_k = nou8_i_j_k*diu8_i_j_k;
    float cov8_i_jp1_k = nou8_i_jp1_k*diu8_i_jp1_k;
    //      }
    diu[ FTNREF3Du(i,j,k,ip+2,jp+2,-1,0,0)] = (float16)(diu1_i_j_k,diu2_i_j_k,diu3_i_j_k,diu4_i_j_k, diu5_i_j_k, diu6_i_j_k, diu7_i_j_k, diu8_i_j_k, diu9_i_j_k, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f);
// I think I can safely say
    diu[ FTNREF3Du(im+1,j,k,      ip+2,jp+2,-1,0,0) ] = diu[ FTNREF3Du(im,j,k,     ip+2,jp+2,-1,0,0) ] ;
    diu[ FTNREF3Du(im+1,jm+1,k,   ip+2,jp+2,-1,0,0) ] = diu[ FTNREF3Du(im,jm+1,k,  ip+2,jp+2,-1,0,0) ] ;
    diu[ FTNREF3Du(im+1,j,km+1,   ip+2,jp+2,-1,0,0)] = diu[ FTNREF3Du(im,j,km+1,   ip+2,jp+2,-1,0,0)] ;
    diu[ FTNREF3Du(im+1,jm+1,km+1,ip+2,jp+2,-1,0,0)] = diu[ FTNREF3Du(im,jm+1,km+1,ip+2,jp+2,-1,0,0)] ;
// And in similar fashion
    diu[ FTNREF3Du(i,0,k,ip+2,jp+2,-1,0,0)] = diu[ FTNREF3Du(i,jm,k,ip+2,jp+2,-1,0,0)] ;
    diu[ FTNREF3Du(i,0,km+1,ip+2,jp+2,-1,0,0)] = diu[ FTNREF3Du(i,jm,km+1,ip+2,jp+2,-1,0,0)] ;
    diu[ FTNREF3Du(im+1,0,k,ip+2,jp+2,-1,0,0)] = diu[ FTNREF3Du(im+1,jm,km+1,ip+2,jp+2,-1,0,0)] ;
    diu[ FTNREF3Du(im+1,0,km+1,ip+2,jp+2,-1,0,0)] = diu[ FTNREF3Du(im+1,jm,km+1,ip+2,jp+2,-1,0,0)] ;
	*cov_ijk =(float16)(cov1_i_j_k,cov2_i_j_k,cov3_i_j_k,cov4_i_j_k,cov5_i_j_k,cov6_i_j_k,cov7_i_j_k,cov8_i_j_k,cov9_i_j_k,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f);
	*cov_ijk_p1 =(float16)(cov1_ip1_j_k,cov2_i_jp1_k,cov3_i_j_kp1,cov4_ip1_j_k,cov5_i_jp1_k,cov6_i_j_kp1,cov7_ip1_j_k,cov8_i_jp1_k,cov9_i_j_kp1,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f);
	*diu_ijk =(float16)(diu1_i_j_k,diu2_i_j_k,diu3_i_j_k,diu4_i_j_k,diu5_i_j_k,diu6_i_j_k,diu7_i_j_k,diu8_i_j_k,diu9_i_j_k,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f);
	*diu_ijk_p1 =(float16)(diu1_ip1_j_k,diu2_i_jp1_k,diu3_i_j_kp1,diu4_ip1_j_k,diu5_i_jp1_k,diu6_i_j_kp1,diu7_ip1_j_k,diu8_i_jp1_k,diu9_i_j_kp1,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f);
}
// max_range = max(max(km+2,jm+3),im+3);
// globalrange=max_range*max_range
// localrange=max_range
 void les_bound_sm_kernel (
         float4 *fgh,
         float *dx1, float *dy1, float *dzn,
         float16 *diu,
         float *sm,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
        ) {
	const unsigned int ip = im;
	const unsigned int jp = jm;
	const unsigned int kp = km;
      // New approach: global range = (jm+3)*(km+2) + (km+2)*(im+2)+(jm+3)*(im+2)
      unsigned int gl_id = get_global_id(0);
      if (gl_id < (jm+3)*(km+2) ) {
      	unsigned int k = gl_id / (jm+3) ; // 0 .. km+1
      	unsigned int j = gl_id % (jm+3) - 1; // -1 .. jm+2
	      sm[FTNREF3D(0,j,k,ip+3,jp+3,-1,-1,0)] = sm[FTNREF3D(1,j,k,ip+3,jp+3,-1,-1,0)];
	      sm[FTNREF3D(im + 1,j,k,ip+3,jp+3,-1,-1,0)] = sm[FTNREF3D(im,j,k,ip+3,jp+3,-1,-1,0)];
      } else if (gl_id <(jm+3)*(km+2) + (km+2)*(im+2)) {
    	  unsigned int k = (gl_id -(jm+3)*(km+2)) / (im+2) ;
    	  unsigned int i = (gl_id -(jm+3)*(km+2)) % (im+2);
	      sm[FTNREF3D(i,jm + 1,k,ip+3,jp+3,-1,-1,0)] = sm[FTNREF3D(i,jm,k,ip+3,jp+3,-1,-1,0)];
	      sm[FTNREF3D(i,0,k,ip+3,jp+3,-1,-1,0)] = sm[FTNREF3D(i,1,k,ip+3,jp+3,-1,-1,0)];
      } else if (gl_id < (jm+3)*(km+2) + (km+2)*(im+2) + (jm+3)*(im+2)) {
    	  unsigned int j = (gl_id -(jm+3)*(km+2)-(km+2)*(im+2)) / (im+2) - 1;
    	  unsigned int i = (gl_id -(jm+3)*(km+2)-(km+2)*(im+2)) % (im+2) ;
	      sm[FTNREF3D(i,j,0,ip+3,jp+3,-1,-1,0)] = -sm[FTNREF3D(i,j,1,ip+3,jp+3,-1,-1,0)];
	      sm[FTNREF3D(i,j,km + 1,ip+3,jp+3,-1,-1,0)] = sm[FTNREF3D(i,j,km,ip+3,jp+3,-1,-1,0)];
      }
} // END of les_bound_sm_kernel
 void les_calc_visc__adam_kernel (
		 float4 *fgh,
		 float4 *fgh_old,
		 float *dx1, float *dy1, float *dzn,
		 float16 *diu,
		 float *sm,
		const unsigned int im,
		const unsigned int jm,
		const unsigned int km
) {
	const unsigned int ip = im;
	const unsigned int jp = jm;
	const unsigned int kp = km;
	int idx = get_global_id(0);
	if (idx<im*jm*km) {
	int4 ijk = calc_loop_iters(idx,im,jm,km,1,1,1);
	int j = ijk.s1;
	int k = ijk.s2;
	int i = ijk.s0;
	float4 fgh_ijk = fgh[FTNREF3D0(i,j,k,ip+1,jp+1)];
	float16 diu_ijk = diu[FTNREF3D(i,j,k,ip+4,jp+3,-1,0,0)];
//#define CACHE_SM
// manual caching of sm, does not improve performance
	//! --calculation of viscosity terms in momentum eq.(x-comp.)
	//! --eddyviscosity on face
	float evsx2 = sm[FTNREF3D(i + 1,j,k,ip+3,jp+3,-1,-1,0)];
	float evsx1 = sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)];
	float evsy2 = (dy1[FTNREF1D(j + 1,0)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)])) + dy1[FTNREF1D(j,0)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j + 1,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j + 1,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)]))) / (dy1[FTNREF1D(j,0)] + dy1[FTNREF1D(j + 1,0)]);
	float evsy1 = (dy1[FTNREF1D(j + 1,0)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j - 1,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j - 1,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)])) + dy1[FTNREF1D(j,0)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)]))) / (dy1[FTNREF1D(j,0)] + dy1[FTNREF1D(j + 1,0)]);
	float evsz2 = (dzn[FTNREF1D(k + 1,-1)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)])) + dzn[FTNREF1D(k,-1)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k + 1,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k + 1,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)]))) / (dzn[FTNREF1D(k,-1)] + dzn[FTNREF1D(k + 1,-1)]);
	float evsz1 = (dzn[FTNREF1D(k,-1)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k - 1,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k - 1,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)])) + dzn[FTNREF1D(k - 1,-1)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)]))) / (dzn[FTNREF1D(k - 1,-1)] + dzn[FTNREF1D(k,-1)]);
	float visux2 = (evsx2) * 2.F * diu[FTNREF3D(i+1,j,k,ip+4,jp+3,-1,0,0)].s0;
	float visux1 = (evsx1) * 2.F * diu[FTNREF3D(i,j,k,  ip+4,jp+3,-1,0,0)].s0;
	float visuy2 = (evsy2) * ( diu[FTNREF3D(i,j + 1,k,  ip+4,jp+3,-1,0,0)].s1 + diu[FTNREF3D(i + 1,j,k,    ip+4,jp+3,-1,0,0)].s3);
	float visuy1 = (evsy1) * ( diu[FTNREF3D(i,j,k,      ip+4,jp+3,-1,0,0)].s1 + diu[FTNREF3D(i + 1,j - 1,k,ip+4,jp+3,-1,0,0)].s3);
	float visuz2 = (evsz2) * ( diu[FTNREF3D(i,j,k + 1,  ip+4,jp+3,-1,0,0)].s2 + diu[FTNREF3D(i + 1,j,k,    ip+4,jp+3,-1,0,0)].s6);
	float visuz1 = (evsz1) * ( diu[FTNREF3D(i,j,k,      ip+4,jp+3,-1,0,0)].s2 + diu[FTNREF3D(i + 1,j,k - 1,ip+4,jp+3,-1,0,0)].s6);
	float vfu = (visux2 - visux1) / dx1[FTNREF1D(i,-1)] + (visuy2 - visuy1) / dy1[FTNREF1D(j,0)] + (visuz2 - visuz1) / dzn[FTNREF1D(k,-1)];
	fgh_ijk.s0 = (fgh_ijk.s0 + vfu);
	//! --calculation of viscosity terms in momentum eq.(y-comp.)
	//! --eddyviscosity on face
	evsy2 = sm[FTNREF3D(i,j + 1,k,ip+3,jp+3,-1,-1,0)];
	evsy1 = sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)];
	evsx2 = (dy1[FTNREF1D(j + 1,0)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)])) + dy1[FTNREF1D(j,0)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j + 1,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j + 1,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)]))) / (dy1[FTNREF1D(j,0)] + dy1[FTNREF1D(j + 1,0)]);
	evsx1 = (dy1[FTNREF1D(j + 1,0)] * ((dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i - 1,j,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i - 1,-1)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i - 1,-1)] + dx1[FTNREF1D(i,-1)])) + dy1[FTNREF1D(j,0)] * ((dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i - 1,j + 1,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i - 1,-1)] * sm[FTNREF3D(i,j + 1,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i - 1,-1)] + dx1[FTNREF1D(i,-1)]))) / (dy1[FTNREF1D(j,0)] + dy1[FTNREF1D(j + 1,0)]);
	evsz2 = (dzn[FTNREF1D(k + 1,-1)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)])) + dzn[FTNREF1D(k,-1)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k + 1,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k + 1,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)]))) / (dzn[FTNREF1D(k,-1)] + dzn[FTNREF1D(k + 1,-1)]);
	evsz1 = (dzn[FTNREF1D(k,-1)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k - 1,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k - 1,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)])) + dzn[FTNREF1D(k - 1,-1)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)]))) / (dzn[FTNREF1D(k - 1,-1)] + dzn[FTNREF1D(k,-1)]);
	float visvx2 = (evsx2) * (diu[FTNREF3D(i,j + 1,k,     ip+4,jp+3,-1,0,0)].s1 + diu[FTNREF3D(i + 1,j,k,ip+4,jp+3,-1,0,0)].s3);
	float visvx1 = (evsx1) * (diu[FTNREF3D(i - 1,j + 1,k, ip+4,jp+3,-1,0,0)].s1 + diu[FTNREF3D(i,j,k,    ip+4,jp+3,-1,0,0)].s3);
	float visvy2 = (evsy2) * 2.F * diu[FTNREF3D(i,j + 1,k,ip+4,jp+3,-1,0,0)].s4;
	float visvy1 = (evsy1) * 2.F * diu[FTNREF3D(i,j,k,    ip+4,jp+3,-1,0,0)].s4;
	float visvz2 = (evsz2) * (diu[FTNREF3D(i,j,k + 1,     ip+4,jp+3,-1,0,0)].s5 + diu[FTNREF3D(i,j + 1,k,    ip+4,jp+3,-1,0,0)].s7);
	float visvz1 = (evsz1) * (diu[FTNREF3D(i,j,k,         ip+4,jp+3,-1,0,0)].s5 + diu[FTNREF3D(i,j + 1,k - 1,ip+4,jp+3,-1,0,0)].s7);
	float vfv = (visvx2 - visvx1) / dx1[FTNREF1D(i,-1)] + (visvy2 - visvy1) / dy1[FTNREF1D(j,0)] + (visvz2 - visvz1) / dzn[FTNREF1D(k,-1)];
	fgh_ijk.s1 = (fgh_ijk.s1 + vfv);
	//! --calculation of viscosity terms in momentum eq.(z-comp.)
		//! --eddyviscosity on face
	evsz2 = sm[FTNREF3D(i,j,k + 1,ip+3,jp+3,-1,-1,0)];
	evsz1 = sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)];
	evsx2 = (dzn[FTNREF1D(k + 1,-1)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)])) + dzn[FTNREF1D(k,-1)] * ((dx1[FTNREF1D(i + 1,-1)] * sm[FTNREF3D(i,j,k + 1,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i + 1,j,k + 1,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i,-1)] + dx1[FTNREF1D(i + 1,-1)]))) / (dzn[FTNREF1D(k,-1)] + dzn[FTNREF1D(k + 1,-1)]);
	evsx1 = (dzn[FTNREF1D(k + 1,-1)] * ((dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i - 1,j,k,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i - 1,-1)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i - 1,-1)] + dx1[FTNREF1D(i,-1)])) + dzn[FTNREF1D(k,-1)] * ((dx1[FTNREF1D(i,-1)] * sm[FTNREF3D(i - 1,j,k + 1,ip+3,jp+3,-1,-1,0)] + dx1[FTNREF1D(i - 1,-1)] * sm[FTNREF3D(i,j,k + 1,ip+3,jp+3,-1,-1,0)]) / (dx1[FTNREF1D(i - 1,-1)] + dx1[FTNREF1D(i,-1)]))) / (dzn[FTNREF1D(k,-1)] + dzn[FTNREF1D(k + 1,-1)]);
	evsy2 = (dzn[FTNREF1D(k + 1,-1)] * ((dy1[FTNREF1D(j + 1,0)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)] + dy1[FTNREF1D(j,0)] * sm[FTNREF3D(i,j + 1,k,ip+3,jp+3,-1,-1,0)]) / (dy1[FTNREF1D(j,0)] + dy1[FTNREF1D(j + 1,0)])) + dzn[FTNREF1D(k,-1)] * ((dy1[FTNREF1D(j + 1,0)] * sm[FTNREF3D(i,j,k + 1,ip+3,jp+3,-1,-1,0)] + dy1[FTNREF1D(j,0)] * sm[FTNREF3D(i,j + 1,k + 1,ip+3,jp+3,-1,-1,0)]) / (dy1[FTNREF1D(j,0)] + dy1[FTNREF1D(j + 1,0)]))) / (dzn[FTNREF1D(k,-1)] + dzn[FTNREF1D(k + 1,-1)]);
	evsy1 = (dzn[FTNREF1D(k + 1,-1)] * ((dy1[FTNREF1D(j,0)] * sm[FTNREF3D(i,j - 1,k,ip+3,jp+3,-1,-1,0)] + dy1[FTNREF1D(j - 1,0)] * sm[FTNREF3D(i,j,k,ip+3,jp+3,-1,-1,0)]) / (dy1[FTNREF1D(j - 1,0)] + dy1[FTNREF1D(j,0)])) + dzn[FTNREF1D(k,-1)] * ((dy1[FTNREF1D(j,0)] * sm[FTNREF3D(i,j - 1,k + 1,ip+3,jp+3,-1,-1,0)] + dy1[FTNREF1D(j - 1,0)] * sm[FTNREF3D(i,j,k + 1,ip+3,jp+3,-1,-1,0)]) / (dy1[FTNREF1D(j - 1,0)] + dy1[FTNREF1D(j,0)]))) / (dzn[FTNREF1D(k,-1)] + dzn[FTNREF1D(k + 1,-1)]);
	float viswx2 = (evsx2) * (diu[FTNREF3D(i,j,k + 1,     ip+4,jp+3,-1,0,0)].s2 + diu[FTNREF3D(i + 1,j,k,ip+4,jp+3,-1,0,0)].s6);
	float viswx1 = (evsx1) * (diu[FTNREF3D(i - 1,j,k + 1, ip+4,jp+3,-1,0,0)].s2 + diu[FTNREF3D(i,j,k,    ip+4,jp+3,-1,0,0)].s6);
	float viswy2 = (evsy2) * (diu[FTNREF3D(i,j,k + 1,     ip+4,jp+3,-1,0,0)].s5 + diu[FTNREF3D(i,j + 1,k,ip+4,jp+3,-1,0,0)].s7);
	float viswy1 = (evsy1) * (diu[FTNREF3D(i,j - 1,k + 1, ip+4,jp+3,-1,0,0)].s5 + diu[FTNREF3D(i,j,k,    ip+4,jp+3,-1,0,0)].s7);
	float viswz2 = (evsz2) * 2.F * diu[FTNREF3D(i,j,k + 1,ip+4,jp+3,-1,0,0)].s8;
	float viswz1 = (evsz1) * 2.F * diu[FTNREF3D(i,j,k,    ip+4,jp+3,-1,0,0)].s8;
	float vfw = (viswx2 - viswx1) / dx1[FTNREF1D(i,-1)] + (viswy2 - viswy1) / dy1[FTNREF1D(j,0)] + (viswz2 - viswz1) / dzn[FTNREF1D(k,-1)];
	fgh_ijk.s2 = (fgh_ijk.s2 + vfw);
	// Adam-Bashforth integration
	float4 fgh_old_ijk = fgh_old[FTNREF3D(i,j,k,ip,jp,1,1,1)];
	fgh_old[FTNREF3D(i,j,k,ip,jp,1,1,1)] = fgh_ijk;
//	float4 fgh_tmp_ijk = fgh_ijk;
//	float fd = fgh_ijk.s0;
//	float gd = fgh_ijk.s1;
//	float hd = fgh_ijk.s2;
	fgh_ijk.s0 = 1.5F * fgh_ijk.s0 - 0.5F * fgh_old_ijk.s0;
	fgh_ijk.s1 = 1.5F * fgh_ijk.s1 - 0.5F * fgh_old_ijk.s1;
	fgh_ijk.s2 = 1.5F * fgh_ijk.s2 - 0.5F * fgh_old_ijk.s2;
	fgh[FTNREF3D0(i,j,k,ip+1,jp+1)] = fgh_ijk;
//    fgh_old_ijk.s0 = fd;
//    fgh_old_ijk.s1 = gd;
//    fgh_old_ijk.s2 = hd;
//    fgh_old[FTNREF3D(i,j,k,ip,jp,1,1,1)] = fgh_tmp_ijk;
	}
} // END of les_calc_visc__adam_kernel
// ====================================================== 2 ===========================================================
// From our experiments, it is clear that the best approach is to have globalrange=km*im, localrange=im, loop over jm
 void press_rhsav_kernel (
		   float* rhsavs_th,
		   float* areas_th,
		 float4* uvw,
		 float4* fgh,
         float *rhs,
		 float *dx1, float *dy1, float *dzn,
         float* chunks_num,
         float* chunks_denom,
        const float dt,
		const unsigned int im,
		const unsigned int jm,
		const unsigned int km
		        ) {
		  const int ip = im;
		  const int jp = jm;
		  const int kp = km;
// A better approach is to sum per compute unit with a fixed number of threads
	unsigned int gl_id = get_global_id(0);
	unsigned int gr_id = get_group_id(0);
	unsigned int nunits = get_num_groups(0);
	unsigned int l_id =  get_local_id(0);
//  unsigned int k = gr_id+1;
	//  unsigned int i = l_id+1;
	  unsigned int il_bound = ip % 128 == 0 ? ip/128 : ip/128 +1;
  float rhsav=0.0F;
  float area=0.0F;
  unsigned int k_range = kp;
  unsigned int chunk_sz = k_range / nunits;
  unsigned int kl_start= gr_id*chunk_sz;
  unsigned int kl_stop= (gr_id < nunits-1) ? (gr_id+1)* chunk_sz : k_range;
  for (unsigned int kl = kl_start; kl<kl_stop; kl++) {
	  unsigned int k = 1+kl;
	  for (unsigned int il=0;il<il_bound;il++) {
		  unsigned int i = il*128 +l_id+1;
		  if (i<ip+1) {
			  for (unsigned int j=1; j<=jm;j++) {
				  float4 fgh_ijk=fgh[FTNREF3D0(i,j,k,ip+1,jp+1)];
				  float4 uvw_ijk=uvw[FTNREF3D(i,j,k,ip+2,jp+3,0,-1,-1)]; // uvw here has random values!
				  bondfgc_( fgh,im,jm,km,i,j,k); // this modifies fgh
				  float rhs_tmp1 =
						  (-uvw[FTNREF3D(i - 1,j,k,ip+2,jp+3,0,-1,-1)].s0 + uvw_ijk.s0) / dx1[FTNREF1D(i,-1)]
	                    + (-uvw[FTNREF3D(i,j - 1,k,ip+2,jp+3,0,-1,-1)].s1 + uvw_ijk.s1) / dy1[FTNREF1D(j,0)]
                        + (-uvw[FTNREF3D(i,j,k - 1,ip+2,jp+3,0,-1,-1)].s2 + uvw_ijk.s2) / dzn[FTNREF1D(k,-1)];
				  //! --stretch
				  float rhs_tmp2=
						  (fgh_ijk.s0 - fgh[FTNREF3D0(i - 1,j,k,ip+1,jp+1)].s0) / dx1[FTNREF1D(i,-1)]
                        + (fgh_ijk.s1 - fgh[FTNREF3D0(i,j - 1,k,ip+1,jp+1)].s1) / dy1[FTNREF1D(j,0)]
                        + (fgh_ijk.s2 - fgh[FTNREF3D0(i,j,k - 1,ip+1,jp+1)].s2) / dzn[FTNREF1D(k,-1)]
                        + rhs_tmp1 / dt;
				  float weight = dx1[FTNREF1D(i,-1)] * dy1[FTNREF1D(j,0)] * dzn[FTNREF1D(k,-1)];
				  rhsav +=  rhs_tmp2 * weight;
				  area  +=  weight;
				  rhs[FTNREF3D0(i,j,k,ip+2,jp+2)] = rhs_tmp2; // So, this value is fine. How come rhsav is not fine, esp. considering area is fine?
			  }
		  }
	  }
  }
	rhsavs_th[l_id]=rhsav;
	areas_th[l_id]=area;
// On the CPU, this barrier breaks everything. On the GPU, the barrier is essential if 128 is larger than the physical warp size I think
// SO we could be very ad-hoc-ish and have a test "if NTH>32"
//#if 128 > 32
  barrier(CLK_LOCAL_MEM_FENCE );
//#endif
if (l_id==0) {
  float rhsavs_g=0.0F;
  float areas_g=0.0F;
  for (unsigned int ii=0;ii<128;ii++) {
  	rhsavs_g+=rhsavs_th[ii];
  	areas_g+=areas_th[ii];
	}
  	  chunks_num[gr_id] = rhsavs_g;
  	  chunks_denom[gr_id] = areas_g;
}
} // END of press_rhsav_kernel()
// ============================================================== ==============================================================
void bondfgc_ ( float4 *fgh,const int im,const int jm,const int km, int i, int j, int k) {
	const int ip = im;
	const int jp = jm;
	const int kp = km;
	//! --inflow condition
	if (i==1) {
		fgh[FTNREF3D0(0,j,k,ip+1,jp+1)].s0 = fgh[FTNREF3D0(1,j,k,ip+1,jp+1)].s0;
	}
	//! --sideflow condition
	if (j==1) {
		fgh[FTNREF3D0(i,0,k,ip+1,jp+1)].s1 = fgh[FTNREF3D0(i,jm,k,ip+1,jp+1)].s1;
	}
	//! --ground and top condition
	if (k==1) {
		fgh[FTNREF3D0(i,j,0,ip+1,jp+1)].s2 = 0.0F;
		fgh[FTNREF3D0(i,j,km,ip+1,jp+1)].s2 = 0.0F;
	}
}
// I only ever seem to use 2=2 but it is not used in this source file
// All the macros below should be set via EXTRA_KOPTS in the SConstruct.ocl file
// In a proper SOR omega is not 1 but if it is we can reduce the expression
//#define OMEGA_NOT_1
// 1 is used om the CPU
//#define 1
// This is a SOR that does not exchange data between compute units.
// It is not faster so I never used it after testing
//#define APPROX_PAR_SOR
// This is the best GPU kernel at least on GeForce GTX 590  and Titan Black
//#define 1
// On CPU, I had trouble with barriers, so this flag is for that case
// it MUST be defined for GPU
//#define BARRIER_OK
// This should be removed. It used to be called ALL_NEW but it is of no use
//#define AN_OLD_ATTEMPT
// The iteration order is sometimes important so this must stay. It is separate from the LOOP_ORDE because it is hand-coded in the SOR
//#define NEW_ITER_ORDER
// This is the kernel for the MIC
//#define MIC_SOR_KERNEL
// 512 is defined in shared_macros
// Apart from these macros the code also has the following:
// HALO_EXCHANGE: if the host supports hao exchange the device will not do any boundary calculations
// POISON_CACHE: what it says, only for tests
// WASTE_TIME: what it says, only for tests
// I want my kernels to work on their own as well as in a super-kernel, that is what  accomplishes
// ====================================================== 2 ===========================================================
 void press_sor_kernel(
		 float* sor_chunks,
//		 float* tmp_chunks,
		 float4* uvw,
//		 float* p,
		 float2* p2,
		 float *rhs,
		const  float *cn1,
		const  float *cn2l, const  float *cn2s,
		const  float *cn3l, const  float *cn3s,
		const  float *cn4l, const  float *cn4s,
		 float *chunks_num,
		 float *chunks_denom,  float *val_ptr,
		 unsigned int *nrd_ptr,
		const unsigned int im,
		const unsigned int jm,
		const unsigned int km
		) {
	const unsigned int ip = im;
	const unsigned int jp = jm;
	const unsigned int kp = km;
	// ------------------------------------------------------------------------------------------------------------
//		unsigned int gl_id = get_global_id(0);
		unsigned int gr_id = get_group_id(0);
		unsigned int nunits = get_num_groups(0);
		unsigned int l_id = get_local_id(0);
		float rhsav = *val_ptr;
// In principle this should work both with and without 1
// However, it was desiged to work *without* 1
		float local_sor_acc = 0.0F;
		unsigned int nrd = *nrd_ptr;
				float local_sor = 0.0F;
// 1
			   unsigned int i = l_id;
				unsigned int lj_bound =
						((jm + 2) % 128 == 0) ? (jm + 2) / 128 : (jm + 2) / 128 + 1;
				unsigned int chunk_sz = (kp + 2) / nunits;
				unsigned int kl_start = gr_id * chunk_sz;
				unsigned int kl_stop =
						(gr_id < nunits - 1) ? (gr_id + 1) * chunk_sz : (kp + 2);
				for (unsigned int kl = kl_start; kl < kl_stop; kl++) {
					unsigned int k = kl;
					unsigned int k_lhs = k;
					bool calc_sor_k = true;
					if (k == 0) {
						k = 1;
						calc_sor_k = false;
					}
					if (k == km + 1) {
						k = km;
						calc_sor_k = false;
					}
					for (unsigned int lj = 0; lj < lj_bound; lj++) {
						unsigned int j = 0 + lj * 128 + l_id;
						if (j <= jm + 1) {
							// What we do is separate the lhs index from the rhs index
							// then we re-assign the rhs index to meet the boundary condition
							unsigned int j_lhs = j;
							bool calc_sor_j = true;
							if (j == 0) {
								j = jm;
								calc_sor_j = false;
							}
							if (j == jm + 1) {
								j = 1;
								calc_sor_j = false;
							}
							for (unsigned int i_lhs = 0; i_lhs <= im + 1; i_lhs++) {
								bool calc_sor_i = true ;
								unsigned int i = i_lhs;
								if (i_lhs == 0) {
									i = 1;
									calc_sor_i = false;
								}
								if (i_lhs == im + 1) {
									i = im;
									calc_sor_i = false;
								}
								// So the idea is that this call will calculate the new boundary conditions for p or p2
								float reltmp_mp = calc_reltmp_mp_db(p2, rhs, rhsav,
										cn1, cn2l, cn2s, cn3l, cn3s, cn4l, cn4s, i, j, k,
										j_lhs, k_lhs, nrd, ip, jp, kp);
								if (calc_sor_i && calc_sor_j && calc_sor_k) {
									local_sor += reltmp_mp * reltmp_mp;
								}
							}
						} // if j<=jm+1
					} // for lj
				} // for lk
				sor_chunks[l_id] = local_sor;
			if (l_id == 0) {
				local_sor_acc = 0.0F; // chunks_num[gr_id];
				// we should skip the two outer chunks as they are for the boundary conditions
				for (unsigned int s = 0; s < 128; s++) {
					local_sor_acc += sor_chunks[s];
				}
			}
	if (l_id == 0) {
		chunks_num[gr_id] =  local_sor_acc;
	}
// ------------------------------------------------------------------------------------------------------------
// Below is the more conventional kernel, with red-black and copied bounds
} // END of press_sor_kernel()
//================================================================================================================================================================
float calc_reltmp0(
		 float2* p,  float* rhs, float rhsav,
		const  float *cn1, const  float *cn2l, const  float *cn2s,
		const  float *cn3l, const  float *cn3s, const  float *cn4l,
		const  float *cn4s,
		unsigned int i, unsigned int j, unsigned int k,
		const unsigned int ip, const unsigned int jp, const unsigned int kp) {
//	float reltmp = cn1[FTNREF3D(i, j, k, ip, jp, 1, 1, 1)]
//		   * (
//			  cn2l[FTNREF1D(i, 1)] * p[FTNREF3D0(i + 1, j, k, ip + 3, jp + 3)].s0
//			+ cn2s[FTNREF1D(i, 1)] * p[FTNREF3D0(i - 1, j, k, ip + 3, jp + 3)].s0
//			+ cn3l[FTNREF1D(j, 1)] * p[FTNREF3D0(i, j + 1, k, ip + 3, jp + 3)].s0
//			+ cn3s[FTNREF1D(j, 1)] * p[FTNREF3D0(i, j - 1, k, ip + 3, jp + 3)].s0
//			+ cn4l[FTNREF1D(k, 1)] * p[FTNREF3D0(i, j, k + 1, ip + 3, jp + 3)].s0
//			+ cn4s[FTNREF1D(k, 1)] * p[FTNREF3D0(i, j, k - 1, ip + 3, jp + 3)].s0
//					- (rhs[FTNREF3D0(i, j, k, ip + 2, jp + 2)] - rhsav)
//					);
// This could be better for using mad, if the compiler is too stupid
	float reltmp = rhsav - rhs[FTNREF3D0(i, j, k, ip + 2, jp + 2)];
	reltmp += cn2l[FTNREF1D(i, 1)] * p[FTNREF3D0(i + 1, j, k, ip + 3, jp + 3)].s0;
	reltmp += cn2s[FTNREF1D(i, 1)] * p[FTNREF3D0(i - 1, j, k, ip + 3, jp + 3)].s0;
	reltmp += cn3l[FTNREF1D(j, 1)] * p[FTNREF3D0(i, j + 1, k, ip + 3, jp + 3)].s0;
	reltmp += cn3s[FTNREF1D(j, 1)] * p[FTNREF3D0(i, j - 1, k, ip + 3, jp + 3)].s0;
	reltmp += cn4l[FTNREF1D(k, 1)] * p[FTNREF3D0(i, j, k + 1, ip + 3, jp + 3)].s0;
	reltmp += cn4s[FTNREF1D(k, 1)] * p[FTNREF3D0(i, j, k - 1, ip + 3, jp + 3)].s0;
	reltmp *=  cn1[FTNREF3D(i, j, k, ip, jp, 1, 1, 1)];
	return reltmp;
}
// ------------------------------------------------------------------------------------------------------------
float calc_reltmp1(
		 float2* p,  float* rhs, float rhsav,
		const  float *cn1, const  float *cn2l, const  float *cn2s,
		const  float *cn3l, const  float *cn3s, const  float *cn4l,
		const  float *cn4s,
		unsigned int i, unsigned int j, unsigned int k,
		const unsigned int ip, const unsigned int jp, const unsigned int kp) {
//	float reltmp = cn1[FTNREF3D(i, j, k, ip, jp, 1, 1, 1)]
//		   * (
//			  cn2l[FTNREF1D(i, 1)] * p[FTNREF3D0(i + 1, j, k, ip + 3, jp + 3)].s1
//			+ cn2s[FTNREF1D(i, 1)] * p[FTNREF3D0(i - 1, j, k, ip + 3, jp + 3)].s1
//			+ cn3l[FTNREF1D(j, 1)] * p[FTNREF3D0(i, j + 1, k, ip + 3, jp + 3)].s1
//			+ cn3s[FTNREF1D(j, 1)] * p[FTNREF3D0(i, j - 1, k, ip + 3, jp + 3)].s1
//			+ cn4l[FTNREF1D(k, 1)] * p[FTNREF3D0(i, j, k + 1, ip + 3, jp + 3)].s1
//			+ cn4s[FTNREF1D(k, 1)] * p[FTNREF3D0(i, j, k - 1, ip + 3, jp + 3)].s1
//					- (rhs[FTNREF3D0(i, j, k, ip + 2, jp + 2)] - rhsav)
//					);
	// This could be better for using mad, if the compiler is too stupid
		float reltmp = rhsav - rhs[FTNREF3D0(i, j, k, ip + 2, jp + 2)];
		reltmp += cn2l[FTNREF1D(i, 1)] * p[FTNREF3D0(i + 1, j, k, ip + 3, jp + 3)].s1;
		reltmp += cn2s[FTNREF1D(i, 1)] * p[FTNREF3D0(i - 1, j, k, ip + 3, jp + 3)].s1;
		reltmp += cn3l[FTNREF1D(j, 1)] * p[FTNREF3D0(i, j + 1, k, ip + 3, jp + 3)].s1;
		reltmp += cn3s[FTNREF1D(j, 1)] * p[FTNREF3D0(i, j - 1, k, ip + 3, jp + 3)].s1;
		reltmp += cn4l[FTNREF1D(k, 1)] * p[FTNREF3D0(i, j, k + 1, ip + 3, jp + 3)].s1;
		reltmp += cn4s[FTNREF1D(k, 1)] * p[FTNREF3D0(i, j, k - 1, ip + 3, jp + 3)].s1;
		reltmp *=  cn1[FTNREF3D(i, j, k, ip, jp, 1, 1, 1)];
	return reltmp;
}
// ------------------------------------------------------------------------------------------------------------
// red-black
float calc_reltmp_mp_rb(
		 float2* p,
		 float* rhs, float rhsav, const  float *cn1,
		const  float *cn2l, const  float *cn2s, const  float *cn3l,
		const  float *cn3s, const  float *cn4l, const  float *cn4s,
		unsigned int i, unsigned int j, unsigned int k, unsigned int j_lhs,
		unsigned int k_lhs, unsigned int nrd, const unsigned int ip,
		const unsigned int jp, const unsigned int kp) {
	float reltmp = 0.0f;
	if (nrd == 0) {
		float reltmp_mp = calc_reltmp0( p, rhs, rhsav, cn1, cn2l, cn2s, cn3l, cn3s,
				cn4l, cn4s,
				i, j, k, ip, jp, kp);
		reltmp = reltmp_mp - p[FTNREF3D0(i,j,k,ip+3,jp+3)].s0;
		p[FTNREF3D0(i, j_lhs, k_lhs, ip + 3, jp + 3)].s0 = reltmp_mp;
	} else {
		float reltmp_mp = calc_reltmp0(p, rhs, rhsav, cn1, cn2l, cn2s, cn3l,
				cn3s, cn4l, cn4s,
				i, j, k, ip, jp, kp);
	    reltmp = reltmp_mp - p[FTNREF3D0(i,j,k,ip+3,jp+3)].s0;
		p[FTNREF3D0(i, j_lhs, k_lhs, ip + 3, jp + 3)].s0 = reltmp_mp;
	}
	return reltmp;
}
// ------------------------------------------------------------------------------------------------------------
// double buffer
float calc_reltmp_mp_db(
		 float2* p,
		 float* rhs, float rhsav, const  float *cn1,
		const  float *cn2l, const  float *cn2s, const  float *cn3l,
		const  float *cn3s, const  float *cn4l, const  float *cn4s,
		unsigned int i, unsigned int j, unsigned int k, unsigned int j_lhs,
		unsigned int k_lhs, unsigned int nrd, const unsigned int ip,
		const unsigned int jp, const unsigned int kp) {
	float reltmp = 0.0f;
	if (nrd == 0) {
		float reltmp_mp = calc_reltmp0(p, rhs, rhsav, cn1, cn2l, cn2s, cn3l, cn3s,
				cn4l, cn4s, i, j, k, ip, jp, kp);
		reltmp = reltmp_mp - p[FTNREF3D0(i,j,k,ip+3,jp+3)].s0;
		p[FTNREF3D0(i, j_lhs, k_lhs, ip + 3, jp + 3)].s1 = reltmp_mp;
	} else {
		float reltmp_mp = calc_reltmp1(p, rhs, rhsav, cn1, cn2l, cn2s, cn3l,
				cn3s, cn4l, cn4s, i, j, k, ip, jp, kp);
	    reltmp = reltmp_mp - p[FTNREF3D0(i,j,k,ip+3,jp+3)].s1;
		p[FTNREF3D0(i, j_lhs, k_lhs, ip + 3, jp + 3)].s0 = reltmp_mp;
	}
	return reltmp;
}
// ====================================================== 2 ===========================================================
 void press_pav_kernel (
		 float* pavs_th,
		 float* pcos_th,
         float2* p,
         float *dx1, float *dy1, float *dzn,
		 float *chunks_num,
		 float *chunks_denom,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
		) {
	const int ip = im;
	const int jp = jm;
	const int kp = km;
//#define 128 1
// A better approach is to sum per compute unit with a fixed number of threads
	unsigned int gl_id = get_global_id(0);
	unsigned int gr_id = get_group_id(0);
	unsigned int nunits = get_num_groups(0);
	unsigned int l_id =  get_local_id(0);
//  unsigned int i = l_id+1;
  unsigned int il_bound = ip % 128 == 0 ? ip/128 : ip/128 +1;
  float pav = 0.0F;
  float pco = 0.0F;
  unsigned int chunk_sz = kp / nunits;
  unsigned int kl_start= gr_id*chunk_sz;
  unsigned int kl_stop= (gr_id < nunits-1) ? (gr_id+1)* chunk_sz : kp;
  for (unsigned int kl = kl_start; kl<kl_stop; kl++) {
	unsigned int k = 1+kl;
  for (unsigned int il=0;il<il_bound;il++) {
	  unsigned int i = il*128 +l_id+1;
	  if (i<= ip) {
  for (unsigned int j=1; j<=jm;j++) {
	  float dxyz =  dx1[FTNREF1D(i,-1)] * dy1[FTNREF1D(j,0)] * dzn[FTNREF1D(k,-1)];
	         pav = pav + p[FTNREF3D0(i,j,k,ip+3,jp+3)].s0 * dxyz;
	         pco = pco + dxyz;
  } // for j
	  }  // if i <= ip
  } // for il
} // for kl
	pavs_th[l_id]=pav;
	pcos_th[l_id]=pco;
// On the CPU, this barrier breaks everything. On the GPU, the barrier is essential if 128 is larger than the physical warp size I think
// So we could be very ad-hoc-ish and have a test "if NTH>32"
//#if 128 > 32
  barrier(CLK_LOCAL_MEM_FENCE );
//#endif
  float pavs_g=0.0F;
  float pcos_g=0.0F;
  for (unsigned int ii=0;ii<128;ii++) {
  	pavs_g+=pavs_th[ii];
  	pcos_g+=pcos_th[ii];
	}
  	  chunks_num[gr_id] = pavs_g;
  	  chunks_denom[gr_id] = pcos_g;
} // END of press_pav_kernel()
// ============================================================== ==============================================================
// ====================================================== 2 ===========================================================
 void press_adj_kernel (
         float2* p,
         float *pav_ptr,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
        ) {
	const int ip = im;
	const int jp = jm;
	const int kp = km;
	float pav = *pav_ptr;
	  int idx = get_global_id(0);
	  if (idx<im*jm*km) {
//	  int k = idx;
	  int4 ijk = calc_loop_iters(idx,im,jm,km,1,1,1);
	  int j = ijk.s1;
	  int k = ijk.s2;
	  int i = ijk.s0;
	  p[FTNREF3D0(i, j, k, ip + 3, jp + 3)].s0 -= pav;
	  }
} // END of press_adj_kernel()
// ============================================================== ==============================================================
// ====================================================== 2 ===========================================================
 void press_boundp_kernel (
		 float2* p,
        const unsigned int im,
        const unsigned int jm,
        const unsigned int km
        ) {
	const int ip = im;
	const int jp = jm;
	const int kp = km;
    // New approach: global range = (jm+2)*(km+2) + (km+2)*(im+2)+(jm+2)*(im+2)
    unsigned int gl_id = get_global_id(0);
    if (gl_id < (jm+2)*(km+2) ) {
    	unsigned int k = gl_id / (jm+2) ;
    	unsigned int j = gl_id % (jm+2) ;
      //p(   0,j,k) = p(1 ,j,k)
      p[FTNREF3D0(0, j, k, ip + 3, jp + 3)] = p[FTNREF3D0(1, j, k, ip + 3, jp + 3)];  // SEGFAULTS
//      //p(im+1,j,k) = p(im,j,k)
      p[FTNREF3D0(im+1, j, k, ip + 3, jp + 3)] = p[FTNREF3D0(im, j, k, ip + 3, jp + 3)];  // SEGFAULTS
    } else if (gl_id <(jm+2)*(km+2) + (km+2)*(im+2)) {
  	  unsigned int k = (gl_id -(jm+2)*(km+2)) / (im+2) ;
  	  unsigned int i = (gl_id -(jm+2)*(km+2)) % (im+2);
      //p(i,   0,k) = p(i,jm,k)
      p[FTNREF3D0(i,0, k, ip + 3, jp + 3)] = p[FTNREF3D0(i, jm, k, ip + 3, jp + 3)];
//      //p(i,jm+1,k) = p(i, 1,k)
      p[FTNREF3D0(i,jm+1, k, ip + 3, jp + 3)] = p[FTNREF3D0(i, 1, k, ip + 3, jp + 3)];
    } else if (gl_id < (jm+2)*(km+2) + (km+2)*(im+2) + (jm+2)*(im+2)) {
  	  unsigned int j = (gl_id -(jm+2)*(km+2)-(km+2)*(im+2)) / (im+2) ;
  	  unsigned int i = (gl_id -(jm+2)*(km+2)-(km+2)*(im+2)) % (im+2) ;
      //p(i,j,   0) = p(i,j,1)
      p[FTNREF3D0(i, j, 0, ip + 3, jp + 3)] = p[FTNREF3D0(i, j, 1, ip + 3, jp + 3)]; // SEGFAULTS
      //p(i,j,km+1) = p(i,j,km)
      p[FTNREF3D0(i, j, km+1, ip + 3, jp + 3)] = p[FTNREF3D0(i, j, km, ip + 3, jp + 3)];
    }
} // END of press_boundp_kernel()
// ============================================================== ==============================================================
void boundp12c_ ( float2 *p,const unsigned int im,const unsigned int jm,const unsigned int km) {
	const unsigned int ip = im;
	const unsigned int jp = jm;
	const unsigned int kp = km;
//!
//! --computational boundary(neumann condition)
	// 0,0,0 .. 0, jm+1, km+1
	// im+1,0,0 .. im+1, jm+1, km+1
	for (unsigned int k = 0; k <= km + 1; k++) {
		for (unsigned int j = 0; j <= jm + 1; j++) {
			for (unsigned int i = 0; i <= im + 1; i++) { //
				if (i == 0) {
					p[FTNREF3D0(0, j, k, ip + 3, jp + 3)] = p[FTNREF3D0(1, j, k,ip + 3, jp + 3)];
					p[FTNREF3D0(im + 1, j, k, ip + 3, jp + 3)] = p[FTNREF3D0(im,j, k, ip + 3, jp + 3)];
				}
			}
		}
	}
//	// 0,0,0 .. im+1, 0, km+1
//	// 0, jm+1,0 .. im+1, jm+1, km+1
	for (unsigned int k = 0; k <= km + 1; k++) {
		for (unsigned int j = 0; j <= jm + 1; j++) { //
			for (unsigned int i = 0; i <= im + 1; i++) {
				if (j == 0) {
					p[FTNREF3D0(i, 0, k, ip + 3, jp + 3)] = p[FTNREF3D0(i, jm, k, ip + 3, jp + 3)];
					p[FTNREF3D0(i, jm + 1, k, ip + 3, jp + 3)] = p[FTNREF3D0(i,1, k, ip + 3, jp + 3)];
				}
			}
		}
		}
//!
//! --computational boundary(neumann condition)
	// 0,0,0 .. im+1,km+1,0
	// 0,0,km+1 .. im+1,jm+1,km+1
	for (unsigned int k = 0; k <= km + 1; k++) { //
		for (unsigned int j = 0; j <= jm + 1; j++) {
			for (unsigned int i = 0; i <= im + 1; i++) {
				if (k == 0) {
					p[FTNREF3D0(i, j, 0, ip + 3, jp + 3)] = p[FTNREF3D0(i, j, 1,ip + 3, jp + 3)];
					p[FTNREF3D0(i, j, km + 1, ip + 3, jp + 3)] = p[FTNREF3D0(i,j, km, ip + 3, jp + 3)];
				}
			}
		}
	}
//!
}
void boundp_new( float2 *p,const unsigned int im,const unsigned int jm,const unsigned int km,unsigned int idx_g,unsigned int idx_l) {
	const unsigned int ip = im;
	const unsigned int jp = jm;
	const unsigned int kp = km;
				unsigned int i,j,k;
			// Now, we consider the planes, ribs and corners by setting the bounds on the ranges
			// 1. Planes
			// 1.1 E/W planes, i.e. i = 0/1 im/im+1 for all j and k
			j = idx_g;
			k = idx_l;
			if (j>0 && j<=jm && k>0 && k<=km) {
				p[FTNREF3D0(0,j,k,ip+3,jp+3)] = p[FTNREF3D0(1,j,k,ip+3,jp+3)];
				p[FTNREF3D0(im+1,j,k,ip+3,jp+3)] = p[FTNREF3D0(im,j,k,ip+3,jp+3)];
			}
			// 1.2 N/S planes, i.e. j = 0/1 jm/jm+1 for all i and k
			i = idx_g;
			k = idx_l;
			if (i>0 && i<=im && k>0 && k<=km) {
				p[FTNREF3D0(i,0,k,ip+3,jp+3)] = p[FTNREF3D0(i,jm,k,ip+3,jp+3)];
				p[FTNREF3D0(i,jm+1,k,ip+3,jp+3)] = p[FTNREF3D0(i,1,k,ip+3,jp+3)];
			}
			// 1.3 T/B planes, i.e. k = 0/1 km/km+1 for all i and j
			//FIXME! this somehow results in WRONG values in the inner cube!
			i = idx_g;
			j = idx_l;
			if (i>0 && i<=im && j>0 && j<=jm) {
				p[FTNREF3D0(i,j,0,ip+3,jp+3)] = p[FTNREF3D0(i,j,1,ip+3,jp+3)];
				p[FTNREF3D0(i,j,km+1,ip+3,jp+3)] = p[FTNREF3D0(i,j,km,ip+3,jp+3)];
			}
			// 2. Ribs
			// 2.1 Ribs for E/W planes, so we have 8 of them
			// Vertical ribs on E/W planes
			k = idx_l;
			if (k > 0 && k <= km) {
				// Vertical ribs on W plane : i=0, j=0 ; i=0, j=jm+1
				p[FTNREF3D0(0,0,k,ip+3,jp+3)] = p[FTNREF3D0(1,jm,k,ip+3,jp+3)];
				p[FTNREF3D0(0,jm+1,k,ip+3,jp+3)] = p[FTNREF3D0(1,1,k,ip+3,jp+3)];
				// Vertical ribs on E plane : i=jm+1, j=0 ; i=jm+1, j=jm+1
				p[FTNREF3D0(im+1,0,k,ip+3,jp+3)] = p[FTNREF3D0(im,jm,k,ip+3,jp+3)];
				p[FTNREF3D0(im+1,jm+1,k,ip+3,jp+3)] = p[FTNREF3D0(im,1,k,ip+3,jp+3)];
			}
			// Horizontal ribs on E/W plane
			j = idx_l;
			if (j>0 && j<=jm ) {
				// Horizontal ribs on W plane: k=0, i=0; k=km+1; i=0
				p[FTNREF3D0(0,j,0,ip+3,jp+3)] = p[FTNREF3D0(1,j,1,ip+3,jp+3)];
				p[FTNREF3D0(0,j,km+1,ip+3,jp+3)] = p[FTNREF3D0(1,j,km,ip+3,jp+3)];
				// Horizontal ribs on E plane: k=0, i=im+1; k=km+1; i=im+1
				p[FTNREF3D0(im+1,j,0,ip+3,jp+3)] = p[FTNREF3D0(im,j,1,ip+3,jp+3)];
				p[FTNREF3D0(im+1,j,km+1,ip+3,jp+3)] = p[FTNREF3D0(im,j,km,ip+3,jp+3)];
			}
			// 2.2 Ribs for N/S planes, so we have 4 of them
			i = idx_l;
			if (i>0 && i<=im ) {
				// Horizontal ribs on S plane: k=0, j=0; k=km+1; j=0
				p[FTNREF3D0(i,0,0,ip+3,jp+3)] = p[FTNREF3D0(i,jm,1,ip+3,jp+3)];
				p[FTNREF3D0(i,0,km+1,ip+3,jp+3)] = p[FTNREF3D0(i,jm,km,ip+3,jp+3)];
				// Horizontal ribs on N plane: k=0, j=jm+1; k=km+1; j=jm+1
				p[FTNREF3D0(i,jm+1,0,ip+3,jp+3)] = p[FTNREF3D0(i,1,1,ip+3,jp+3)];
				p[FTNREF3D0(i,jm+1,km+1,ip+3,jp+3)] = p[FTNREF3D0(i,1,km,ip+3,jp+3)];
			}
			// 2.3 The ribs for the T/B planes are already covered by the above.
			// 3. Corners
			// bottom-left, N
			p[FTNREF3D0(0,0,0,ip+3,jp+3)] = p[FTNREF3D0(1,jm,1,ip+3,jp+3)];
			// bottom-right, N
		    p[FTNREF3D0(im+1,0,0,ip+3,jp+3)] = p[FTNREF3D0(im,jm,1,ip+3,jp+3)];
			// top-left, N
			p[FTNREF3D0(0,0,km+1,ip+3,jp+3)] = p[FTNREF3D0(1,jm,km,ip+3,jp+3)];
			// top-right, N
		    p[FTNREF3D0(im+1,0,km+1,ip+3,jp+3)] = p[FTNREF3D0(im,jm,km,ip+3,jp+3)];
			// bottom-left, S
			p[FTNREF3D0(0,jm+1,0,ip+3,jp+3)] = p[FTNREF3D0(1,1,1,ip+3,jp+3)];
			// bottom-right, S
		    p[FTNREF3D0(im+1,jm+1,0,ip+3,jp+3)] = p[FTNREF3D0(im,1,1,ip+3,jp+3)];
			// top-left, S
			p[FTNREF3D0(0,jm+1,km+1,ip+3,jp+3)] = p[FTNREF3D0(1,1,km,ip+3,jp+3)];
			// top-right, S
		    p[FTNREF3D0(im+1,jm+1,km+1,ip+3,jp+3)] = p[FTNREF3D0(im,1,km,ip+3,jp+3)];
}
// ========= END OF SUBKERNELS ======

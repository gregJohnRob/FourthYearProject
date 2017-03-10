int get_global_id (int idx) {
    return 0;
}
int get_local_id (int idx) {
    return 0;
}
int get_group_id (int idx) {
    return 0;
}
#include <math.h>
#define NTH 128
#define NUNITS 16


#include "array_index_f2c1d.h"

void adam_map_26( int *km, float *f, float *g, float *h, float *fold, float *gold, float *hold, int *jm, int *im) {

    #include "params_common_sn.h"
        // local vars: fd,gd,hd,i,j,k
    float fd;
    float gd;
    float hd;
    int i;
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id*1.0/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                fd = f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)];
                gd = g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)];
                hd = h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)];
                f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = 1.5*f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-0.5*fold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)];
                g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = 1.5*g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-0.5*gold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)];
                h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = 1.5*h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-0.5*hold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)];
                fold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)] = fd;
                gold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)] = gd;
                hold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)] = hd;
        }
void bondv1_map_29( int *im, float *z2, float *dzn, int *ical, int *n, int *km, int *i, int *jm, int *k, float *u, float *v, float *w) {

    #include "params_common_sn.h"
        // local vars: j,k2
    int j;
    
        // parallelfortran: synthesised loop variable decls
    int i_range;
    int k_range;
    int j_range;
    int i_rel;
    int k_rel;
    int j_rel;
    int k2=0;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        i_range = ((*im)-0);
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_rel = (global_id*1.0/(k_range*j_range));
        *i = i_rel+0;
        k_rel = ((global_id-(i_rel*(k_range*j_range)))*1.0/j_range);
        *k = k_rel+1;
        j_rel = ((global_id-(i_rel*(k_range*j_range)))-(k_rel*j_range));
        j = j_rel+1;
        // parallelfortran: original code
      if (*i<2) {
      if (*k<79) {
                    k2 = *k;
       } else {
                    k2 = 77;
      }
              u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *i,j,*k)] = 5.*pow((float)(((z2[F1D2C(1 , k2)]+0.5*dzn[F1D2C((-1) , k2)])*1.0/600.)),(float)(0.2));
              v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *i,j,*k)] = 0.0;
              w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , *i,j,*k)] = 0.0;
        } else {
      if (ical == 0 && *n == 1) {
              u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *i,j,*k)] = 5.*pow((float)(((z2[F1D2C(1 , k2)]+0.5*dzn[F1D2C((-1) , k2)])*1.0/600.)),(float)(0.2));
              v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *i,j,*k)] = 0.0;
              w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , *i,j,*k)] = 0.0;
       }
       }
       }
void bondv1_reduce_56( float *u, int *im, int *j, int *k, float *global_aaa_array, float *global_bbb_array) {

    #include "params_common_sn.h"
        // missing args: 
        // local vars: 
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int k_rel;
    int j_rel;
    int chunk_size;
    int local_id;
    int local_id_fortran;
    int group_id;
    int group_id_fortran;
    int global_id;
    int r_iter;
    int local_chunk_size;
    int start_position;
    int k2=0;
        // arrays prefixed with __PH0__ should be declared using the __PH1__ modifier in c kernel version
    float local_aaa_array[(NTH - 1 +1)];
    float local_bbb_array[(NTH - 1 +1)];
    float local_aaa;
    int km;
    int jm;
    float clk_local_mem_fence;
    float local_bbb;
        local_id = get_local_id(0);
        group_id = get_group_id(0);
        global_id = get_global_id(0);
        // local_id_fortran and group_id_fortran are used to reconcile the fact that fortran arrays are referenced from 1
        // not 0 like other opencl supporting languages
        local_id_fortran = local_id+1;
        group_id_fortran = group_id+1;
        local_chunk_size = (((kp*jp)*1.0/NTH)*1.0/NUNITS);
        start_position = local_chunk_size*global_id;
        local_aaa = 0;
        local_bbb = 0;
    for (r_iter = start_position;r_iter <= ((start_position + local_chunk_size) - 1);r_iter += 1) {
                k_range = kp-1;
                j_range = jp-1;
                k_rel = r_iter*1.0/j_range;
                *k = k_rel+1;
                j_rel = (r_iter-(k_rel*j_range));
                *j = j_rel+1;
                local_aaa = fmax(local_aaa,u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , ip,*j,*k)]);
                local_bbb = fmin(local_bbb,u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , ip,*j,*k)]);
    }
        local_aaa_array[F1D2C(1 , local_id_fortran)] = local_aaa;
        local_bbb_array[F1D2C(1 , local_id_fortran)] = local_bbb;
    
        local_aaa = 0;
        local_bbb = 0;
    for (r_iter = 1;r_iter <= NTH;r_iter += 1) {
                local_aaa = fmax(local_aaa,local_aaa_array[F1D2C(1 , r_iter)]);
                local_bbb = fmin(local_bbb,local_bbb_array[F1D2C(1 , r_iter)]);
    }
        global_aaa_array[F1D2C(1 , group_id_fortran)] = local_aaa;
        global_bbb_array[F1D2C(1 , group_id_fortran)] = local_bbb;
    }
void bondv1_map_64( int *km, int *im, float *u, float *dt, float *uout, float *dxs, float *v, float *w, int *jm, int *k) {

    #include "params_common_sn.h"
        // local vars: j
    int j;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int k_rel;
    int j_rel;
    int k2;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        k_rel = global_id*1.0/j_range;
        *k = k_rel+1;
        j_rel = (global_id-(k_rel*j_range));
        j = j_rel+1;
        // parallelfortran: original code
              u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *im,j,*k)] = u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *im,j,*k)]-(*dt)*(*uout)*(u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *im,j,*k)]-u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , (*im)-1,j,*k)])*1.0/dxs[F1D2C(0 , *im)];
              v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , (*im)+1,j,*k)] = v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , (*im)+1,j,*k)]-(*dt)*(*uout)*(v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , (*im)+1,j,*k)]-v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *im,j,*k)])*1.0/dxs[F1D2C(0 , *im)];
              w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , (*im)+1,j,*k)] = w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , (*im)+1,j,*k)]-(*dt)*(*uout)*(w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , (*im)+1,j,*k)]-w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , *im,j,*k)])*1.0/dxs[F1D2C(0 , *im)];
       }
void bondv1_map_72( int *km, int *jm, float *u, float *v, float *w, int *im, int *k) {

    #include "params_common_sn.h"
        // local vars: i
    int i;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int i_range;
    int k_rel;
    int i_rel;
    int k2;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = (((*km)+1)-0);
        i_range = (((*im)+1)-0);
        k_rel = global_id*1.0/i_range;
        *k = k_rel+0;
        i_rel = (global_id-(k_rel*i_range));
        i = i_rel+0;
        // parallelfortran: original code
                u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,0,*k)] = u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,*jm,*k)];
                u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,(*jm)+1,*k)] = u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,1,*k)];
                v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,0,*k)] = v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,*jm,*k)];
                v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,(*jm)+1,*k)] = v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,1,*k)];
        if (*k<*km+1) {
                w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,0,*k)] = w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,*jm,*k)];
                w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,(*jm)+1,*k)] = w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,1,*k)];
        }
        }
void bondv1_map_85( int *jm, float *u, int *km, float *v, int *im, int *j, float *w) {

    #include "params_common_sn.h"
        // local vars: i
    int i;
        // parallelfortran: synthesised loop variable decls
    int j_range;
    int i_range;
    int j_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        j_range = (((*jm)+2)-(-1));
        i_range = (((*im)+1)-(-1));
        j_rel = global_id*1.0/i_range;
        *j = (j_rel+(-1));
        i_rel = (global_id-(j_rel*i_range));
        i = (i_rel+(-1));
        // parallelfortran: original code
      if (i>-1  &&  *j>-1  &&  *j<*jm+1) {
                u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,*j,0)] = -u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,*j,1)];
                u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,*j,(*km)+1)] = u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,*j,*km)];
                v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,*j,0)] = -v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,*j,1)];
                v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,*j,(*km)+1)] = v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,*j,*km)];
        }
                w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,*j,0)] = 0.0;
                w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,*j,*km)] = 0.0;
        }
void feedbf_map_37( int *km, float *usum, float *u, float *bmask1, float *vsum, float *v, float *cmask1, float *wsum, float *w, float *dmask1, float *alpha, float *dt, float *beta, int *jm, int *im, float *f, float *fx, float *g, float *fy, float *h, float *fz) {

    #include "params_common_sn.h"
        // local vars: f1x,f1y,f1z,f2x,f2y,f2z,i,j,k
    float f1x;
    float f1y;
    float f1z;
    float f2x;
    float f2y;
    float f2z;
    int i;
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id*1.0/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                usum[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = (usum[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*bmask1[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - 0 )+1) , (-1),0,0 , i,j,k)];
                vsum[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = (vsum[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*cmask1[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)];
                wsum[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = (wsum[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)])*dmask1[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)];
                f1x = (*alpha)*usum[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]*(*dt);
                f1y = (*alpha)*vsum[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]*(*dt);
                f1z = (*alpha)*wsum[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]*(*dt);
                f2x = (*beta)*u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)]*bmask1[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - 0 )+1) , (-1),0,0 , i,j,k)];
                f2y = (*beta)*v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)]*cmask1[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)];
                f2z = (*beta)*w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)]*dmask1[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)];
                fx[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = f1x+f2x;
                fy[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = f1y+f2y;
                fz[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = f1z+f2z;
                  f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+fx[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)];
                  g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+fy[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)];
                  h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+fz[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)];
         }
void les_map_71( int *km, float *dx1, float *dy1, float *dzn, float *delx1) {

    #include "params_common_sn.h"
        // local vars: k
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int k_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_rel = global_id;
        k = k_rel+1;
        // parallelfortran: original code
                    delx1[F1D2C(1 , k)] = pow((float)((dx1[F1D2C((-1) , 0)]*dy1[F1D2C(0 , 0)]*dzn[F1D2C((-1) , k)])),(float)(1.*1.0/3.));
          }
void les_map_76( int *km, float *diu1, float *diu2, float *diu3, float *diu4, float *diu5, float *diu6, float *diu7, float *diu8, float *diu9, float *delx1, int *jm, int *im, float *sm) {

    #include "params_common_sn.h"
        // local vars: csx1,dudxx1,dudyx1,dudzx1,dvdxx1,dvdyx1,dvdzx1,dwdxx1,dwdyx1,dwdzx1,i,j,k
    float csx1;
    float dudxx1;
    float dudyx1;
    float dudzx1;
    float dvdxx1;
    float dvdyx1;
    float dvdzx1;
    float dwdxx1;
    float dwdyx1;
    float dwdzx1;
    int i;
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    float cs0=0.1;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id*1.0/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
            dudxx1 = diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
            dudyx1 = (diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j,k)]+diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j+1,k)]+diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])*.25;
            dudzx1 = (diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j,k)]+diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j,k+1)]+diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])*.25;
            dvdxx1 = (diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j-1,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j-1,k)])*.25;
            dvdyx1 = diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
            dvdzx1 = (diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j-1,k)]+diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j-1,k+1)]+diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])*.25;
            dwdxx1 = (diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k-1)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k-1)])*.25;
            dwdyx1 = (diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k-1)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k-1)])*.25;
            dwdzx1 = diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
            csx1 = cs0;
            sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)] = pow((float)((csx1*delx1[F1D2C(1 , k)])),(float)(2))*sqrt(2.*(pow((float)(dudxx1),(float)(2))+pow((float)(dvdyx1),(float)(2))+pow((float)(dwdzx1),(float)(2)))+pow((float)(dudyx1+dvdxx1),(float)(2))+pow((float)(dwdyx1+dvdzx1),(float)(2))+pow((float)(dudzx1+dwdxx1),(float)(2)));
      }
void les_map_99( int *km, float *sm, float *dy1, float *dx1, float *dzn, float *diu1, float *diu2, float *diu4, float *diu3, float *diu7, float *f, int *jm, int *im, float *diu5, float *diu6, float *diu8, float *g, float *diu9, float *h) {

    #include "params_common_sn.h"
        // local vars: evsx1,evsx2,evsy1,evsy2,evsz1,evsz2,i,j,k,vfu,vfv,vfw,visux1,visux2,visuy1,visuy2,visuz1,visuz2,visvx1,visvx2,visvy1,visvy2,visvz1,visvz2,viswx1,viswx2,viswy1,viswy2,viswz1,viswz2
    float evsx1;
    float evsx2;
    float evsy1;
    float evsy2;
    float evsz1;
    float evsz2;
    int i;
    int j;
    int k;
    float vfu;
    float vfv;
    float vfw;
    float visux1;
    float visux2;
    float visuy1;
    float visuy2;
    float visuz1;
    float visuz2;
    float visvx1;
    float visvx2;
    float visvy1;
    float visvy2;
    float visvz1;
    float visvz2;
    float viswx1;
    float viswx2;
    float viswy1;
    float viswy2;
    float viswz1;
    float viswz2;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id*1.0/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
            evsx2 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)];
            evsx1 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)];
            evsy2 = (dy1[F1D2C(0 , j+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dy1[F1D2C(0 , j)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j+1,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))*1.0/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
            evsy1 = (dy1[F1D2C(0 , j+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j-1,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j-1,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dy1[F1D2C(0 , j)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))*1.0/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
            evsz2 = (dzn[F1D2C((-1) , k+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k+1)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))*1.0/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            evsz1 = (dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k-1)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k-1)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dzn[F1D2C((-1) , k-1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))*1.0/(dzn[F1D2C((-1) , k-1)]+dzn[F1D2C((-1) , k)]);
            visux2 = (evsx2)*2.*diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i+1,j,k)];
            visux1 = (evsx1)*2.*diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
            visuy2 = (evsy2)*(diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]);
            visuy1 = (evsy1)*(diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j-1,k)]);
            visuz2 = (evsz2)*(diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]);
            visuz1 = (evsz1)*(diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k-1)]);
            vfu = (visux2-visux1)*1.0/dx1[F1D2C((-1) , i)]+(visuy2-visuy1)*1.0/dy1[F1D2C(0 , j)]+(visuz2-visuz1)*1.0/dzn[F1D2C((-1) , k)];
            f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = (f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+vfu);
            evsy2 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k)];
            evsy1 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)];
            evsx2 = (dy1[F1D2C(0 , j+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dy1[F1D2C(0 , j)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j+1,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))*1.0/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
            evsx1 = (dy1[F1D2C(0 , j+1)]*((dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i-1,j,k)]+dx1[F1D2C((-1) , i-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)])*1.0/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)]))+dy1[F1D2C(0 , j)]*((dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i-1,j+1,k)]+dx1[F1D2C((-1) , i-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k)])*1.0/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)])))*1.0/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
            evsz2 = (dzn[F1D2C((-1) , k+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k+1)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))*1.0/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            evsz1 = (dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k-1)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k-1)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dzn[F1D2C((-1) , k-1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))*1.0/(dzn[F1D2C((-1) , k-1)]+dzn[F1D2C((-1) , k)]);
            visvx2 = (evsx2)*(diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]);
            visvx1 = (evsx1)*(diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j+1,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]);
            visvy2 = (evsy2)*2.*diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j+1,k)];
            visvy1 = (evsy1)*2.*diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
            visvz2 = (evsz2)*(diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)]);
            visvz1 = (evsz1)*(diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k-1)]);
            vfv = (visvx2-visvx1)*1.0/dx1[F1D2C((-1) , i)]+(visvy2-visvy1)*1.0/dy1[F1D2C(0 , j)]+(visvz2-visvz1)*1.0/dzn[F1D2C((-1) , k)];
            g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = (g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+vfv);
            evsz2 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)];
            evsz1 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)];
            evsx2 = (dzn[F1D2C((-1) , k+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k+1)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))*1.0/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            evsx1 = (dzn[F1D2C((-1) , k+1)]*((dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i-1,j,k)]+dx1[F1D2C((-1) , i-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)])*1.0/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)]))+dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i-1,j,k+1)]+dx1[F1D2C((-1) , i-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)])*1.0/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)])))*1.0/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            evsy2 = (dzn[F1D2C((-1) , k+1)]*((dy1[F1D2C(0 , j+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dy1[F1D2C(0 , j)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k)])*1.0/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]))+dzn[F1D2C((-1) , k)]*((dy1[F1D2C(0 , j+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)]+dy1[F1D2C(0 , j)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k+1)])*1.0/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)])))*1.0/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            evsy1 = (dzn[F1D2C((-1) , k+1)]*((dy1[F1D2C(0 , j)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j-1,k)]+dy1[F1D2C(0 , j-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)])*1.0/(dy1[F1D2C(0 , j-1)]+dy1[F1D2C(0 , j)]))+dzn[F1D2C((-1) , k)]*((dy1[F1D2C(0 , j)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j-1,k+1)]+dy1[F1D2C(0 , j-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)])*1.0/(dy1[F1D2C(0 , j-1)]+dy1[F1D2C(0 , j)])))*1.0/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            viswx2 = (evsx2)*(diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]);
            viswx1 = (evsx1)*(diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j,k+1)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]);
            viswy2 = (evsy2)*(diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)]);
            viswy1 = (evsy1)*(diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j-1,k+1)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]);
            viswz2 = (evsz2)*2.*diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)];
            viswz1 = (evsz1)*2.*diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
            vfw = (viswx2-viswx1)*1.0/dx1[F1D2C((-1) , i)]+(viswy2-viswy1)*1.0/dy1[F1D2C(0 , j)]+(viswz2-viswz1)*1.0/dzn[F1D2C((-1) , k)];
            h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = (h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+vfw);
      }
void press_map_58( int *km, float *u, float *dx1, float *v, float *dy1, float *w, float *dzn, float *f, float *g, float *h, float *rhs, float *dt, int *jm, int *im) {

    #include "params_common_sn.h"
        // local vars: i,j,k
    int i;
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id*1.0/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)] = (-u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*1.0/dx1[F1D2C((-1) , i)]+(-v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*1.0/dy1[F1D2C(0 , j)]+(-w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k-1)]+w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)])*1.0/dzn[F1D2C((-1) , k)];
                rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)] = (f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i-1,j,k)])*1.0/dx1[F1D2C((-1) , i)]+(g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j-1,k)])*1.0/dy1[F1D2C(0 , j)]+(h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k-1)])*1.0/dzn[F1D2C((-1) , k)]+rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)]*1.0/(*dt);
        }
void press_reduce_71( float *dx1, float *dy1, float *dzn, float *rhs, float *global_rhsav_array, float *global_area_array) {

    #include "params_common_sn.h"
        // missing args: 
        // local vars: i,j,k
    int i;
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    int chunk_size;
    int local_id;
    int local_id_fortran;
    int group_id;
    int group_id_fortran;
    int global_id;
    int r_iter;
    int local_chunk_size;
    int start_position;
        // arrays prefixed with __PH0__ should be declared using the __PH1__ modifier in c kernel version
    float local_rhsav_array[(NTH - 1 +1)];
    float local_area_array[(NTH - 1 +1)];
    float local_rhsav;
    int im;
    int km;
    int jm;
    float local_area;
        local_id = get_local_id(0);
        group_id = get_group_id(0);
        global_id = get_global_id(0);
        // local_id_fortran and group_id_fortran are used to reconcile the fact that fortran arrays are referenced from 1
        // not 0 like other opencl supporting languages
        local_id_fortran = local_id+1;
        group_id_fortran = group_id+1;
        local_chunk_size = (((kp*(jp*ip))*1.0/NTH)*1.0/NUNITS);
        start_position = local_chunk_size*global_id;
        local_rhsav = 0;
        local_area = 0;
    for (r_iter = start_position;r_iter <= ((start_position + local_chunk_size) - 1);r_iter += 1) {
                k_range = kp-1;
                j_range = jp-1;
                i_range = ip-1;
                k_rel = (r_iter*1.0/(j_range*i_range));
                k = k_rel+1;
                j_rel = ((r_iter-(k_rel*(j_range*i_range)))*1.0/i_range);
                j = j_rel+1;
                i_rel = ((r_iter-(k_rel*(j_range*i_range)))-(j_rel*i_range));
                i = i_rel+1;
                local_rhsav = (local_rhsav+(((dx1[F1D2C((-1) , i)]*dy1[F1D2C(0 , j)])*dzn[F1D2C((-1) , k)])*rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)]));
                local_area = (local_area+((dx1[F1D2C((-1) , i)]*dy1[F1D2C(0 , j)])*dzn[F1D2C((-1) , k)]));
    }
        local_rhsav_array[F1D2C(1 , local_id_fortran)] = local_rhsav;
        local_area_array[F1D2C(1 , local_id_fortran)] = local_area;
    
        local_rhsav = 0;
        local_area = 0;
    for (r_iter = 1;r_iter <= NTH;r_iter += 1) {
                local_rhsav = (local_rhsav+local_rhsav_array[F1D2C(1 , r_iter)]);
                local_area = (local_area+local_area_array[F1D2C(1 , r_iter)]);
    }
        global_rhsav_array[F1D2C(1 , group_id_fortran)] = local_rhsav;
        global_area_array[F1D2C(1 , group_id_fortran)] = local_area;
    }
void press_map_82( int *km, float *rhs, float *rhsav, int *jm, int *im) {

    #include "params_common_sn.h"
        // local vars: i,j,k
    int i;
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id*1.0/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)] = rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)]-(*rhsav);
        }
void press_map_93( int *km, float *cn1, float *cn2l, float *p, float *cn2s, float *cn3l, float *cn3s, float *cn4l, float *cn4s, float *rhs, int *jm, int *k, int *j, int *nrd, int *im) {

    #include "params_common_sn.h"
        // local vars: i,reltmp,sor
    int i;
    float reltmp;
    float sor=0.0;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    float omega = 1.0;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-(1+ ( (((*k)+(*j))+(*nrd)) % 2) ));
        k_rel = (global_id*1.0/(j_range*i_range));
        *k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        *j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = (i_rel+(1+((((*k)+(*j))+(*nrd)) % 2)));
        // parallelfortran: original code
                    reltmp = omega*(cn1[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,*j,*k)]*(cn2l[F1D2C(1 , i)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,*j,*k)]+cn2s[F1D2C(1 , i)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,*j,*k)]+cn3l[F1D2C(1 , *j)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,(*j)+1,*k)]+cn3s[F1D2C(1 , *j)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,(*j)-1,*k)]+cn4l[F1D2C(1 , *k)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*j,(*k)+1)]+cn4s[F1D2C(1 , *k)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*j,(*k)-1)]-rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,*j,*k)])-p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*j,*k)]);
                    p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*j,*k)] = p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*j,*k)]+reltmp;
                    sor = sor+reltmp*reltmp;
          }
void press_reduce_114( float *p, float *dx1, float *dy1, float *dzn, float *global_pav_array, float *global_pco_array) {

    #include "params_common_sn.h"
        // missing args: 
        // local vars: i,j,k
    int i;
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    int chunk_size;
    int local_id;
    int local_id_fortran;
    int group_id;
    int group_id_fortran;
    int global_id;
    int r_iter;
    int local_chunk_size;
    int start_position;
        // arrays prefixed with __PH0__ should be declared using the __PH1__ modifier in c kernel version
    float local_pav_array[(NTH - 1 +1)];
    float local_pco_array[(NTH - 1 +1)];
    float local_pav;
    float clk_local_mem_fence;
    int jm;
    int im;
    int km;
    float local_pco;
        local_id = get_local_id(0);
        group_id = get_group_id(0);
        global_id = get_global_id(0);
        // local_id_fortran and group_id_fortran are used to reconcile the fact that fortran arrays are referenced from 1
        // not 0 like other opencl supporting languages
        local_id_fortran = local_id+1;
        group_id_fortran = group_id+1;
        local_chunk_size = (((kp*(jp*ip))*1.0/NTH)*1.0/NUNITS);
        start_position = local_chunk_size*global_id;
        local_pav = 0;
        local_pco = 0;
    for (r_iter = start_position;r_iter <= ((start_position + local_chunk_size) - 1);r_iter += 1) {
                k_range = kp-1;
                j_range = jp-1;
                i_range = ip-1;
                k_rel = (r_iter*1.0/(j_range*i_range));
                k = k_rel+1;
                j_rel = ((r_iter-(k_rel*(j_range*i_range)))*1.0/i_range);
                j = j_rel+1;
                i_rel = ((r_iter-(k_rel*(j_range*i_range)))-(j_rel*i_range));
                i = i_rel+1;
                local_pav = (local_pav+(((p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]*dx1[F1D2C((-1) , i)])*dy1[F1D2C(0 , j)])*dzn[F1D2C((-1) , k)]));
                local_pco = (local_pco+((dx1[F1D2C((-1) , i)]*dy1[F1D2C(0 , j)])*dzn[F1D2C((-1) , k)]));
    }
        local_pav_array[F1D2C(1 , local_id_fortran)] = local_pav;
        local_pco_array[F1D2C(1 , local_id_fortran)] = local_pco;
    
        local_pav = 0;
        local_pco = 0;
    for (r_iter = 1;r_iter <= NTH;r_iter += 1) {
                local_pav = (local_pav+local_pav_array[F1D2C(1 , r_iter)]);
                local_pco = (local_pco+local_pco_array[F1D2C(1 , r_iter)]);
    }
        global_pav_array[F1D2C(1 , group_id_fortran)] = local_pav;
        global_pco_array[F1D2C(1 , group_id_fortran)] = local_pco;
    }
void press_map_124( int *km, float *p, float *pav, int *jm, int *im) {

    #include "params_common_sn.h"
        // local vars: i,j,k
    int i;
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id*1.0/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]-(*pav);
        }
void vel2_map_48( int *km, float *u, float *dx1, float *v, float *dy1, float *w, float *dzn, float *nou1, float *diu1, float *nou5, float *diu5, float *nou9, float *diu9, int *jm, int *im, float *nou2, float *diu2, float *dzs, float *nou3, float *diu3, float *nou4, float *diu4, float *nou6, float *diu6, float *cov1, float *cov5, float *cov9, float *cov2, float *cov3, float *cov4, float *cov6) {

    #include "params_common_sn.h"
        // local vars: i,j,k
    int i;
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    float u0=0.0;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = (((*km)+1)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id*1.0/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
    if ((k < *km)) {
                nou1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = (u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*1.0/2.;
                diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = (-u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*1.0/dx1[F1D2C((-1) , i)];
                nou5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = (v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*1.0/2.;
                diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = (-v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*1.0/dy1[F1D2C(0 , j)];
                nou9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k-1)]+w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)])*1.0/2.;
                diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (-w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k-1)]+w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)])*1.0/dzn[F1D2C((-1) , k)];
                cov1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = nou1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]*diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
                cov5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = nou5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]*diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
                cov9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = nou9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]*diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
    }
    if ((k < *km)) {
                nou2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dx1[F1D2C((-1) , i+1)]*v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+dx1[F1D2C((-1) , i)]*v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i+1,j-1,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]);
                diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = 2.*(-u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*1.0/(dy1[F1D2C(0 , j-1)]+dy1[F1D2C(0 , j)]);
                cov2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = nou2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]*diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
    }
                nou3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dx1[F1D2C((-1) , i+1)]*w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k-1)]+dx1[F1D2C((-1) , i)]*w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i+1,j,k-1)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]);
                diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (-u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k-1)]+u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*1.0/dzs[F1D2C((-1) , k-1)];
                cov3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = nou3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]*diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
    if ((k < *km)) {
                nou4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dy1[F1D2C(0 , j+1)]*u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+dy1[F1D2C(0 , j)]*u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j+1,k)])*1.0/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
                diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = 2.*(-v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*1.0/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)]);
                cov4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (nou4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]-u0)*diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
    }
                nou6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dy1[F1D2C(0 , j+1)]*w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k-1)]+dy1[F1D2C(0 , j)]*w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j+1,k-1)])*1.0/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
                diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (-v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k-1)]+v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])*1.0/dzs[F1D2C((-1) , k-1)];
                cov6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = nou6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]*diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
        }
void vel2_map_105( int *km, float *dzn, float *u, float *w, float *dx1, float *nou7, float *diu7, int *jm, int *im, float *v, float *dy1, float *nou8, float *diu8, float *cov7, float *cov8) {

    #include "params_common_sn.h"
        // local vars: i,j,k
    int i;
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    float u0=0.0;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = (((*km)-1)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id*1.0/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                nou7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dzn[F1D2C((-1) , k+1)]*u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+dzn[F1D2C((-1) , k)]*u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k+1)])*1.0/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
                diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = 2.*(-w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i-1,j,k)]+w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)])*1.0/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)]);
                cov7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (nou7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]-u0)*diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
                nou8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dzn[F1D2C((-1) , k+1)]*v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+dzn[F1D2C((-1) , k)]*v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k+1)])*1.0/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
                diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = 2.*(-w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j-1,k)]+w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)])*1.0/(dy1[F1D2C(0 , j-1)]+dy1[F1D2C(0 , j)]);
                cov8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = nou8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]*diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
        }
void vel2_map_125( int *km, int *im, float *nou1, float *diu1, float *cov1, int *jm) {

    #include "params_common_sn.h"
        // local vars: j,k
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int k_rel;
    int j_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        k_rel = global_id*1.0/j_range;
        k = k_rel+1;
        j_rel = (global_id-(k_rel*j_range));
        j = j_rel+1;
        // parallelfortran: original code
                nou1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , (*im)+1,j,k)] = nou1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , *im,j,k)];
                diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , (*im)+1,j,k)] = diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , *im,j,k)];
                cov1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , (*im)+1,j,k)] = cov1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , *im,j,k)];
        }
void vel2_map_132( int *km, int *jm, float *nou2, float *diu2, float *cov2, int *im) {

    #include "params_common_sn.h"
        // local vars: i,k
    int i;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int i_range;
    int k_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        i_range = ((*im)-1);
        k_rel = global_id*1.0/i_range;
        k = k_rel+1;
        i_rel = (global_id-(k_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                nou2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,0,k)] = nou2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*jm,k)];
                diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,0,k)] = diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*jm,k)];
                cov2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,0,k)] = cov2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*jm,k)];
                nou2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,(*jm)+1,k)] = nou2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,1,k)];
                diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,(*jm)+1,k)] = diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,1,k)];
                cov2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,(*jm)+1,k)] = cov2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,1,k)];
        }
void vel2_map_142( int *km, int *im, float *nou4, float *diu4, float *cov4, int *jm) {

    #include "params_common_sn.h"
        // local vars: j,k
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int k_rel;
    int j_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        k_rel = global_id*1.0/j_range;
        k = k_rel+1;
        j_rel = (global_id-(k_rel*j_range));
        j = j_rel+1;
        // parallelfortran: original code
                nou4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = nou4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
                diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
                cov4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = cov4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
        }
void vel2_map_149( int *km, int *jm, float *nou5, float *diu5, float *cov5, int *im) {

    #include "params_common_sn.h"
        // local vars: i,k
    int i;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int i_range;
    int k_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        i_range = ((*im)-1);
        k_rel = global_id*1.0/i_range;
        k = k_rel+1;
        i_rel = (global_id-(k_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                nou5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,0,k)] = nou5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,*jm,k)];
                diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,0,k)] = diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,*jm,k)];
                cov5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,0,k)] = cov5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,*jm,k)];
                nou5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,(*jm)+1,k)] = nou5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,1,k)];
                diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,(*jm)+1,k)] = diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,1,k)];
                cov5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,(*jm)+1,k)] = cov5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,1,k)];
        }
void vel2_map_159( int *km, int *im, float *nou7, float *diu7, float *cov7, int *jm) {

    #include "params_common_sn.h"
        // local vars: j,k
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int k_rel;
    int j_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = (((*km)-1)-1);
        j_range = ((*jm)-1);
        k_rel = global_id*1.0/j_range;
        k = k_rel+1;
        j_rel = (global_id-(k_rel*j_range));
        j = j_rel+1;
        // parallelfortran: original code
                nou7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = nou7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
                diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
                cov7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = cov7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
        }
void vel2_map_166( int *km, int *jm, float *nou8, float *diu8, float *cov8, int *im) {

    #include "params_common_sn.h"
        // local vars: i,k
    int i;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int i_range;
    int k_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = (((*km)-1)-1);
        i_range = ((*im)-1);
        k_rel = global_id*1.0/i_range;
        k = k_rel+1;
        i_rel = (global_id-(k_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                nou8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,0,k)] = nou8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*jm,k)];
                diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,0,k)] = diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*jm,k)];
                cov8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,0,k)] = cov8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*jm,k)];
                nou8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,(*jm)+1,k)] = nou8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,1,k)];
                diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,(*jm)+1,k)] = diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,1,k)];
                cov8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,(*jm)+1,k)] = cov8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,1,k)];
        }
void vel2_map_177( int *km, int *im, float *diu2, float *diu3, int *jm) {

    #include "params_common_sn.h"
        // local vars: j,k
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int k_rel;
    int j_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = (((*km)+1)-1);
        j_range = (((*jm)+1)-1);
        k_rel = global_id*1.0/j_range;
        k = k_rel+1;
        j_rel = (global_id-(k_rel*j_range));
        j = j_rel+1;
        // parallelfortran: original code
                diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
                diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
        }
void vel2_map_183( int *km, int *jm, float *diu4, float *diu6, int *im) {

    #include "params_common_sn.h"
        // local vars: i,k
    int i;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int i_range;
    int k_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = (((*km)+1)-1);
        i_range = (((*im)+1)-1);
        k_rel = global_id*1.0/i_range;
        k = k_rel+1;
        i_rel = (global_id-(k_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,0,k)] = diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*jm,k)];
                diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,0,k)] = diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*jm,k)];
        }
void velfg_map_62( int *km, float *dx1, float *cov1, float *cov2, float *cov3, float *diu1, float *diu2, float *dy1, float *diu3, float *dzn, float *vn, float *dfu1, int *jm, int *im, float *cov4, float *cov5, float *cov6, float *diu4, float *diu5, float *diu6, float *dfv1, float *cov7, float *cov8, float *cov9, float *diu7, float *diu8, float *diu9, float *dzs, float *dfw1, float *f, float *g, float *h) {

    #include "params_common_sn.h"
        // local vars: covc,covx1,covy1,covz1,df,i,j,k
    float covc;
    float covx1;
    float covy1;
    float covz1;
    float df;
    int i;
    int j;
    int k;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id*1.0/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                covx1 = (dx1[F1D2C((-1) , i+1)]*cov1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]+dx1[F1D2C((-1) , i)]*cov1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i+1,j,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]);
                covy1 = (cov2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])*1.0/2.;
                covz1 = (cov3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])*1.0/2.;
                covc = covx1+covy1+covz1;
                dfu1[F3D2C(((ip - 0 )+1),((jp - 1 )+1) , 0,1,1 , i,j,k)] = 2.*(-diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]+diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i+1,j,k)])*1.0/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])+(-diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])*1.0/dy1[F1D2C(0 , j)]+(-diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])*1.0/dzn[F1D2C((-1) , k)];
                df = (*vn)*dfu1[F3D2C(((ip - 0 )+1),((jp - 1 )+1) , 0,1,1 , i,j,k)];
                f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = -covc+df;
                covx1 = (cov4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)])*1.0/2.;
                covy1 = (dy1[F1D2C(0 , j+1)]*cov5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]+dy1[F1D2C(0 , j)]*cov5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j+1,k)])*1.0/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
                covz1 = (cov6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])*1.0/2.;
                covc = covx1+covy1+covz1;
                dfv1[F3D2C(((ip - 1 )+1),((jp - 0 )+1) , 1,0,1 , i,j,k)] = (-diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)])*1.0/dx1[F1D2C((-1) , i)]+2.*(-diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]+diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j+1,k)])*1.0/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)])+(-diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])*1.0/dzn[F1D2C((-1) , k)];
                df = (*vn)*dfv1[F3D2C(((ip - 1 )+1),((jp - 0 )+1) , 1,0,1 , i,j,k)];
                g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = -covc+df;
    if ((k < (*km - 1))) {
              covx1 = (cov7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)])*1.0/2.;
              covy1 = (cov8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])*1.0/2.;
              covz1 = (dzn[F1D2C((-1) , k+1)]*cov9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+dzn[F1D2C((-1) , k)]*cov9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])*1.0/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
              covc = covx1+covy1+covz1;
                dfw1[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)] = (-diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)])*1.0/dx1[F1D2C((-1) , i)]+(-diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])*1.0/dy1[F1D2C(0 , j)]+(-diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])*1.0/dzs[F1D2C((-1) , k)];
                df = (*vn)*dfw1[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)];
                h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = -covc+df;
    }
    }
void velnw_map_27( int *km, float *p, float *ro, float *dxs, float *u, float *dt, float *f, int *jm, int *im, float *dys, float *v, float *g, float *dzs, float *w, float *h) {

    #include "params_common_sn.h"
        // local vars: i,j,k,pz
    int i;
    int j;
    int k;
    float pz;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id*1.0/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))*1.0/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                pz = (-p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)])*1.0/(*ro)*1.0/dxs[F1D2C(0 , i)];
                u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)] = u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)]+(*dt)*(f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-pz);
                u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)] = u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)];
                pz = (-p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])*1.0/(*ro)*1.0/dys[F1D2C(0 , j)];
                v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)] = v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)]+(*dt)*(g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-pz);
                v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)] = v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)];
    if ((k < (*km - 1))) {
                pz = (-p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])*1.0/(*ro)*1.0/dzs[F1D2C((-1) , k)];
                w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)] = w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)]+(*dt)*(h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-pz);
                w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)] = w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)];
    }
    }
void adam_bondv1_feedbf_les_press_v_etc_superkernel( int *km, float *f, float *g, float *h, float *fold, float *gold, float *hold, int *jm, int *im, float *z2, float *dzn, int *ical, int *n, int *i, int *k, float *u, float *v, float *w, int *j, float *global_aaa_array, float *global_bbb_array, float *dt, float *uout, float *dxs, float *usum, float *bmask1, float *vsum, float *cmask1, float *wsum, float *dmask1, float *alpha, float *beta, float *fx, float *fy, float *fz, float *dx1, float *dy1, float *delx1, float *diu1, float *diu2, float *diu3, float *diu4, float *diu5, float *diu6, float *diu7, float *diu8, float *diu9, float *sm, float *rhs, float *global_rhsav_array, float *global_area_array, float *rhsav, float *cn1, float *cn2l, float *p, float *cn2s, float *cn3l, float *cn3s, float *cn4l, float *cn4s, int *nrd, float *global_pav_array, float *global_pco_array, float *pav, float *nou1, float *nou5, float *nou9, float *nou2, float *dzs, float *nou3, float *nou4, float *nou6, float *cov1, float *cov5, float *cov9, float *cov2, float *cov3, float *cov4, float *cov6, float *nou7, float *nou8, float *cov7, float *cov8, float *vn, float *dfu1, float *dfv1, float *dfw1, float *ro, float *dys, int *state_ptr) {

#include "params_common_sn.h"
  int state;
  const int st_adam_map_26 = 0;
  const int st_bondv1_map_29 = 1;
  const int st_bondv1_reduce_56 = 2;
  const int st_bondv1_map_64 = 3;
  const int st_bondv1_map_72 = 4;
  const int st_bondv1_map_85 = 5;
  const int st_feedbf_map_37 = 6;
  const int st_les_map_71 = 7;
  const int st_les_map_76 = 8;
  const int st_les_map_99 = 9;
  const int st_press_map_58 = 10;
  const int st_press_reduce_71 = 11;
  const int st_press_map_82 = 12;
  const int st_press_map_93 = 13;
  const int st_press_reduce_114 = 14;
  const int st_press_map_124 = 15;
  const int st_vel2_map_48 = 16;
  const int st_vel2_map_105 = 17;
  const int st_vel2_map_125 = 18;
  const int st_vel2_map_132 = 19;
  const int st_vel2_map_142 = 20;
  const int st_vel2_map_149 = 21;
  const int st_vel2_map_159 = 22;
  const int st_vel2_map_166 = 23;
  const int st_vel2_map_177 = 24;
  const int st_vel2_map_183 = 25;
  const int st_velfg_map_62 = 26;
  const int st_velnw_map_27 = 27;
    state = *state_ptr;
  // SUPERKERNEL BODY
  switch ( state ) {
        case (st_adam_map_26): {
      adam_map_26(km,f,g,h,fold,gold,hold,jm,im);
        } break;
        case (st_bondv1_map_29): {
      bondv1_map_29(im,z2,dzn,ical,n,km,i,jm,k,u,v,w);
        } break;
        case (st_bondv1_reduce_56): {
      bondv1_reduce_56(u,im,j,k,global_aaa_array,global_bbb_array);
        } break;
        case (st_bondv1_map_64): {
      bondv1_map_64(km,im,u,dt,uout,dxs,v,w,jm,k);
        } break;
        case (st_bondv1_map_72): {
      bondv1_map_72(km,jm,u,v,w,im,k);
        } break;
        case (st_bondv1_map_85): {
      bondv1_map_85(jm,u,km,v,im,j,w);
        } break;
        case (st_feedbf_map_37): {
      feedbf_map_37(km,usum,u,bmask1,vsum,v,cmask1,wsum,w,dmask1,alpha,dt,beta,jm,im,f,fx,g,fy,h,fz);
        } break;
        case (st_les_map_71): {
      les_map_71(km,dx1,dy1,dzn,delx1);
        } break;
        case (st_les_map_76): {
      les_map_76(km,diu1,diu2,diu3,diu4,diu5,diu6,diu7,diu8,diu9,delx1,jm,im,sm);
        } break;
        case (st_les_map_99): {
      les_map_99(km,sm,dy1,dx1,dzn,diu1,diu2,diu4,diu3,diu7,f,jm,im,diu5,diu6,diu8,g,diu9,h);
        } break;
        case (st_press_map_58): {
      press_map_58(km,u,dx1,v,dy1,w,dzn,f,g,h,rhs,dt,jm,im);
        } break;
        case (st_press_reduce_71): {
      press_reduce_71(dx1,dy1,dzn,rhs,global_rhsav_array,global_area_array);
        } break;
        case (st_press_map_82): {
      press_map_82(km,rhs,rhsav,jm,im);
        } break;
        case (st_press_map_93): {
      press_map_93(km,cn1,cn2l,p,cn2s,cn3l,cn3s,cn4l,cn4s,rhs,jm,k,j,nrd,im);
        } break;
        case (st_press_reduce_114): {
      press_reduce_114(p,dx1,dy1,dzn,global_pav_array,global_pco_array);
        } break;
        case (st_press_map_124): {
      press_map_124(km,p,pav,jm,im);
        } break;
        case (st_vel2_map_48): {
      vel2_map_48(km,u,dx1,v,dy1,w,dzn,nou1,diu1,nou5,diu5,nou9,diu9,jm,im,nou2,diu2,dzs,nou3,diu3,nou4,diu4,nou6,diu6,cov1,cov5,cov9,cov2,cov3,cov4,cov6);
        } break;
        case (st_vel2_map_105): {
      vel2_map_105(km,dzn,u,w,dx1,nou7,diu7,jm,im,v,dy1,nou8,diu8,cov7,cov8);
        } break;
        case (st_vel2_map_125): {
      vel2_map_125(km,im,nou1,diu1,cov1,jm);
        } break;
        case (st_vel2_map_132): {
      vel2_map_132(km,jm,nou2,diu2,cov2,im);
        } break;
        case (st_vel2_map_142): {
      vel2_map_142(km,im,nou4,diu4,cov4,jm);
        } break;
        case (st_vel2_map_149): {
      vel2_map_149(km,jm,nou5,diu5,cov5,im);
        } break;
        case (st_vel2_map_159): {
      vel2_map_159(km,im,nou7,diu7,cov7,jm);
        } break;
        case (st_vel2_map_166): {
      vel2_map_166(km,jm,nou8,diu8,cov8,im);
        } break;
        case (st_vel2_map_177): {
      vel2_map_177(km,im,diu2,diu3,jm);
        } break;
        case (st_vel2_map_183): {
      vel2_map_183(km,jm,diu4,diu6,im);
        } break;
        case (st_velfg_map_62): {
      velfg_map_62(km,dx1,cov1,cov2,cov3,diu1,diu2,dy1,diu3,dzn,vn,dfu1,jm,im,cov4,cov5,cov6,diu4,diu5,diu6,dfv1,cov7,cov8,cov9,diu7,diu8,diu9,dzs,dfw1,f,g,h);
        } break;
        case (st_velnw_map_27): {
      velnw_map_27(km,p,ro,dxs,u,dt,f,jm,im,dys,v,g,dzs,w,h);
      }
  }
  }
  

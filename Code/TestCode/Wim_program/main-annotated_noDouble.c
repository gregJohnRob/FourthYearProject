int __attribute__((annotate("0 0 0"))) get_global_id (
    int __attribute__((annotate("20 20 0"))) idx)
{
    return 0;
}
int __attribute__((annotate("0 0 0"))) get_local_id (
    int __attribute__((annotate("20 20 0"))) idx)
{
    return 0;
}
int __attribute__((annotate("0 0 0"))) get_group_id (
    int __attribute__((annotate("20 20 0"))) idx)
{
    return 0;
}
#include <math.h>
#define NTH 128
#define NUNITS 16


#include "array_index_f2c1d.h"

void adam_map_26(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int *f,
    int *g,
    int *h,
    int *fold,
    int *gold,
    int *hold,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im)
{

    #include "params_common_sn.h"
        // local vars: fd,gd,hd,i,j,k
    int fd;
    int gd;
    int hd;
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
        k_rel = (global_id/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                fd = f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)];
                gd = g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)];
                hd = h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)];
                f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = ((f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]*3)/2)-(fold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)]/2);
                g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = ((g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]*3)/2)-(gold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)]/2);
                h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = ((h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]*3)/2)-(hold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)]/2);
                fold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)] = fd;
                gold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)] = gd;
                hold[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)] = hd;
        }
void bondv1_map_29(
    int *__attribute__((annotate("20 20 0"))) im,
    int *z2,
    int * __attribute__((annotate("10 1 4"))) dzn,
    int * __attribute__((annotate("1 0 0"))) ical,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) n ,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("20 20 0"))) i,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm ,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) k,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("50 0 3"))) v,
    int *__attribute__((annotate("50 0 3"))) w)
{

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
        i_rel = (global_id/(k_range*j_range));
        *i = i_rel+0;
        k_rel = ((global_id-(i_rel*(k_range*j_range)))/j_range);
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
              u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *i,j,*k)] = 5*pow((int)(((z2[F1D2C(1 , k2)]+(dzn[F1D2C((-1) , k2)]/2))/600)),0);
              v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *i,j,*k)] = 0;
              w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , *i,j,*k)] = 0;
        } else {
      if (ical == 0 && *n == 1) {
              u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *i,j,*k)] = 5*pow((int)(((z2[F1D2C(1 , k2)]+(dzn[F1D2C((-1) , k2)]/2))/600)),0);
              v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *i,j,*k)] = 0;
              w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , *i,j,*k)] = 0;
       }
       }
       }

void bondv1_reduce_56(
    int * __attribute__((annotate("50 0 3"))) u,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) j,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) k,
    int * __attribute__((annotate("50 0 3"))) global_aaa_array,
    int * __attribute__((annotate("50 0 3"))) global_bbb_array)
{

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
    int local_aaa_array[(NTH - 1 +1)];
    int local_bbb_array[(NTH - 1 +1)];
    int local_aaa;
    int km;
    int jm;
    int clk_local_mem_fence;
    int local_bbb;
        local_id = get_local_id(0);
        group_id = get_group_id(0);
        global_id = get_global_id(0);
        // local_id_fortran and group_id_fortran are used to reconcile the fact that fortran arrays are referenced from 1
        // not 0 like other opencl supporting languages
        local_id_fortran = local_id+1;
        group_id_fortran = group_id+1;
        local_chunk_size = (((kp*jp)/NTH)/NUNITS);
        start_position = local_chunk_size*global_id;
        local_aaa = 0;
        local_bbb = 0;
    for (r_iter = start_position;r_iter <= ((start_position + local_chunk_size) - 1);r_iter += 1) {
                k_range = kp-1;
                j_range = jp-1;
                k_rel = r_iter/j_range;
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

void bondv1_map_64(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("0.2 0.2 1"))) dt,
    int *__attribute__((annotate("50 0 3"))) uout,
    int *__attribute__((annotate("20 20 0"))) dxs,
    int *__attribute__((annotate("50 0 3"))) v,
    int *__attribute__((annotate("50 0 3"))) w,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) k)
{

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
        k_rel = global_id/j_range;
        *k = k_rel+1;
        j_rel = (global_id-(k_rel*j_range));
        j = j_rel+1;
        // parallelfortran: original code
              u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *im,j,*k)] = u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *im,j,*k)]-(*dt)*(*uout)*(u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *im,j,*k)]-u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , (*im)-1,j,*k)])/dxs[F1D2C(0 , *im)];
              v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , (*im)+1,j,*k)] = v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , (*im)+1,j,*k)]-(*dt)*(*uout)*(v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , (*im)+1,j,*k)]-v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , *im,j,*k)])/dxs[F1D2C(0 , *im)];
              w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , (*im)+1,j,*k)] = w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , (*im)+1,j,*k)]-(*dt)*(*uout)*(w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , (*im)+1,j,*k)]-w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , *im,j,*k)])/dxs[F1D2C(0 , *im)];
       }
void bondv1_map_72(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("50 0 3"))) u,
    int * __attribute__((annotate("50 0 3"))) v,
    int * __attribute__((annotate("50 0 3"))) w,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) k)
{

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
        k_rel = global_id/i_range;
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
void bondv1_map_85(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("50 0 3"))) u,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("50 0 3"))) v,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) j,
    int * __attribute__((annotate("50 0 3"))) w) {

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
        j_rel = global_id/i_range;
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
                w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,*j,0)] = 0;
                w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,*j,*km)] = 0;
        }
void feedbf_map_37(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("50 0 3"))) usum,
    int * __attribute__((annotate("50 0 3"))) u,
    int * __attribute__((annotate("1 0 0"))) bmask1,
    int * __attribute__((annotate("50 0 3"))) vsum,
    int * __attribute__((annotate("50 0 3"))) v,
    int * __attribute__((annotate("1 0 0"))) cmask1,
    int * __attribute__((annotate("50 0 3"))) wsum,
    int * __attribute__((annotate("50 0 3"))) w,
    int * __attribute__((annotate("1 0 0"))) dmask1,
    int * __attribute__((annotate("-10 -10 0"))) alpha,
    int * __attribute__((annotate("0.2 0.2 1"))) dt,
    int * __attribute__((annotate("-1 -1 0"))) beta,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *f,
    int *fx,
    int *g,
    int *fy,
    int *h,
    int *fz)
{

    #include "params_common_sn.h"
        // local vars: f1x,f1y,f1z,f2x,f2y,f2z,i,j,k
    int f1x;
    int f1y;
    int f1z;
    int f2x;
    int f2y;
    int f2z;
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
        k_rel = (global_id/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
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
void les_map_71(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int *__attribute__((annotate("20 0 0"))) dx1,
    int *__attribute__((annotate("20 0 0"))) dy1,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *delx1) {

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
                    delx1[F1D2C(1 , k)] = pow((int)((dx1[F1D2C((-1) , 0)]*dy1[F1D2C(0 , 0)]*dzn[F1D2C((-1) , k)])),0);
          }
void les_map_76(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int *diu1,
    int *diu2,
    int *diu3,
    int *diu4,
    int *diu5,
    int *diu6,
    int *diu7,
    int *diu8,
    int *diu9,
    int *delx1,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) sm) {

    #include "params_common_sn.h"
        // local vars: csx1,dudxx1,dudyx1,dudzx1,dvdxx1,dvdyx1,dvdzx1,dwdxx1,dwdyx1,dwdzx1,i,j,k
    int csx1;
    int dudxx1;
    int dudyx1;
    int dudzx1;
    int dvdxx1;
    int dvdyx1;
    int dvdzx1;
    int dwdxx1;
    int dwdyx1;
    int dwdzx1;
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
    int cs0=0;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
            dudxx1 = diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
            dudyx1 = (diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j,k)]+diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j+1,k)]+diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])/4;
            dudzx1 = (diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j,k)]+diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j,k+1)]+diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])/4;
            dvdxx1 = (diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j-1,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j-1,k)])/4;
            dvdyx1 = diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
            dvdzx1 = (diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j-1,k)]+diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j-1,k+1)]+diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])/4;
            dwdxx1 = (diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k-1)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k-1)])/4;
            dwdyx1 = (diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k-1)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k-1)])/4;
            dwdzx1 = diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
            csx1 = cs0;
            sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)] = pow((int)((csx1*delx1[F1D2C(1 , k)])),(int)(2))*sqrt(2*(pow((int)(dudxx1),(int)(2))+pow((int)(dvdyx1),(int)(2))+pow((int)(dwdzx1),(int)(2)))+pow((int)(dudyx1+dvdxx1),(int)(2))+pow((int)(dwdyx1+dvdzx1),(int)(2))+pow((int)(dudzx1+dwdxx1),(int)(2)));
      }
void les_map_99(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) sm,
    int *__attribute__((annotate("20 20 0"))) dy1,
    int *__attribute__((annotate("20 20 0"))) dx1,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *diu1,
    int *diu2,
    int *diu4,
    int *diu3,
    int *diu7,
    int *f,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *diu5,
    int *diu6,
    int *diu8,
    int *g,
    int *diu9,
    int *h) {

    #include "params_common_sn.h"
        // local vars: evsx1,evsx2,evsy1,evsy2,evsz1,evsz2,i,j,k,vfu,vfv,vfw,visux1,visux2,visuy1,visuy2,visuz1,visuz2,visvx1,visvx2,visvy1,visvy2,visvz1,visvz2,viswx1,viswx2,viswy1,viswy2,viswz1,viswz2
    int evsx1;
    int evsx2;
    int evsy1;
    int evsy2;
    int evsz1;
    int evsz2;
    int i;
    int j;
    int k;
    int vfu;
    int vfv;
    int vfw;
    int visux1;
    int visux2;
    int visuy1;
    int visuy2;
    int visuz1;
    int visuz2;
    int visvx1;
    int visvx2;
    int visvy1;
    int visvy2;
    int visvz1;
    int visvz2;
    int viswx1;
    int viswx2;
    int viswy1;
    int viswy2;
    int viswz1;
    int viswz2;
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
        k_rel = (global_id/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
            evsx2 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)];
            evsx1 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)];
            evsy2 = (dy1[F1D2C(0 , j+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dy1[F1D2C(0 , j)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j+1,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
            evsy1 = (dy1[F1D2C(0 , j+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j-1,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j-1,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dy1[F1D2C(0 , j)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
            evsz2 = (dzn[F1D2C((-1) , k+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k+1)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            evsz1 = (dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k-1)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k-1)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dzn[F1D2C((-1) , k-1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))/(dzn[F1D2C((-1) , k-1)]+dzn[F1D2C((-1) , k)]);
            visux2 = (evsx2)*2*diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i+1,j,k)];
            visux1 = (evsx1)*2*diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
            visuy2 = (evsy2)*(diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]);
            visuy1 = (evsy1)*(diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j-1,k)]);
            visuz2 = (evsz2)*(diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]);
            visuz1 = (evsz1)*(diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k-1)]);
            vfu = (visux2-visux1)/dx1[F1D2C((-1) , i)]+(visuy2-visuy1)/dy1[F1D2C(0 , j)]+(visuz2-visuz1)/dzn[F1D2C((-1) , k)];
            f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = (f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+vfu);
            evsy2 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k)];
            evsy1 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)];
            evsx2 = (dy1[F1D2C(0 , j+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dy1[F1D2C(0 , j)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j+1,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
            evsx1 = (dy1[F1D2C(0 , j+1)]*((dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i-1,j,k)]+dx1[F1D2C((-1) , i-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)])/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)]))+dy1[F1D2C(0 , j)]*((dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i-1,j+1,k)]+dx1[F1D2C((-1) , i-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k)])/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)])))/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
            evsz2 = (dzn[F1D2C((-1) , k+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k+1)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            evsz1 = (dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k-1)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k-1)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dzn[F1D2C((-1) , k-1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))/(dzn[F1D2C((-1) , k-1)]+dzn[F1D2C((-1) , k)]);
            visvx2 = (evsx2)*(diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]);
            visvx1 = (evsx1)*(diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j+1,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]);
            visvy2 = (evsy2)*2*diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j+1,k)];
            visvy1 = (evsy1)*2*diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
            visvz2 = (evsz2)*(diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)]);
            visvz1 = (evsz1)*(diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k-1)]);
            vfv = (visvx2-visvx1)/dx1[F1D2C((-1) , i)]+(visvy2-visvy1)/dy1[F1D2C(0 , j)]+(visvz2-visvz1)/dzn[F1D2C((-1) , k)];
            g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = (g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+vfv);
            evsz2 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)];
            evsz1 = sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)];
            evsx2 = (dzn[F1D2C((-1) , k+1)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]))+dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)]+dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i+1,j,k+1)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])))/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            evsx1 = (dzn[F1D2C((-1) , k+1)]*((dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i-1,j,k)]+dx1[F1D2C((-1) , i-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)])/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)]))+dzn[F1D2C((-1) , k)]*((dx1[F1D2C((-1) , i)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i-1,j,k+1)]+dx1[F1D2C((-1) , i-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)])/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)])))/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            evsy2 = (dzn[F1D2C((-1) , k+1)]*((dy1[F1D2C(0 , j+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)]+dy1[F1D2C(0 , j)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k)])/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]))+dzn[F1D2C((-1) , k)]*((dy1[F1D2C(0 , j+1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)]+dy1[F1D2C(0 , j)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j+1,k+1)])/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)])))/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            evsy1 = (dzn[F1D2C((-1) , k+1)]*((dy1[F1D2C(0 , j)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j-1,k)]+dy1[F1D2C(0 , j-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k)])/(dy1[F1D2C(0 , j-1)]+dy1[F1D2C(0 , j)]))+dzn[F1D2C((-1) , k)]*((dy1[F1D2C(0 , j)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j-1,k+1)]+dy1[F1D2C(0 , j-1)]*sm[F3D2C((((ip+1) - (-1) )+1),(((jp+1) - (-1) )+1) , (-1),(-1),0 , i,j,k+1)])/(dy1[F1D2C(0 , j-1)]+dy1[F1D2C(0 , j)])))/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
            viswx2 = (evsx2)*(diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)]);
            viswx1 = (evsx1)*(diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,j,k+1)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]);
            viswy2 = (evsy2)*(diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)]);
            viswy1 = (evsy1)*(diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j-1,k+1)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]);
            viswz2 = (evsz2)*2*diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)];
            viswz1 = (evsz1)*2*diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
            vfw = (viswx2-viswx1)/dx1[F1D2C((-1) , i)]+(viswy2-viswy1)/dy1[F1D2C(0 , j)]+(viswz2-viswz1)/dzn[F1D2C((-1) , k)];
            h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = (h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]+vfw);
      }
void press_map_58(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("50 0 3"))) u,
    int * __attribute__((annotate("20 20 0"))) dx1,
    int * __attribute__((annotate("50 0 3"))) v,
    int * __attribute__((annotate("20 20 0"))) dy1,
    int * __attribute__((annotate("50 0 3"))) w,
    int * __attribute__((annotate("10 1 4"))) dzn,
    int *f,
    int *g,
    int *h,
    int * __attribute__((annotate("1.5 0.5 5"))) rhs,
    int * __attribute__((annotate("0.2 0.2 1"))) dt,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im) {

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
        k_rel = (global_id/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)] = (-u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])/dx1[F1D2C((-1) , i)]+(-v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])/dy1[F1D2C(0 , j)]+(-w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k-1)]+w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)])/dzn[F1D2C((-1) , k)];
                rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)] = (f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i-1,j,k)])/dx1[F1D2C((-1) , i)]+(g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j-1,k)])/dy1[F1D2C(0 , j)]+(h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k-1)])/dzn[F1D2C((-1) , k)]+rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)]/(*dt);
        }
void press_reduce_71(
    int * __attribute__((annotate("20 20 0"))) dx1,
    int * __attribute__((annotate("20 20 0"))) dy1,
    int * __attribute__((annotate("10 1 4"))) dzn,
    int * __attribute__((annotate("1.5 0.5 5"))) rhs,
    int * __attribute__((annotate("1.5 0.5 5"))) global_rhsav_array,
    int *global_area_array) {

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
    int local_rhsav_array[(NTH - 1 +1)];
    int local_area_array[(NTH - 1 +1)];
    int local_rhsav;
    int im;
    int km;
    int jm;
    int local_area;
        local_id = get_local_id(0);
        group_id = get_group_id(0);
        global_id = get_global_id(0);
        // local_id_fortran and group_id_fortran are used to reconcile the fact that fortran arrays are referenced from 1
        // not 0 like other opencl supporting languages
        local_id_fortran = local_id+1;
        group_id_fortran = group_id+1;
        local_chunk_size = (((kp*(jp*ip))/NTH)/NUNITS);
        start_position = local_chunk_size*global_id;
        local_rhsav = 0;
        local_area = 0;
    for (r_iter = start_position;r_iter <= ((start_position + local_chunk_size) - 1);r_iter += 1) {
                k_range = kp-1;
                j_range = jp-1;
                i_range = ip-1;
                k_rel = (r_iter/(j_range*i_range));
                k = k_rel+1;
                j_rel = ((r_iter-(k_rel*(j_range*i_range)))/i_range);
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
void press_map_82(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int *__attribute__((annotate("1.5 0.5 5"))) rhs,
    int * __attribute__((annotate("1.5 0.5 5"))) rhsav,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im) {

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
        k_rel = (global_id/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)] = rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,j,k)]-(*rhsav);
        }
void press_map_93(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("0.0025 0.000625 6"))) cn1,
    int * __attribute__((annotate("0.0025 0.000625 6"))) cn2l,
    int * __attribute__((annotate("1.5 0.5 5"))) p,
    int * __attribute__((annotate("0.0025 0.000625 6"))) cn2s,
    int * __attribute__((annotate("0.0025 0.000625 6"))) cn3l,
    int * __attribute__((annotate("0.0025 0.000625 6"))) cn3s,
    int * __attribute__((annotate("0.0025 0.000625 6"))) cn4l,
    int * __attribute__((annotate("0.0025 0.000625 6"))) cn4s,
    int * __attribute__((annotate("1.5 0.5 5"))) rhs,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) k,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) j,
    int * __attribute__((annotate("2 0 0"))) nrd,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im) {

    #include "params_common_sn.h"
        // local vars: i,reltmp,sor
    int i;
    int reltmp;
    int sor=0;
        // parallelfortran: synthesised loop variable decls
    int k_range;
    int j_range;
    int i_range;
    int k_rel;
    int j_rel;
    int i_rel;
    int omega = 1;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = ((*km)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-(1+ ( (((*k)+(*j))+(*nrd)) % 2) ));
        k_rel = (global_id/(j_range*i_range));
        *k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
        *j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = (i_rel+(1+((((*k)+(*j))+(*nrd)) % 2)));
        // parallelfortran: original code
                    reltmp = omega*(cn1[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,*j,*k)]*(cn2l[F1D2C(1 , i)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,*j,*k)]+cn2s[F1D2C(1 , i)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i-1,*j,*k)]+cn3l[F1D2C(1 , *j)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,(*j)+1,*k)]+cn3s[F1D2C(1 , *j)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,(*j)-1,*k)]+cn4l[F1D2C(1 , *k)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*j,(*k)+1)]+cn4s[F1D2C(1 , *k)]*p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*j,(*k)-1)]-rhs[F3D2C((((ip+1) - 0 )+1),(((jp+1) - 0 )+1) , 0,0,0 , i,*j,*k)])-p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*j,*k)]);
                    p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*j,*k)] = p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*j,*k)]+reltmp;
                    sor = sor+reltmp*reltmp;
          }
void press_reduce_114(
    int * __attribute__((annotate("1.5 0.5 5")))p,
    int * __attribute__((annotate("20 20 0"))) dx1,
    int * __attribute__((annotate("20 20 0"))) dy1,
    int * __attribute__((annotate("10 1 4"))) dzn,
    int * __attribute__((annotate("1.5 0.5 5"))) global_pav_array,
    int * global_pco_array) {

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
    int local_pav_array[(NTH - 1 +1)];
    int local_pco_array[(NTH - 1 +1)];
    int local_pav;
    int clk_local_mem_fence;
    int jm;
    int im;
    int km;
    int local_pco;
        local_id = get_local_id(0);
        group_id = get_group_id(0);
        global_id = get_global_id(0);
        // local_id_fortran and group_id_fortran are used to reconcile the fact that fortran arrays are referenced from 1
        // not 0 like other opencl supporting languages
        local_id_fortran = local_id+1;
        group_id_fortran = group_id+1;
        local_chunk_size = (((kp*(jp*ip))/NTH)/NUNITS);
        start_position = local_chunk_size*global_id;
        local_pav = 0;
        local_pco = 0;
    for (r_iter = start_position;r_iter <= ((start_position + local_chunk_size) - 1);r_iter += 1) {
                k_range = kp-1;
                j_range = jp-1;
                i_range = ip-1;
                k_rel = (r_iter/(j_range*i_range));
                k = k_rel+1;
                j_rel = ((r_iter-(k_rel*(j_range*i_range)))/i_range);
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
void press_map_124(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("1.5 0.5 5"))) p,
    int * __attribute__((annotate("1.5 0.5 5"))) pav,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im) {

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
        k_rel = (global_id/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]-(*pav);
        }
void vel2_map_48(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("20 20 0"))) dx1,
    int *__attribute__((annotate("50 0 3"))) v,
    int *__attribute__((annotate("20 20 0"))) dy1,
    int *__attribute__((annotate("50 0 3"))) w,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *nou1,
    int *diu1,
    int *nou5,
    int *diu5,
    int *nou9,
    int *diu9,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *nou2,
    int *diu2,
    int *dzs,
    int *nou3,
    int *diu3,
    int *nou4,
    int *diu4,
    int *nou6,
    int *diu6,
    int *cov1,
    int *cov5,
    int *cov9,
    int *cov2,
    int *cov3,
    int *cov4,
    int *cov6) {

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
    int u0=0;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = (((*km)+1)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
    if ((k < *km)) {
                nou1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = (u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])/2;
                diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = (-u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])/dx1[F1D2C((-1) , i)];
                nou5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = (v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])/2;
                diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = (-v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])/dy1[F1D2C(0 , j)];
                nou9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k-1)]+w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)])/2;
                diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (-w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k-1)]+w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)])/dzn[F1D2C((-1) , k)];
                cov1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = nou1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]*diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
                cov5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)] = nou5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]*diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)];
                cov9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = nou9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]*diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
    }
    if ((k < *km)) {
                nou2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dx1[F1D2C((-1) , i+1)]*v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+dx1[F1D2C((-1) , i)]*v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i+1,j-1,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]);
                diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = 2*(-u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])/(dy1[F1D2C(0 , j-1)]+dy1[F1D2C(0 , j)]);
                cov2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = nou2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]*diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
    }
                nou3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dx1[F1D2C((-1) , i+1)]*w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k-1)]+dx1[F1D2C((-1) , i)]*w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i+1,j,k-1)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]);
                diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (-u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k-1)]+u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])/dzs[F1D2C((-1) , k-1)];
                cov3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = nou3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]*diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
    if ((k < *km)) {
                nou4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dy1[F1D2C(0 , j+1)]*u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+dy1[F1D2C(0 , j)]*u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j+1,k)])/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
                diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = 2*(-v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)]);
                cov4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (nou4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]-u0)*diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
    }
                nou6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dy1[F1D2C(0 , j+1)]*w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k-1)]+dy1[F1D2C(0 , j)]*w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j+1,k-1)])/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
                diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (-v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k-1)]+v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)])/dzs[F1D2C((-1) , k-1)];
                cov6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = nou6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]*diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
        }
void vel2_map_105(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("50 0 3"))) w,
    int *__attribute__((annotate("20 20 0"))) dx1,
    int *nou7,
    int *diu7,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *__attribute__((annotate("50 0 3"))) v,
    int *__attribute__((annotate("20 20 0"))) dy1,
    int *nou8,
    int *diu8,
    int *cov7,
    int *cov8) {

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
    int u0=0;
    int global_id;
        global_id = get_global_id(0);
        // parallelfortran: synthesised loop variables
        k_range = (((*km)-1)-1);
        j_range = ((*jm)-1);
        i_range = ((*im)-1);
        k_rel = (global_id/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                nou7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dzn[F1D2C((-1) , k+1)]*u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k)]+dzn[F1D2C((-1) , k)]*u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i-1,j,k+1)])/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
                diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = 2*(-w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i-1,j,k)]+w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)])/(dx1[F1D2C((-1) , i-1)]+dx1[F1D2C((-1) , i)]);
                cov7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (nou7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]-u0)*diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
                nou8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = (dzn[F1D2C((-1) , k+1)]*v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k)]+dzn[F1D2C((-1) , k)]*v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j-1,k+1)])/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
                diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = 2*(-w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j-1,k)]+w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)])/(dy1[F1D2C(0 , j-1)]+dy1[F1D2C(0 , j)]);
                cov8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)] = nou8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]*diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)];
        }
void vel2_map_125(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *nou1,
    int *diu1,
    int *cov1,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm) {

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
        k_rel = global_id/j_range;
        k = k_rel+1;
        j_rel = (global_id-(k_rel*j_range));
        j = j_rel+1;
        // parallelfortran: original code
                nou1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , (*im)+1,j,k)] = nou1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , *im,j,k)];
                diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , (*im)+1,j,k)] = diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , *im,j,k)];
                cov1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , (*im)+1,j,k)] = cov1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , *im,j,k)];
        }
void vel2_map_132(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int *nou2,
    int *diu2,
    int *cov2,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im) {

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
        k_rel = global_id/i_range;
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
void vel2_map_142(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *nou4,
    int *diu4,
    int *cov4,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm) {

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
        k_rel = global_id/j_range;
        k = k_rel+1;
        j_rel = (global_id-(k_rel*j_range));
        j = j_rel+1;
        // parallelfortran: original code
                nou4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = nou4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
                diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
                cov4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = cov4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
        }
void vel2_map_149(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int *nou5,
    int *diu5,
    int *cov5,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im) {

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
        k_rel = global_id/i_range;
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
void vel2_map_159(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *nou7,
    int *diu7,
    int *cov7,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm) {

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
        k_rel = global_id/j_range;
        k = k_rel+1;
        j_rel = (global_id-(k_rel*j_range));
        j = j_rel+1;
        // parallelfortran: original code
                nou7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = nou7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
                diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
                cov7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = cov7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
        }
void vel2_map_166(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int *nou8,
    int *diu8,
    int *cov8,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im) {

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
        k_rel = global_id/i_range;
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
void vel2_map_177(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *diu2,
    int *diu3,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm) {

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
        k_rel = global_id/j_range;
        k = k_rel+1;
        j_rel = (global_id-(k_rel*j_range));
        j = j_rel+1;
        // parallelfortran: original code
                diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
                diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , (*im)+1,j,k)] = diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , *im,j,k)];
        }
void vel2_map_183(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int *diu4,
    int *diu6,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im) {

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
        k_rel = global_id/i_range;
        k = k_rel+1;
        i_rel = (global_id-(k_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,0,k)] = diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*jm,k)];
                diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,0,k)] = diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,*jm,k)];
        }
void velfg_map_62(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int *__attribute__((annotate("20 20 0"))) dx1,
    int *cov1,
    int *cov2,
    int *cov3,
    int *diu1,
    int *diu2,
    int *__attribute__((annotate("20 20 0"))) dy1,
    int *diu3,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *__attribute__((annotate("50 0 3"))) vn,
    int *dfu1,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *cov4,
    int *cov5,
    int *cov6,
    int *diu4,
    int *diu5,
    int *diu6,
    int *dfv1,
    int *cov7,
    int *cov8,
    int *cov9,
    int *diu7,
    int *diu8,
    int *diu9,
    int *dzs,
    int *dfw1,
    int *f,
    int *g,
    int *h) {

    #include "params_common_sn.h"
        // local vars: covc,covx1,covy1,covz1,df,i,j,k
    int covc;
    int covx1;
    int covy1;
    int covz1;
    int df;
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
        k_rel = (global_id/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                covx1 = (dx1[F1D2C((-1) , i+1)]*cov1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]+dx1[F1D2C((-1) , i)]*cov1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i+1,j,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)]);
                covy1 = (cov2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])/2;
                covz1 = (cov3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])/2;
                covc = covx1+covy1+covz1;
                dfu1[F3D2C(((ip - 0 )+1),((jp - 1 )+1) , 0,1,1 , i,j,k)] = 2*(-diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]+diu1[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i+1,j,k)])/(dx1[F1D2C((-1) , i)]+dx1[F1D2C((-1) , i+1)])+(-diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu2[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])/dy1[F1D2C(0 , j)]+(-diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu3[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])/dzn[F1D2C((-1) , k)];
                df = (*vn)*dfu1[F3D2C(((ip - 0 )+1),((jp - 1 )+1) , 0,1,1 , i,j,k)];
                f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = -covc+df;
                covx1 = (cov4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)])/2;
                covy1 = (dy1[F1D2C(0 , j+1)]*cov5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]+dy1[F1D2C(0 , j)]*cov5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j+1,k)])/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)]);
                covz1 = (cov6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])/2;
                covc = covx1+covy1+covz1;
                dfv1[F3D2C(((ip - 1 )+1),((jp - 0 )+1) , 1,0,1 , i,j,k)] = (-diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu4[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)])/dx1[F1D2C((-1) , i)]+2*(-diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j,k)]+diu5[F3D2C((((ip+2) - (-1) )+1),(((jp+2) - 0 )+1) , (-1),0,0 , i,j+1,k)])/(dy1[F1D2C(0 , j)]+dy1[F1D2C(0 , j+1)])+(-diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu6[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])/dzn[F1D2C((-1) , k)];
                df = (*vn)*dfv1[F3D2C(((ip - 1 )+1),((jp - 0 )+1) , 1,0,1 , i,j,k)];
                g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = -covc+df;
    if ((k < (*km - 1))) {
              covx1 = (cov7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)])/2;
              covy1 = (cov8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+cov8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])/2;
              covz1 = (dzn[F1D2C((-1) , k+1)]*cov9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+dzn[F1D2C((-1) , k)]*cov9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])/(dzn[F1D2C((-1) , k)]+dzn[F1D2C((-1) , k+1)]);
              covc = covx1+covy1+covz1;
                dfw1[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)] = (-diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu7[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)])/dx1[F1D2C((-1) , i)]+(-diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu8[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])/dy1[F1D2C(0 , j)]+(-diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+diu9[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])/dzs[F1D2C((-1) , k)];
                df = (*vn)*dfw1[F3D2C(((ip - 1 )+1),((jp - 1 )+1) , 1,1,1 , i,j,k)];
                h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)] = -covc+df;
    }
    }
void velnw_map_27(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int *__attribute__((annotate("1.5 0.5 5"))) p,
    int * __attribute__((annotate("1.1763 1.1763 4"))) ro,
    int *dxs,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("0.2 0.2 1"))) dt,
    int *f,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *dys,
    int *__attribute__((annotate("50 0 3"))) v,
    int *g,
    int *dzs,
    int *__attribute__((annotate("50 0 3"))) w,
    int *h) {

    #include "params_common_sn.h"
        // local vars: i,j,k,pz
    int i;
    int j;
    int k;
    int pz;
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
        k_rel = (global_id/(j_range*i_range));
        k = k_rel+1;
        j_rel = ((global_id-(k_rel*(j_range*i_range)))/i_range);
        j = j_rel+1;
        i_rel = ((global_id-(k_rel*(j_range*i_range)))-(j_rel*i_range));
        i = i_rel+1;
        // parallelfortran: original code
                pz = (-p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i+1,j,k)])/(*ro)/dxs[F1D2C(0 , i)];
                u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)] = u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)]+(*dt)*(f[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-pz);
                u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)] = u[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)];
                pz = (-p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j+1,k)])/(*ro)/dys[F1D2C(0 , j)];
                v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)] = v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)]+(*dt)*(g[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-pz);
                v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)] = v[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),0 , i,j,k)];
    if ((k < (*km - 1))) {
                pz = (-p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k)]+p[F3D2C((((ip+2) - 0 )+1),(((jp+2) - 0 )+1) , 0,0,0 , i,j,k+1)])/(*ro)/dzs[F1D2C((-1) , k)];
                w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)] = w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)]+(*dt)*(h[F3D2C(((ip - 0 )+1),((jp - 0 )+1) , 0,0,0 , i,j,k)]-pz);
                w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)] = w[F3D2C((((ip+1) - 0 )+1),(((jp+1) - (-1) )+1) , 0,(-1),(-1) , i,j,k)];
    }
    }
void adam_bondv1_feedbf_les_press_v_etc_superkernel(
    int * __attribute__((annotate("2147483647 -2147483648 0"))) km,
    int *f,
    int *g,
    int *h,
    int *fold,
    int *gold,
    int *hold,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) jm,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) im,
    int *z2,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *ical,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) n,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) i,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) k,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("50 0 3"))) v,
    int *__attribute__((annotate("50 0 3"))) w,
    int * __attribute__((annotate("2147483647 -2147483648 0"))) j,
    int *global_aaa_array,
    int *global_bbb_array,
    int *__attribute__((annotate("0.2 0.2 1"))) dt,
    int *__attribute__((annotate("50 0 3"))) uout,
    int *dxs,
    int *usum,
    int *bmask1,
    int *vsum,
    int *cmask1,
    int *wsum,
    int *dmask1,
    int *alpha,
    int *beta,
    int *fx,
    int *fy,
    int *fz,
    int *__attribute__((annotate("20 20 0"))) dx1,
    int *__attribute__((annotate("20 20 0"))) dy1,
    int *delx1,
    int *diu1,
    int *diu2,
    int *diu3,
    int *diu4,
    int *diu5,
    int *diu6,
    int *diu7,
    int *diu8,
    int *diu9,
    int *sm,
    int *__attribute__((annotate("1.5 0.5 5"))) rhs,
    int *global_rhsav_array,
    int *global_area_array,
    int *rhsav,
    int *__attribute__((annotate("0.0025 0.000625 6")))cn1,
    int *__attribute__((annotate("0.0025 0.000625 6")))cn2l,
    int *__attribute__((annotate("1.5 0.5 5"))) p,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn2s,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn3l,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn3s,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn4l,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn4s,
    int *nrd,
    int *global_pav_array,
    int *global_pco_array,
    int *pav,
    int *nou1,
    int *nou5,
    int *nou9,
    int *nou2,
    int *dzs,
    int *nou3,
    int *nou4,
    int *nou6,
    int *cov1,
    int *cov5,
    int *cov9,
    int *cov2,
    int *cov3,
    int *cov4,
    int *cov6,
    int *nou7,
    int *nou8,
    int *cov7,
    int *cov8,
    int *__attribute__((annotate("50 0 3"))) vn,
    int *dfu1,
    int *dfv1,
    int *dfw1,
    int *ro,
    int *dys,
    int *__attribute__((annotate("27 0 0")))state_ptr) {

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

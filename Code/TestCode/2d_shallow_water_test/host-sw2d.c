#include "host-sw2d.h"


//**NOTE**
// ROWS = STREAM_ARRAY_SIZE_DIM1 = NX+2
// COLS = STREAM_ARRAY_SIZE_DIM2 = NY+2
  //(array size is +1 on each side of NX and NY for land boundary)
// Linear index version of 2D: a[x][y] = a[x*COLS + y]


//------------------------------------------
// initialize 2D shallow-water host arrays
//------------------------------------------

/*
void initHzero(stypeHost *__attribute__((annotate("15 0 6"))) hzero)
{
*/
void initHzero(stypeHost *hzero) {
    *hzero = 10.0;
}

/*
void sw2d_init_data_host_loop2And3(
    stypeHost *__attribute__((annotate("15 0 6"))) hzero_row0_k,
    stypeHost *__attribute__((annotate("15 0 6"))) hzero_lastRow_k)
{
*/
void sw2d_init_data_host_loop2And3(stypeHost *hzero_row0_k, stypeHost *hzero_lastRow_k) {
    *hzero_row0_k = *hzero_lastRow_k = -10.0;
}

/*
void sw2d_init_data_host_eta_etan(
    stypeHost *__attribute__((annotate("15 0 6"))) eta,
    stypeHost __attribute__((annotate("15 0 6"))) hzero,
    stypeHost *__attribute__((annotate("15 0 6"))) etan)
{
*/
void sw2d_init_data_host_eta_etan(stypeHost *eta, stypeHost hzero, stypeHost *etan) {
    *eta = -MIN(0.0, hzero);
    *etan = *eta;
}

/*
void sw2d_init_data_host_finalLoop(
    stypeHost *__attribute__((annotate("15 0 6"))) h_j_COLS_k,
    stypeHost __attribute__((annotate("15 0 6"))) hzero_j_COLS_k,
    stypeHost __attribute__((annotate("15 0 6"))) eta_j_COLS_k,
    stypeHost *__attribute__((annotate("1 0 0"))) wet_j_COLS_k,
    stypeHost __attribute__((annotate("15 0 6"))) hmin,
    stypeHost *__attribute__((annotate("10 -10 6"))) u,
    stypeHost *__attribute__((annotate("10 -10 6"))) un,
    stypeHost *__attribute__((annotate("10 -10 6"))) v,
    stypeHost *__attribute__((annotate("10 -10 6"))) vn)
{
*/
void sw2d_init_data_host_finalLoop(
    stypeHost *h_j_COLS_k,
    stypeHost hzero_j_COLS_k,
    stypeHost eta_j_COLS_k,
    stypeHost *wet_j_COLS_k,
    stypeHost hmin,
    stypeHost *u,
    stypeHost *un,
    stypeHost *v,
    stypeHost *vn)
{
    *h_j_COLS_k = hzero_j_COLS_k + eta_j_COLS_k;
    *wet_j_COLS_k = 1;
    if (*h_j_COLS_k < hmin) {
        *wet_j_COLS_k = 0;
    }
    *u = *un = *v = *vn = 0;
}

void sw2d_init_data_host (  stypeHost *__attribute__((annotate("15 0 6"))) hzero
                          , stypeHost *__attribute__((annotate("15 0 6"))) eta
                          , stypeHost *__attribute__((annotate("15 0 6"))) etan
                          , stypeHost *__attribute__((annotate("15 0 6"))) h
                          , stypeHost *__attribute__((annotate("1 0 0"))) wet
                          , stypeHost *__attribute__((annotate("10 -10 6"))) u
                          , stypeHost *__attribute__((annotate("10 -10 6"))) un
                          , stypeHost *__attribute__((annotate("10 -10 6"))) v
                          , stypeHost *__attribute__((annotate("10 -10 6"))) vn
                          , stypeHost __attribute__((annotate("15 0 6"))) hmin
                          , int __attribute__((annotate("10 0 0"))) BytesPerWord
                    ) {



  int __attribute__((annotate("514 0 0"))) j, __attribute__((annotate("514 0 0"))) k;
  //initialize height
  for (j=0; j<=ROWS-1; j++) {
    for (k=0; k<=COLS-1; k++) {
        initHzero(&hzero[j*COLS + k]);
    }
  }

  //land boundaries with 10 m elevation
  for (k=0; k<=COLS-1; k++) {
      sw2d_init_data_host_loop2And3(&hzero[0*COLS + k], &hzero[(ROWS-1)*COLS + k]);
  }
  for (j=0; j<=ROWS-1; j++) {
      sw2d_init_data_host_loop2And3(&hzero[j*COLS + 0], &hzero[j*COLS + COLS-1]);
  }

  // eta and etan
  for (j=0; j<= ROWS-1; j++) {
    for (k=0; k<=COLS-1; k++) {
        sw2d_init_data_host_eta_etan(&eta [j*COLS + k], hzero[j*COLS + k], &etan[j*COLS + k]);
    }
  }

  //h, wet, u, un, v, vn
  // eta and etan
  for (j=0; j<= ROWS-1; j++) {
    for (k=0; k<= COLS-1; k++) {
        sw2d_init_data_host_finalLoop(
            &h[j*COLS + k],
            hzero[j*COLS + k],
            eta[j*COLS + k],
            &wet[j*COLS + k],
            hmin,
            &u [j*COLS + k],
            &un[j*COLS + k],
            &v [j*COLS + k],
            &vn[j*COLS + k]);
    }
  }

 printf("Host arrays initialized.\n");
 printf(HLINE);

}

//------------------------------------------
// dyn() - the dynamics
//------------------------------------------

void sw2d_dyn_host_firstLoop(
    stypeHost* __attribute__((annotate("1500000 -1500000 10"))) du,
    stypeHost* __attribute__((annotate("1500000 -1500000 10"))) dv,
    stypeHost __attribute__((annotate("100 0 2"))) dt,
    stypeHost __attribute__((annotate("10 9 2"))) g,
    stypeHost __attribute__((annotate("15 0 6"))) eta_jCOLS_k_1,
    stypeHost __attribute__((annotate("15 0 6"))) eta_jCOLS_k,
    stypeHost __attribute__((annotate("15 0 6"))) eta_j1COLS_k,
    stypeHost __attribute__((annotate("100 0 2"))) dx,
    stypeHost __attribute__((annotate("100 0 2"))) dy)
{
    *du = -dt * g * (eta_jCOLS_k_1 - eta_jCOLS_k) / dx;
    *dv = -dt * g * (eta_j1COLS_k - eta_jCOLS_k) / dy;
}

void sw2d_dyn_host_secondLoop(
    stypeHost *__attribute__((annotate("10 -10 6"))) un_jCOLS_k,
    stypeHost *__attribute__((annotate("10 -10 6"))) uu,
    stypeHost __attribute__((annotate("10 -10 6"))) u_jCOLS_k,
    stypeHost *__attribute__((annotate("1500000 -1500000 10"))) duu,
    stypeHost __attribute__((annotate("1500000 -1500000 10"))) du_jCOLS_k,
    stypeHost __attribute__((annotate("1 0 0"))) wet_jCOLS_k,
    stypeHost __attribute__((annotate("1 0 0"))) wet_jCOLS_k_1,
    stypeHost *__attribute__((annotate("10 -10 6"))) vn,
    stypeHost *__attribute__((annotate("10 -10 6"))) vv,
    stypeHost __attribute__((annotate("10 -10 6"))) v_jCOLS_k,
    stypeHost *__attribute__((annotate("1500000 -1500000 10"))) dvv,
    stypeHost *__attribute__((annotate("1500000 -1500000 10"))) dv
) {
    *un_jCOLS_k = 0.0;
    *uu = u_jCOLS_k;
    *duu = du_jCOLS_k;
    if (wet_jCOLS_k == 1) {
        if (wet_jCOLS_k_1 == 1 || (*duu) > 0.0) {
            *un_jCOLS_k = (*uu) + (*duu);
        }
    } else {
        if (wet_jCOLS_k_1 == 1 || (*duu) > 0.0) {
            *un_jCOLS_k == (*uu) + (*duu);
        }
    }

    *vn = 0.0;
    *vv = v_jCOLS_k;
    *dvv = *dv;
    if (wet_jCOLS_k == 1) {
        if (wet_jCOLS_k_1 == 1 || (*dvv) > 0.0) {
            *vn = (*vv) + (*dvv);
        }
    } else {
        if (wet_jCOLS_k_1 == 1 || (*dvv) < 0.0) {
            *vn = (*vv) + (*dvv);
        }
    }
}




void sw2d_dyn_host_finalLoop(
    stypeHost *hep,
    stypeHost *hen,
    stypeHost *hue,
    stypeHost *hwp,
    stypeHost *hwn,
    stypeHost *huw,
    stypeHost *hnp,
    stypeHost *hnn,
    stypeHost *hvn,
    stypeHost *hsp,
    stypeHost *hsn,
    stypeHost *hvs,
    stypeHost dx,
    stypeHost dy,
    stypeHost dt,
    stypeHost un_jCOLS_k,
    stypeHost un_jCOLS_k_neg1,
    stypeHost vn_jCOLS_k,
    stypeHost vn_neg1_jCOLS_k,
    stypeHost h_jCOLS_k,
    stypeHost h_jCOLS_k_1,
    stypeHost h_jCOLS_k_neg1,
    stypeHost h_jCOLS_1_k,
    stypeHost h_neg1_jCOLS_k,
    stypeHost *etan,
    stypeHost *eta)
{
    *hep = 0.5*(un_jCOLS_k + abs(un_jCOLS_k)) * h_jCOLS_k;
    *hen = 0.5*(un_jCOLS_k - abd(un_jCOLS_k)) * h_jCOLS_k_1;
    *hue (*hep)+(*hen);

    *hwp = 0.5*(un_jCOLS_k_neg1 + abs(un_jCOLS_k_neg1) ) * h_jCOLS_k_neg1;
    *hwn = 0.5*(un_jCOLS_k_neg1 - abs(un_jCOLS_k_neg1)) * h_jCOLS_k;
    *huw = (*hwp)+(*hwn);

    *hnp = 0.5*(vn_jCOLS_k + abs(vn_jCOLS_k)) * h_jCOLS_k;
    *hnn = 0.5*(vn_jCOLS_k - abs(vn_jCOLS_k)) * h_jCOLS_1_k;
    *hvn = (*hnp)+(*hnn);

    *hsp = 0.5*(vn_neg1_jCOLS_k + abs(vn_neg1_jCOLS_k)) * h_neg1_jCOLS_k;
    *hsn = 0.5*(vn_neg1_jCOLS_k - abs(vn_neg1_jCOLS_k)) * h_jCOLS_k;
    *hvs = (*hsp)+(*hsn);

    *etan = (*eta) - dt*((*hue)-(*huw))/dx - dt*((*hvn)-(*hvs))/dy;
}

void sw2d_dyn_host  ( stypeHost __attribute__((annotate("100 0 2"))) dt
                    , stypeHost __attribute__((annotate("100 0 2"))) dx
                    , stypeHost __attribute__((annotate("100 0 2"))) dy
                    , stypeHost __attribute__((annotate("10 9 2"))) g
                    , stypeHost *__attribute__((annotate("15 0 6"))) eta
                    , stypeHost *__attribute__((annotate("10 -10 6"))) un
                    , stypeHost *__attribute__((annotate("10 -10 6"))) u
                    , stypeHost *__attribute__((annotate("1 0 0"))) wet
                    , stypeHost *__attribute__((annotate("10 -10 6"))) v
                    , stypeHost *__attribute__((annotate("10 -10 6"))) vn
                    , stypeHost *__attribute__((annotate("15 0 6"))) h
                    , stypeHost *__attribute__((annotate("15 0 6"))) etan
                    , int __attribute__((annotate("10 0 0"))) BytesPerWord
                    ) {

//locals
//-------------------
stypeHost *__attribute__((annotate("1500000 -1500000 10"))) du;// [ROWS][COLS];
stypeHost *__attribute__((annotate("1500000 -1500000 10"))) dv;// [ROWS][COLS];
posix_memalign ((void**)&du, ALIGNMENT, SIZE*BytesPerWord);
posix_memalign ((void**)&dv, ALIGNMENT, SIZE*BytesPerWord);
stypeHost uu;
stypeHost vv;
stypeHost duu;
stypeHost dvv;
stypeHost hue;
stypeHost huw;
stypeHost hwp;
stypeHost hwn;
stypeHost hen;
stypeHost hep;
stypeHost hvn;
stypeHost hvs;
stypeHost hsp;
stypeHost hsn;
stypeHost hnn;
stypeHost hnp;
int j, k;


//calculate du, dv on all non-boundary points
//-------------------------------------------
  for (j=1; j<= ROWS-2; j++) {
    for (k=1; k<= COLS-2; k++) {
        sw2d_dyn_host_firstLoop(
            &du[j*COLS + k],
            &dv[j*COLS + k],
            dt,
            g,
            eta[j*COLS + k+1 ],
            eta[j*COLS + k   ],
            eta[(j+1)*COLS + k],
            dx,
            dy);
    }
  }

//prediction for u and v
//---------------------------------
  for (j=1; j<= ROWS-2; j++) {
    for (k=1; k<= COLS-2; k++) {
        sw2d_dyn_host_secondLoop(
            &un[j*COLS + k],
            &uu,
            u[j*COLS + k],
            &duu,
            du[j*COLS + k],
            wet[j*COLS + k],
            wet[j*COLS + k+1],
            &vn[j*COLS + k],
            &vv,
            v[j*COLS + k],
            &dvv,
            &dv[j*COLS + k]
        );

    }//for
  }//for

//sea level predictor
//--------------------
  for (j=1; j<= ROWS-2; j++) {
    for (k=1; k<= COLS-2; k++) {
        sw2d_dyn_host_finalLoop(
            &hep,
            &hen,
            &hue,
            &hwp,
            &hwn,
            &huw,
            &hnp,
            &hnn,
            &hvn,
            &hsp,
            &hsn,
            &hvs,
            dx,
            dy,
            dt,
            un[j*COLS + k],
            un[j*COLS + k-1],
            vn[j*COLS + k],
            vn[(j-1)*COLS + k],
            h[j*COLS + k  ],
            h[j*COLS + k+1],
            h[j*COLS + k-1],
            h[(j+1)*COLS + k],
            h[(j-1)*COLS + k],
            &etan[j*COLS + k],
            &eta[j*COLS + k]);
    }//for
  }//for
}//()

void sw2d_shapiro_host_terms(
    stypeHost wet_jCOLS_k,
    stypeHost wet_jCOLS_k_1,
    stypeHost wet_jCOLS_k_neg1,
    stypeHost wet_j1COLS_k,
    stypeHost wet_jNeg1COLS_k,
    stypeHost etan_jCOLS_k,
    stypeHost etan_j1COLS_k,
    stypeHost etan_jNeg1COLS_k,
    stypeHost etan_jCOLS_k_1,
    stypeHost etan_jCOLS_k_neg1,
    stypeHost eps,
    stypeHost *eta)
{
    stypeHost term1,term2,term3;
    if (wet_jCOLS_k == 1) {
        term1 = (1.0-0.25*eps * (wet_jCOLS_k_1 + wet_jCOLS_k_neg1 + wet_j1COLS_k + wet_jNeg1COLS_k)) * etan_jCOLS_k;
        term2 = 0.25 * eps * (wet_jCOLS_k_1 * etan_jCOLS_k_1 + wet_jCOLS_k_neg1 * etan_jCOLS_k_neg1);
        term3 = 0.25*eps*(wet_j1COLS_k * etan_j1COLS_k + wet_jNeg1COLS_k * etan_jNeg1COLS_k);
        *eta = term1 + term2 + term3;
    } else {
        eta = etan_jNeg1COLS_k;
    }
}
//------------------------------------------
// shapiro() - filter
//------------------------------------------
void sw2d_shapiro_host  ( stypeHost *__attribute__((annotate("1 0 0"))) wet
                        , stypeHost *__attribute__((annotate("15 0 6"))) etan
                        , stypeHost __attribute__((annotate("0 0 2"))) eps
                        , stypeHost *__attribute__((annotate("15 0 6"))) eta
                        ) {

  //locals
  int j,k;
  stypeHost term1,term2,term3;

  //1-order Shapiro filter
  for (j=1; j<= ROWS-2; j++) {
    for (k=1; k<= COLS-2; k++) {
            sw2d_shapiro_host_terms(
                wet[    j*COLS + k],
                wet[    j*COLS + k+1],
                wet[    j*COLS + k-1],
                wet[(j+1)*COLS + k  ],
                wet[(j-1)*COLS + k  ],
                etan[j*COLS + k],
                etan[(j+1)*COLS + k],
                etan[(j-1)*COLS + k],
                etan[j*COLS + k+1],
                etan[j*COLS + k-1],
                eps,
                &eta[(j-1)*COLS + k]);
    }//for
  }//for
}//()

void sw2d_updates_host_loop(
    stypeHost *h_jCOLS_k,
    stypeHost hzero_jCOLS_k,
    stypeHost eta_jCOLS_k,
    stypeHost wet_jCOLS_k,
    stypeHost hmin,
    stypeHost *u,
    stypeHost *v,
    stypeHost un,
    stypeHost vn)
{
    *h_jCOLS_k = hzero_jCOLS_k + eta_jCOLS_k;
    *wet_jCOLS_k = 1;
    if (h_jCOLS_k < hmin) {
        wet_jCOLS_k = 0;
    }
    *u = un;
    *v = vn;
}


//------------------------------------------
// updates() -
// in the original this was part of main
//------------------------------------------
void sw2d_updates_host  ( stypeHost *__attribute__((annotate("15 0 6"))) h
                        , stypeHost *__attribute__((annotate("15 0 6"))) hzero
                        , stypeHost *__attribute__((annotate("15 0 6"))) eta
                        , stypeHost *__attribute__((annotate("10 -10 6"))) u
                        , stypeHost *__attribute__((annotate("10 -10 6"))) un
                        , stypeHost *__attribute__((annotate("10 -10 6"))) v
                        , stypeHost *__attribute__((annotate("10 -10 6"))) vn
                        , stypeHost *__attribute__((annotate("1 0 0"))) wet
                        , stypeHost __attribute__((annotate("15 0 6"))) hmin
                        ) {

  for (int j=0; j<= ROWS-1; j++) {
    for (int k=0; k<=COLS-1; k++) {
        sw2d_updates_host_loop(
            &h[j*COLS + k],
            hzero[j*COLS + k],
            eta  [j*COLS + k],
            wet[j*COLS + k],
            hmin,
            &u[j*COLS + k],
            &v[j*COLS + k],
            un[j*COLS + k],
            vn[j*COLS + k]);
    }//for
  }//for
}//()

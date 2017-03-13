int __attribute__((annotate("0 0 0"))) get_global_id(
    int __attribute__((annotate("20 20 0"))) idx
);

int __attribute__((annotate("0 0 0"))) get_local_id(
    int __attribute__((annotate("20 20 0"))) idx
);

int __attribute__((annotate("0 0 0"))) get_group_id(
    int __attribute__((annotate("20 20 0"))) idx
);

void adam_map_26(
    int *km,
    int *f,
    int *g,
    int *h,
    int *fold,
    int *gold,
    int *hold,
    int *jm,
    int *im
);

void bondv1_map_29(
    int *__attribute__((annotate("20 20 0"))) im,
    int *z2,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *ical,
    int *n,
    int *km,
    int *__attribute__((annotate("20 20 0"))) i,
    int *jm,
    int *k,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("50 0 3"))) v,
    int *__attribute__((annotate("50 0 3"))) w
);

void bondv1_reduce_56(
    int *__attribute__((annotate("50 0 3"))) u,
    int *im,
    int *j,
    int *k,
    int *global_aaa_array,
    int *global_bbb_array
);

void bondv1_map_64(
    int *km,
    int *im,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("0.2 0.2 1"))) dt,
    int *__attribute__((annotate("50 0 3"))) uout,
    int *__attribute__((annotate("20 20 0"))) dxs,
    int *__attribute__((annotate("50 0 3"))) v,
    int *__attribute__((annotate("50 0 3"))) w,
    int *jm,
    int *k
);

void bondv1_map_72(
    int *km,
    int *jm,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("50 0 3"))) v,
    int *__attribute__((annotate("50 0 3"))) w,
    int *im,
    int *k
);

void bondv1_map_85(
    int *jm,
    int *__attribute__((annotate("50 0 3"))) u,
    int *km,
    int *__attribute__((annotate("50 0 3"))) v,
    int *im,
    int *j,
    int *__attribute__((annotate("50 0 3"))) w
);

void feedbf_map_37(
    int *km,
    int *usum,
    int *__attribute__((annotate("50 0 3"))) u,
    int *bmask1,
    int *vsum,
    int *__attribute__((annotate("50 0 3"))) v,
    int *cmask1,
    int *wsum,
    int *__attribute__((annotate("50 0 3"))) w,
    int *dmask1,
    int *alpha,
    int *__attribute__((annotate("0.2 0.2 1")))dt,
    int *beta,
    int *jm,
    int *im,
    int *f,
    int *fx,
    int *g,
    int *fy,
    int *h,
    int *fz
);

void les_map_71(
    int *km,
    int *__attribute__((annotate("20 0 0"))) dx1,
    int *__attribute__((annotate("20 0 0"))) dy1,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *delx1
);

void les_map_76(
    int *km,
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
    int *jm,
    int *im,
    int *sm
);

void les_map_99(
    int *km,
    int *sm,
    int *__attribute__((annotate("20 20 0"))) dy1,
    int *__attribute__((annotate("20 20 0"))) dx1,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *diu1,
    int *diu2,
    int *diu4,
    int *diu3,
    int *diu7,
    int *f,
    int *jm,
    int *im,
    int *diu5,
    int *diu6,
    int *diu8,
    int *g,
    int *diu9,
    int *h
);

void press_map_58(
    int *km,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("20 20 0"))) dx1,
    int *__attribute__((annotate("50 0 3"))) v,
    int *__attribute__((annotate("20 20 0"))) dy1,
    int *__attribute__((annotate("50 0 3"))) w,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *f,
    int *g,
    int *h,
    int *__attribute__((annotate("1.5 0.5 5"))) rhs,
    int *__attribute__((annotate("0.2 0.2 1"))) dt,
    int *jm,
    int *im
);

void press_reduce_71(
    int *__attribute__((annotate("20 20 0"))) dx1,
    int *__attribute__((annotate("20 20 0"))) dy1,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *__attribute__((annotate("1.5 0.5 5"))) rhs,
    int *global_rhsav_array,
    int *global_area_array
);

void press_map_82(
    int *km,
    int *__attribute__((annotate("1.5 0.5 5"))) rhs,
    int *rhsav,
    int *jm,
    int *im
);

void press_map_93(
    int *km,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn1,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn2l,
    int *__attribute__((annotate("1.5 0.5 5"))) p,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn2s,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn3l,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn3s,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn4l,
    int *__attribute__((annotate("0.0025 0.000625 6"))) cn4s,
    int *__attribute__((annotate("1.5 0.5 5"))) rhs,
    int *jm,
    int *k,
    int *j,
    int *nrd,
    int *im
);

void press_reduce_114(
    int *__attribute__((annotate("1.5 0.5 5")))p,
    int *__attribute__((annotate("20 20 0"))) dx1,
    int *__attribute__((annotate("20 20 0"))) dy1,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *global_pav_array,
    int *global_pco_array
);

void press_map_124(
    int *km,
    int *__attribute__((annotate("1.5 0.5 5"))) p,
    int *pav,
    int *jm,
    int *im
);

void vel2_map_48(
    int *km,
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
    int *jm,
    int *im,
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
    int *cov6
);

void vel2_map_105(
    int *km,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("50 0 3"))) w,
    int *__attribute__((annotate("20 20 0"))) dx1,
    int *nou7,
    int *diu7,
    int *jm,
    int *im,
    int *__attribute__((annotate("50 0 3"))) v,
    int *__attribute__((annotate("20 20 0"))) dy1,
    int *nou8,
    int *diu8,
    int *cov7,
    int *cov8
);

void vel2_map_125(
    int *km,
    int *im,
    int *nou1,
    int *diu1,
    int *cov1,
    int *jm
);

void vel2_map_132(
    int *km,
    int *jm,
    int *nou2,
    int *diu2,
    int *cov2,
    int *im
);

void vel2_map_142(
    int *km,
    int *im,
    int *nou4,
    int *diu4,
    int *cov4,
    int *jm
);

void vel2_map_149(
    int *km,
    int *jm,
    int *nou5,
    int *diu5,
    int *cov5,
    int *im
);

void vel2_map_159(
    int *km,
    int *im,
    int *nou7,
    int *diu7,
    int *cov7,
    int *jm
);

void vel2_map_166(
    int *km,
    int *jm,
    int *nou8,
    int *diu8,
    int *cov8,
    int *im
);

void vel2_map_177(
    int *km,
    int *im,
    int *diu2,
    int *diu3,
    int *jm
);

void vel2_map_183(
    int *km,
    int *jm,
    int *diu4,
    int *diu6,
    int *im
);

void velfg_map_62(
    int *km,
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
    int *jm,
    int *im,
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
    int *h
);

void velnw_map_27(
    int *km,
    int *__attribute__((annotate("1.5 0.5 5"))) p,
    int *ro,
    int *dxs,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("0.2 0.2 1"))) dt,
    int *f,
    int *jm,
    int *im,
    int *dys,
    int *__attribute__((annotate("50 0 3"))) v,
    int *g,
    int *dzs,
    int *__attribute__((annotate("50 0 3"))) w,
    int *h
);

void adam_bondv1_feedbf_les_press_v_etc_superkernel(
    int *km,
    int *f,
    int *g,
    int *h,
    int *fold,
    int *gold,
    int *hold,
    int *jm,
    int *im,
    int *z2,
    int *__attribute__((annotate("10 1 4"))) dzn,
    int *ical,
    int *n,
    int *i,
    int *k,
    int *__attribute__((annotate("50 0 3"))) u,
    int *__attribute__((annotate("50 0 3"))) v,
    int *__attribute__((annotate("50 0 3"))) w,
    int *j,
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
    int *state_ptr
);

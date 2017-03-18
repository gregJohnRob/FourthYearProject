#ifndef __ARRAY_INDEX_F2C_H__
#define __ARRAY_INDEX_F2C_H__
inline unsigned int F3D2C(
        unsigned int __attribute__((annotate("150 0 0"))) i_rng,unsigned int __attribute__((annotate("150 0 0"))) j_rng, // ranges, i.e. (hb-lb)+1
        int __attribute__((annotate("1 -1 0"))) i_lb, int __attribute__((annotate("1 -1 0"))) j_lb, int __attribute__((annotate("1 -1 0"))) k_lb, // lower bounds
        int __attribute__((annotate("150 0 0"))) ix, int __attribute__((annotate("150 0 0"))) jx, int __attribute__((annotate("90 0 0"))) kx
        ) {
    return (i_rng*j_rng*(kx-k_lb)+i_rng*(jx-j_lb)+ix-i_lb);
}

inline unsigned int F2D2C(
        unsigned int __attribute__((annotate("150 0 0"))) i_rng, // ranges, i.e. (hb-lb)+1
        int __attribute__((annotate("1 -1 0"))) i_lb, int __attribute__((annotate("1 -1 0"))) j_lb, // lower bounds
        int __attribute__((annotate("150 0 0"))) ix, int __attribute__((annotate("150 0 0"))) jx
        ) {
    return (i_rng*(jx-j_lb)+ix-i_lb);
}


inline unsigned int F1D2C(
        int __attribute__((annotate("1 -1 0"))) i_lb, // lower bounds
        int __attribute__((annotate("150 0 0"))) ix
        ) {
    return ix-i_lb;
}

#endif

// F3D2C = 2070300 -22651 0
// F2D2C = 22801 -151 0
// F1D2C = 151 -1 0

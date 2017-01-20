#ifndef _HOST_SW2D_H_
#define _HOST_SW2D_H_

//define NX and NY (2 less then the ARRAY-SIZE, ARRAY has additional values for boundry/land)
//TODO: The build script assumes DIM1=DIM2 so just working with it for now
//      But this is an artificial constraint which should be removed eventually
#define NX (STREAM_ARRAY_SIZE_DIM1-2)
#define NY (STREAM_ARRAY_SIZE_DIM2-2)

//define COLS and ROWS and SIZE simply as STREAM_ARRAY_SIZE_DIMN is too wordy
#define ROWS STREAM_ARRAY_SIZE_DIM1
#define COLS STREAM_ARRAY_SIZE_DIM2
#define SIZE STREAM_ARRAY_SIZE

#include "host-generic.h"
 //this takes care of adding enumerations.h and derivedParameters.h

void sw2d_init_data_host  ( stypeHost *__attribute__((annotate("15 0 6"))) hzero
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
                          );

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
                    );

void sw2d_shapiro_host  ( stypeHost *__attribute__((annotate("1 0 0"))) wet
                        , stypeHost *__attribute__((annotate("15 0 6"))) etan
                        , stypeHost __attribute__((annotate("0 0 2"))) eps
                        , stypeHost *__attribute__((annotate("15 0 6"))) eta
                        );


void sw2d_updates_host  ( stypeHost *__attribute__((annotate("15 0 6"))) h
                        , stypeHost *__attribute__((annotate("15 0 6"))) hzero
                        , stypeHost *__attribute__((annotate("15 0 6"))) eta
                        , stypeHost *__attribute__((annotate("10 -10 6"))) u
                        , stypeHost *__attribute__((annotate("10 -10 6"))) un
                        , stypeHost *__attribute__((annotate("10 -10 6"))) v
                        , stypeHost *__attribute__((annotate("10 -10 6"))) vn
                        , stypeHost *__attribute__((annotate("1 0 0"))) wet
                        , stypeHost __attribute__((annotate("15 0 6"))) hmin
                        );


#endif

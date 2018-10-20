/*
 * File: lego2_private.h
 *
 * Code generated for Simulink model 'lego2'.
 *
 * Model version                  : 1.99
 * Simulink Coder version         : 8.10 (R2016a) 10-Feb-2016
 * TLC version                    : 8.10 (Jan 14 2016)
 * C/C++ source code generated on : Wed Jun 08 11:55:33 2016
 *
 * Target selection: realtime.tlc
 * Embedded hardware selection: ARM Compatible->ARM 7
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_lego2_private_h_
#define RTW_HEADER_lego2_private_h_
#include "rtwtypes.h"
#include "multiword_types.h"

/* Private macros used by the generated code to access rtModel */
#ifndef rtmIsMajorTimeStep
# define rtmIsMajorTimeStep(rtm)       (((rtm)->Timing.simTimeStep) == MAJOR_TIME_STEP)
#endif

#ifndef rtmIsMinorTimeStep
# define rtmIsMinorTimeStep(rtm)       (((rtm)->Timing.simTimeStep) == MINOR_TIME_STEP)
#endif

#ifndef rtmSetTFinal
# define rtmSetTFinal(rtm, val)        ((rtm)->Timing.tFinal = (val))
#endif

#ifndef rtmGetTPtr
# define rtmGetTPtr(rtm)               ((rtm)->Timing.t)
#endif

#ifndef rtmSetTPtr
# define rtmSetTPtr(rtm, val)          ((rtm)->Timing.t = (val))
#endif

/* private model entry point functions */
extern void lego2_derivatives(void);

#endif                                 /* RTW_HEADER_lego2_private_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

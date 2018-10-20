/*
 * File: lego2_data.c
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

#include "lego2.h"
#include "lego2_private.h"

/* Block parameters (auto storage) */
P_lego2_T lego2_P = {
  0.0,                                 /* Mask Parameter: CompareToConstant_const
                                        * Referenced by: '<S9>/Constant'
                                        */
  0.0,                                 /* Mask Parameter: CompareToConstant1_const
                                        * Referenced by: '<S10>/Constant'
                                        */
  0.0,                                 /* Mask Parameter: CompareToConstant_const_m
                                        * Referenced by: '<S1>/Constant'
                                        */
  0.1,                                 /* Mask Parameter: CompareToConstant1_const_m
                                        * Referenced by: '<S2>/Constant'
                                        */
  0.0,                                 /* Mask Parameter: CompareToConstant2_const
                                        * Referenced by: '<S3>/Constant'
                                        */
  0.1,                                 /* Mask Parameter: CompareToConstant3_const
                                        * Referenced by: '<S4>/Constant'
                                        */
  0.0,                                 /* Mask Parameter: CompareToConstant4_const
                                        * Referenced by: '<S11>/Constant'
                                        */
  0.0,                                 /* Mask Parameter: CompareToConstant5_const
                                        * Referenced by: '<S12>/Constant'
                                        */
  0.0,                                 /* Mask Parameter: CompareToConstant6_const
                                        * Referenced by: '<S13>/Constant'
                                        */
  0.0,                                 /* Mask Parameter: CompareToConstant7_const
                                        * Referenced by: '<S14>/Constant'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/translacija'
                                        */
  100.0,                               /* Expression: 200/2
                                        * Referenced by: '<Root>/Gain'
                                        */
  -35.0,                               /* Expression: -35
                                        * Referenced by: '<S8>/Dead Zone'
                                        */
  35.0,                                /* Expression: 35
                                        * Referenced by: '<S8>/Dead Zone'
                                        */
  100.0,                               /* Expression: 100
                                        * Referenced by: '<S8>/Constant'
                                        */
  -80.0,                               /* Expression: -80
                                        * Referenced by: '<S8>/Constant1'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/rotacija1'
                                        */
  2.9444444444444446,                  /* Expression: 265/90
                                        * Referenced by: '<Root>/Gain1'
                                        */
  3.1666666666666665,                  /* Expression: 285/90
                                        * Referenced by: '<Root>/Gain3'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S8>/Dead Zone1'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S8>/Dead Zone1'
                                        */
  1.1,                                 /* Expression: 1.1
                                        * Referenced by: '<S8>/Kr'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S8>/Integrator'
                                        */
  -0.5,                                /* Expression: -0.5
                                        * Referenced by: '<S8>/Dead Zone4'
                                        */
  0.5,                                 /* Expression: 0.5
                                        * Referenced by: '<S8>/Dead Zone4'
                                        */
  5.0,                                 /* Expression: 5
                                        * Referenced by: '<S8>/Kr1'
                                        */
  25.0,                                /* Expression: 25
                                        * Referenced by: '<S8>/Saturation'
                                        */
  -25.0,                               /* Expression: -25
                                        * Referenced by: '<S8>/Saturation'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/rotacija2'
                                        */
  2.9444444444444446,                  /* Expression: 265/90
                                        * Referenced by: '<Root>/Gain2'
                                        */
  3.1666666666666665,                  /* Expression: 285/90
                                        * Referenced by: '<Root>/Gain4'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S8>/Dead Zone2'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S8>/Dead Zone2'
                                        */
  1.1,                                 /* Expression: 1.1
                                        * Referenced by: '<S8>/Kr2'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<S8>/Integrator1'
                                        */
  -0.5,                                /* Expression: -0.5
                                        * Referenced by: '<S8>/Dead Zone5'
                                        */
  0.5,                                 /* Expression: 0.5
                                        * Referenced by: '<S8>/Dead Zone5'
                                        */
  3.5,                                 /* Expression: 3.5
                                        * Referenced by: '<S8>/Kr3'
                                        */
  35.0,                                /* Expression: 35
                                        * Referenced by: '<S8>/Saturation1'
                                        */
  -35.0,                               /* Expression: -35
                                        * Referenced by: '<S8>/Saturation1'
                                        */
  0.022000000000000002,                /* Expression: 1.1/50
                                        * Referenced by: '<S8>/Ki'
                                        */
  0.022000000000000002,                /* Expression: 1.1/50
                                        * Referenced by: '<S8>/Ki1'
                                        */
  -22.0,                               /* Expression: -22
                                        * Referenced by: '<S8>/Constant5'
                                        */
  -25.0,                               /* Expression: -25
                                        * Referenced by: '<S8>/Constant7'
                                        */
  -8.928571428571427,                  /* Computed Parameter: TransferFcn_A
                                        * Referenced by: '<S8>/Transfer Fcn'
                                        */
  0.0                                  /* Computed Parameter: TransferFcn_C
                                        * Referenced by: '<S8>/Transfer Fcn'
                                        */
};

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

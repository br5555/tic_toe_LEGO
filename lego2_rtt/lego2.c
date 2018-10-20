/*
 * File: lego2.c
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
#include "lego2_dt.h"
#include "nxt_util.h"

/* Block signals (auto storage) */
B_lego2_T lego2_B;

/* Continuous states */
X_lego2_T lego2_X;

/* Block states (auto storage) */
DW_lego2_T lego2_DW;

/* Real-time model */
RT_MODEL_lego2_T lego2_M_;
RT_MODEL_lego2_T *const lego2_M = &lego2_M_;

/*
 * This function updates continuous states using the ODE3 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  /* Solver Matrices */
  static const real_T rt_ODE3_A[3] = {
    1.0/2.0, 3.0/4.0, 1.0
  };

  static const real_T rt_ODE3_B[3][3] = {
    { 1.0/2.0, 0.0, 0.0 },

    { 0.0, 3.0/4.0, 0.0 },

    { 2.0/9.0, 1.0/3.0, 4.0/9.0 }
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE3_IntgData *id = (ODE3_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T hB[3];
  int_T i;
  int_T nXc = 3;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  lego2_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  lego2_output();
  lego2_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE3_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[1]);
  rtsiSetdX(si, f2);
  lego2_output();
  lego2_derivatives();

  /* tnew = t + hA(3);
     ynew = y + f*hB(:,3); */
  for (i = 0; i <= 2; i++) {
    hB[i] = h * rt_ODE3_B[2][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, tnew);
  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/* Model output function */
void lego2_output(void)
{
  int8_T tmp;
  int8_T tmp_0;
  int8_T tmp_1;
  real_T rtb_DeadZone2;
  real_T rtb_DeadZone1;
  real_T rtb_DeadZone5;
  if (rtmIsMajorTimeStep(lego2_M)) {
    /* set solver stop time */
    if (!(lego2_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&lego2_M->solverInfo, ((lego2_M->Timing.clockTickH0
        + 1) * lego2_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&lego2_M->solverInfo, ((lego2_M->Timing.clockTick0 +
        1) * lego2_M->Timing.stepSize0 + lego2_M->Timing.clockTickH0 *
        lego2_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(lego2_M)) {
    lego2_M->Timing.t[0] = rtsiGetT(&lego2_M->solverInfo);
  }

  if (rtmIsMajorTimeStep(lego2_M)) {
    /* S-Function (nxt_encoder): '<S8>/Encoder' */
    lego2_B.Encoder = getEncoderValueNoReset(1U);

    /* S-Function (nxt_encoder): '<S8>/Encoder1' */
    lego2_B.Encoder1 = getEncoderValueNoReset(2U);

    /* S-Function (nxt_encoder): '<S8>/Encoder2' */
    lego2_B.Encoder2 = getEncoderValueNoReset(3U);

    /* Sum: '<S8>/Sum1' incorporates:
     *  Constant: '<Root>/translacija'
     *  Gain: '<Root>/Gain'
     */
    rtb_DeadZone2 = lego2_P.Gain_Gain * lego2_P.translacija_Value - (real_T)
      lego2_B.Encoder;

    /* DeadZone: '<S8>/Dead Zone' */
    if (rtb_DeadZone2 > lego2_P.DeadZone_End) {
      rtb_DeadZone2 -= lego2_P.DeadZone_End;
    } else if (rtb_DeadZone2 >= lego2_P.DeadZone_Start) {
      rtb_DeadZone2 = 0.0;
    } else {
      rtb_DeadZone2 -= lego2_P.DeadZone_Start;
    }

    /* End of DeadZone: '<S8>/Dead Zone' */

    /* RelationalOperator: '<S9>/Compare' incorporates:
     *  Constant: '<S9>/Constant'
     */
    lego2_B.Compare = (uint8_T)(rtb_DeadZone2 > lego2_P.CompareToConstant_const);

    /* Product: '<S8>/Product1' incorporates:
     *  Constant: '<S10>/Constant'
     *  Constant: '<S8>/Constant1'
     *  RelationalOperator: '<S10>/Compare'
     */
    lego2_B.Product1 = (real_T)(rtb_DeadZone2 < lego2_P.CompareToConstant1_const)
      * lego2_P.Constant1_Value;

    /* DataTypeConversion: '<S5>/Data Type Conversion' incorporates:
     *  Constant: '<S8>/Constant'
     *  Product: '<S8>/Product'
     *  Sum: '<S8>/Sum'
     */
    rtb_DeadZone5 = floor((real_T)lego2_B.Compare * lego2_P.Constant_Value +
                          lego2_B.Product1);
    if (rtb_DeadZone5 < 128.0) {
      if (rtb_DeadZone5 >= -128.0) {
        /* S-Function (nxt_motor): '<S5>/Motor' */
        tmp = (int8_T)rtb_DeadZone5;
      } else {
        /* S-Function (nxt_motor): '<S5>/Motor' */
        tmp = MIN_int8_T;
      }
    } else {
      /* S-Function (nxt_motor): '<S5>/Motor' */
      tmp = MAX_int8_T;
    }

    /* End of DataTypeConversion: '<S5>/Data Type Conversion' */

    /* S-Function (nxt_motor): '<S5>/Motor' */
    setMotor(&tmp, 1U, 2U);

    /* Sum: '<S8>/Sum3' incorporates:
     *  Constant: '<Root>/rotacija1'
     *  Constant: '<S1>/Constant'
     *  Constant: '<S2>/Constant'
     *  Gain: '<Root>/Gain1'
     *  Gain: '<Root>/Gain3'
     *  Product: '<Root>/Product'
     *  Product: '<Root>/Product1'
     *  RelationalOperator: '<S1>/Compare'
     *  RelationalOperator: '<S2>/Compare'
     *  Sum: '<Root>/Sum'
     */
    rtb_DeadZone1 = ((real_T)(lego2_P.rotacija1_Value <
      lego2_P.CompareToConstant_const_m) * lego2_P.rotacija1_Value *
                     lego2_P.Gain1_Gain + (real_T)(lego2_P.rotacija1_Value >=
      lego2_P.CompareToConstant1_const_m) * lego2_P.rotacija1_Value *
                     lego2_P.Gain3_Gain) - (real_T)lego2_B.Encoder1;

    /* DeadZone: '<S8>/Dead Zone1' */
    if (rtb_DeadZone1 > lego2_P.DeadZone1_End) {
      rtb_DeadZone1 -= lego2_P.DeadZone1_End;
    } else if (rtb_DeadZone1 >= lego2_P.DeadZone1_Start) {
      rtb_DeadZone1 = 0.0;
    } else {
      rtb_DeadZone1 -= lego2_P.DeadZone1_Start;
    }

    /* End of DeadZone: '<S8>/Dead Zone1' */

    /* Gain: '<S8>/Kr' */
    lego2_B.Kr = lego2_P.Kr_Gain * rtb_DeadZone1;
  }

  /* Sum: '<S8>/Sum6' incorporates:
   *  Integrator: '<S8>/Integrator'
   */
  rtb_DeadZone5 = lego2_B.Kr + lego2_X.Integrator_CSTATE;

  /* DeadZone: '<S8>/Dead Zone4' */
  if (rtb_DeadZone5 > lego2_P.DeadZone4_End) {
    rtb_DeadZone5 -= lego2_P.DeadZone4_End;
  } else if (rtb_DeadZone5 >= lego2_P.DeadZone4_Start) {
    rtb_DeadZone5 = 0.0;
  } else {
    rtb_DeadZone5 -= lego2_P.DeadZone4_Start;
  }

  /* End of DeadZone: '<S8>/Dead Zone4' */

  /* Gain: '<S8>/Kr1' */
  lego2_B.Kr1 = lego2_P.Kr1_Gain * rtb_DeadZone5;

  /* Saturate: '<S8>/Saturation' */
  if (lego2_B.Kr1 > lego2_P.Saturation_UpperSat) {
    lego2_B.Saturation = lego2_P.Saturation_UpperSat;
  } else if (lego2_B.Kr1 < lego2_P.Saturation_LowerSat) {
    lego2_B.Saturation = lego2_P.Saturation_LowerSat;
  } else {
    lego2_B.Saturation = lego2_B.Kr1;
  }

  /* End of Saturate: '<S8>/Saturation' */
  if (rtmIsMajorTimeStep(lego2_M)) {
    /* DataTypeConversion: '<S6>/Data Type Conversion' */
    rtb_DeadZone5 = floor(lego2_B.Saturation);
    if (rtb_DeadZone5 < 128.0) {
      if (rtb_DeadZone5 >= -128.0) {
        /* S-Function (nxt_motor): '<S6>/Motor' */
        tmp_0 = (int8_T)rtb_DeadZone5;
      } else {
        /* S-Function (nxt_motor): '<S6>/Motor' */
        tmp_0 = MIN_int8_T;
      }
    } else {
      /* S-Function (nxt_motor): '<S6>/Motor' */
      tmp_0 = MAX_int8_T;
    }

    /* End of DataTypeConversion: '<S6>/Data Type Conversion' */

    /* S-Function (nxt_motor): '<S6>/Motor' */
    setMotor(&tmp_0, 2U, 2U);

    /* Sum: '<S8>/Sum5' incorporates:
     *  Constant: '<Root>/rotacija2'
     *  Constant: '<S3>/Constant'
     *  Constant: '<S4>/Constant'
     *  Gain: '<Root>/Gain2'
     *  Gain: '<Root>/Gain4'
     *  Product: '<Root>/Product2'
     *  Product: '<Root>/Product3'
     *  RelationalOperator: '<S3>/Compare'
     *  RelationalOperator: '<S4>/Compare'
     *  Sum: '<Root>/Sum1'
     */
    rtb_DeadZone2 = ((real_T)(lego2_P.rotacija2_Value <
      lego2_P.CompareToConstant2_const) * lego2_P.rotacija2_Value *
                     lego2_P.Gain2_Gain + (real_T)(lego2_P.rotacija2_Value >=
      lego2_P.CompareToConstant3_const) * lego2_P.rotacija2_Value *
                     lego2_P.Gain4_Gain) - (real_T)lego2_B.Encoder2;

    /* DeadZone: '<S8>/Dead Zone2' */
    if (rtb_DeadZone2 > lego2_P.DeadZone2_End) {
      rtb_DeadZone2 -= lego2_P.DeadZone2_End;
    } else if (rtb_DeadZone2 >= lego2_P.DeadZone2_Start) {
      rtb_DeadZone2 = 0.0;
    } else {
      rtb_DeadZone2 -= lego2_P.DeadZone2_Start;
    }

    /* End of DeadZone: '<S8>/Dead Zone2' */

    /* Gain: '<S8>/Kr2' */
    lego2_B.Kr2 = lego2_P.Kr2_Gain * rtb_DeadZone2;
  }

  /* Sum: '<S8>/Sum2' incorporates:
   *  Integrator: '<S8>/Integrator1'
   */
  rtb_DeadZone5 = lego2_B.Kr2 + lego2_X.Integrator1_CSTATE;

  /* DeadZone: '<S8>/Dead Zone5' */
  if (rtb_DeadZone5 > lego2_P.DeadZone5_End) {
    rtb_DeadZone5 -= lego2_P.DeadZone5_End;
  } else if (rtb_DeadZone5 >= lego2_P.DeadZone5_Start) {
    rtb_DeadZone5 = 0.0;
  } else {
    rtb_DeadZone5 -= lego2_P.DeadZone5_Start;
  }

  /* End of DeadZone: '<S8>/Dead Zone5' */

  /* Gain: '<S8>/Kr3' */
  lego2_B.Kr3 = lego2_P.Kr3_Gain * rtb_DeadZone5;

  /* Saturate: '<S8>/Saturation1' */
  if (lego2_B.Kr3 > lego2_P.Saturation1_UpperSat) {
    lego2_B.Saturation1 = lego2_P.Saturation1_UpperSat;
  } else if (lego2_B.Kr3 < lego2_P.Saturation1_LowerSat) {
    lego2_B.Saturation1 = lego2_P.Saturation1_LowerSat;
  } else {
    lego2_B.Saturation1 = lego2_B.Kr3;
  }

  /* End of Saturate: '<S8>/Saturation1' */
  if (rtmIsMajorTimeStep(lego2_M)) {
    /* DataTypeConversion: '<S7>/Data Type Conversion' */
    rtb_DeadZone5 = floor(lego2_B.Saturation1);
    if (rtb_DeadZone5 < 128.0) {
      if (rtb_DeadZone5 >= -128.0) {
        /* S-Function (nxt_motor): '<S7>/Motor' */
        tmp_1 = (int8_T)rtb_DeadZone5;
      } else {
        /* S-Function (nxt_motor): '<S7>/Motor' */
        tmp_1 = MIN_int8_T;
      }
    } else {
      /* S-Function (nxt_motor): '<S7>/Motor' */
      tmp_1 = MAX_int8_T;
    }

    /* End of DataTypeConversion: '<S7>/Data Type Conversion' */

    /* S-Function (nxt_motor): '<S7>/Motor' */
    setMotor(&tmp_1, 3U, 2U);

    /* Gain: '<S8>/Ki' */
    lego2_B.Ki = lego2_P.Ki_Gain * rtb_DeadZone1;

    /* Gain: '<S8>/Ki1' */
    lego2_B.Ki1 = lego2_P.Ki1_Gain * rtb_DeadZone2;

    /* RelationalOperator: '<S11>/Compare' incorporates:
     *  Constant: '<S11>/Constant'
     */
    lego2_B.Compare_i = (uint8_T)(0.0 > lego2_P.CompareToConstant4_const);

    /* Product: '<S8>/Product5' incorporates:
     *  Constant: '<S12>/Constant'
     *  Constant: '<S8>/Constant5'
     *  RelationalOperator: '<S12>/Compare'
     */
    lego2_B.Product5 = (real_T)(0.0 < lego2_P.CompareToConstant5_const) *
      lego2_P.Constant5_Value;

    /* RelationalOperator: '<S13>/Compare' incorporates:
     *  Constant: '<S13>/Constant'
     */
    lego2_B.Compare_n = (uint8_T)(0.0 > lego2_P.CompareToConstant6_const);

    /* Product: '<S8>/Product7' incorporates:
     *  Constant: '<S14>/Constant'
     *  Constant: '<S8>/Constant7'
     *  RelationalOperator: '<S14>/Compare'
     */
    lego2_B.Product7 = (real_T)(0.0 < lego2_P.CompareToConstant7_const) *
      lego2_P.Constant7_Value;
  }
}

/* Model update function */
void lego2_update(void)
{
  /* signal main to stop simulation */
  {                                    /* Sample time: [0.0s, 0.0s] */
    if ((rtmGetTFinal(lego2_M)!=-1) &&
        !((rtmGetTFinal(lego2_M)-(((lego2_M->Timing.clockTick1+
             lego2_M->Timing.clockTickH1* 4294967296.0)) * 0.1)) >
          (((lego2_M->Timing.clockTick1+lego2_M->Timing.clockTickH1*
             4294967296.0)) * 0.1) * (DBL_EPSILON))) {
      rtmSetErrorStatus(lego2_M, "Simulation finished");
    }

    if (rtmGetStopRequested(lego2_M)) {
      rtmSetErrorStatus(lego2_M, "Simulation finished");
    }
  }

  if (rtmIsMajorTimeStep(lego2_M)) {
    rt_ertODEUpdateContinuousStates(&lego2_M->solverInfo);
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++lego2_M->Timing.clockTick0)) {
    ++lego2_M->Timing.clockTickH0;
  }

  lego2_M->Timing.t[0] = rtsiGetSolverStopTime(&lego2_M->solverInfo);

  {
    /* Update absolute timer for sample time: [0.1s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The resolution of this integer timer is 0.1, which is the step size
     * of the task. Size of "clockTick1" ensures timer will not overflow during the
     * application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    lego2_M->Timing.clockTick1++;
    if (!lego2_M->Timing.clockTick1) {
      lego2_M->Timing.clockTickH1++;
    }
  }
}

/* Derivatives for root system: '<Root>' */
void lego2_derivatives(void)
{
  XDot_lego2_T *_rtXdot;
  _rtXdot = ((XDot_lego2_T *) lego2_M->ModelData.derivs);

  /* Derivatives for Integrator: '<S8>/Integrator' */
  _rtXdot->Integrator_CSTATE = lego2_B.Ki;

  /* Derivatives for Integrator: '<S8>/Integrator1' */
  _rtXdot->Integrator1_CSTATE = lego2_B.Ki1;

  /* Derivatives for TransferFcn: '<S8>/Transfer Fcn' */
  _rtXdot->TransferFcn_CSTATE = 0.0;
  _rtXdot->TransferFcn_CSTATE += lego2_P.TransferFcn_A *
    lego2_X.TransferFcn_CSTATE;
}

/* Model initialize function */
void lego2_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)lego2_M, 0,
                sizeof(RT_MODEL_lego2_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&lego2_M->solverInfo, &lego2_M->Timing.simTimeStep);
    rtsiSetTPtr(&lego2_M->solverInfo, &rtmGetTPtr(lego2_M));
    rtsiSetStepSizePtr(&lego2_M->solverInfo, &lego2_M->Timing.stepSize0);
    rtsiSetdXPtr(&lego2_M->solverInfo, &lego2_M->ModelData.derivs);
    rtsiSetContStatesPtr(&lego2_M->solverInfo, (real_T **)
                         &lego2_M->ModelData.contStates);
    rtsiSetNumContStatesPtr(&lego2_M->solverInfo, &lego2_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&lego2_M->solverInfo,
      &lego2_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&lego2_M->solverInfo,
      &lego2_M->ModelData.periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&lego2_M->solverInfo,
      &lego2_M->ModelData.periodicContStateRanges);
    rtsiSetErrorStatusPtr(&lego2_M->solverInfo, (&rtmGetErrorStatus(lego2_M)));
    rtsiSetRTModelPtr(&lego2_M->solverInfo, lego2_M);
  }

  rtsiSetSimTimeStep(&lego2_M->solverInfo, MAJOR_TIME_STEP);
  lego2_M->ModelData.intgData.y = lego2_M->ModelData.odeY;
  lego2_M->ModelData.intgData.f[0] = lego2_M->ModelData.odeF[0];
  lego2_M->ModelData.intgData.f[1] = lego2_M->ModelData.odeF[1];
  lego2_M->ModelData.intgData.f[2] = lego2_M->ModelData.odeF[2];
  lego2_M->ModelData.contStates = ((X_lego2_T *) &lego2_X);
  rtsiSetSolverData(&lego2_M->solverInfo, (void *)&lego2_M->ModelData.intgData);
  rtsiSetSolverName(&lego2_M->solverInfo,"ode3");
  rtmSetTPtr(lego2_M, &lego2_M->Timing.tArray[0]);
  rtmSetTFinal(lego2_M, -1);
  lego2_M->Timing.stepSize0 = 0.1;

  /* External mode info */
  lego2_M->Sizes.checksums[0] = (2451409992U);
  lego2_M->Sizes.checksums[1] = (318830580U);
  lego2_M->Sizes.checksums[2] = (4238661952U);
  lego2_M->Sizes.checksums[3] = (3786868580U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    lego2_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(lego2_M->extModeInfo,
      &lego2_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(lego2_M->extModeInfo, lego2_M->Sizes.checksums);
    rteiSetTPtr(lego2_M->extModeInfo, rtmGetTPtr(lego2_M));
  }

  /* block I/O */
  (void) memset(((void *) &lego2_B), 0,
                sizeof(B_lego2_T));

  /* states (continuous) */
  {
    (void) memset((void *)&lego2_X, 0,
                  sizeof(X_lego2_T));
  }

  /* states (dwork) */
  (void) memset((void *)&lego2_DW, 0,
                sizeof(DW_lego2_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    lego2_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  /* InitializeConditions for Integrator: '<S8>/Integrator' */
  lego2_X.Integrator_CSTATE = lego2_P.Integrator_IC;

  /* InitializeConditions for Integrator: '<S8>/Integrator1' */
  lego2_X.Integrator1_CSTATE = lego2_P.Integrator1_IC;

  /* InitializeConditions for TransferFcn: '<S8>/Transfer Fcn' */
  lego2_X.TransferFcn_CSTATE = 0.0;
}

/* Model terminate function */
void lego2_terminate(void)
{
  /* Terminate for S-Function (nxt_motor): '<S5>/Motor' */
  terminateMotor(1U, 2U);

  /* Terminate for S-Function (nxt_motor): '<S6>/Motor' */
  terminateMotor(2U, 2U);

  /* Terminate for S-Function (nxt_motor): '<S7>/Motor' */
  terminateMotor(3U, 2U);
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

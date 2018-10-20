/*
 * File: lego2.h
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

#ifndef RTW_HEADER_lego2_h_
#define RTW_HEADER_lego2_h_
#include <math.h>
#include <float.h>
#include <string.h>
#include <stddef.h>
#ifndef lego2_COMMON_INCLUDES_
# define lego2_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "dt_info.h"
#include "ext_work.h"
#include "driver_nxt.h"
#endif                                 /* lego2_COMMON_INCLUDES_ */

#include "lego2_types.h"

/* Shared type includes */
#include "multiword_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

/* Block signals (auto storage) */
typedef struct {
  real_T Product1;                     /* '<S8>/Product1' */
  real_T Kr;                           /* '<S8>/Kr' */
  real_T Kr1;                          /* '<S8>/Kr1' */
  real_T Saturation;                   /* '<S8>/Saturation' */
  real_T Kr2;                          /* '<S8>/Kr2' */
  real_T Kr3;                          /* '<S8>/Kr3' */
  real_T Saturation1;                  /* '<S8>/Saturation1' */
  real_T Ki;                           /* '<S8>/Ki' */
  real_T Ki1;                          /* '<S8>/Ki1' */
  real_T Product5;                     /* '<S8>/Product5' */
  real_T Product7;                     /* '<S8>/Product7' */
  int32_T Encoder;                     /* '<S8>/Encoder' */
  int32_T Encoder1;                    /* '<S8>/Encoder1' */
  int32_T Encoder2;                    /* '<S8>/Encoder2' */
  uint8_T Compare;                     /* '<S9>/Compare' */
  uint8_T Compare_i;                   /* '<S11>/Compare' */
  uint8_T Compare_n;                   /* '<S13>/Compare' */
} B_lego2_T;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  struct {
    void *LoggedData;
  } Scope_PWORK;                       /* '<S8>/Scope' */

  struct {
    void *LoggedData;
  } ToWorkspace1_PWORK;                /* '<S8>/To Workspace1' */

  struct {
    void *LoggedData;
  } ToWorkspace_PWORK;                 /* '<S8>/To Workspace' */
} DW_lego2_T;

/* Continuous states (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S8>/Integrator' */
  real_T Integrator1_CSTATE;           /* '<S8>/Integrator1' */
  real_T TransferFcn_CSTATE;           /* '<S8>/Transfer Fcn' */
} X_lego2_T;

/* State derivatives (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S8>/Integrator' */
  real_T Integrator1_CSTATE;           /* '<S8>/Integrator1' */
  real_T TransferFcn_CSTATE;           /* '<S8>/Transfer Fcn' */
} XDot_lego2_T;

/* State disabled  */
typedef struct {
  boolean_T Integrator_CSTATE;         /* '<S8>/Integrator' */
  boolean_T Integrator1_CSTATE;        /* '<S8>/Integrator1' */
  boolean_T TransferFcn_CSTATE;        /* '<S8>/Transfer Fcn' */
} XDis_lego2_T;

#ifndef ODE3_INTG
#define ODE3_INTG

/* ODE3 Integration Data */
typedef struct {
  real_T *y;                           /* output */
  real_T *f[3];                        /* derivatives */
} ODE3_IntgData;

#endif

/* Parameters (auto storage) */
struct P_lego2_T_ {
  real_T CompareToConstant_const;      /* Mask Parameter: CompareToConstant_const
                                        * Referenced by: '<S9>/Constant'
                                        */
  real_T CompareToConstant1_const;     /* Mask Parameter: CompareToConstant1_const
                                        * Referenced by: '<S10>/Constant'
                                        */
  real_T CompareToConstant_const_m;    /* Mask Parameter: CompareToConstant_const_m
                                        * Referenced by: '<S1>/Constant'
                                        */
  real_T CompareToConstant1_const_m;   /* Mask Parameter: CompareToConstant1_const_m
                                        * Referenced by: '<S2>/Constant'
                                        */
  real_T CompareToConstant2_const;     /* Mask Parameter: CompareToConstant2_const
                                        * Referenced by: '<S3>/Constant'
                                        */
  real_T CompareToConstant3_const;     /* Mask Parameter: CompareToConstant3_const
                                        * Referenced by: '<S4>/Constant'
                                        */
  real_T CompareToConstant4_const;     /* Mask Parameter: CompareToConstant4_const
                                        * Referenced by: '<S11>/Constant'
                                        */
  real_T CompareToConstant5_const;     /* Mask Parameter: CompareToConstant5_const
                                        * Referenced by: '<S12>/Constant'
                                        */
  real_T CompareToConstant6_const;     /* Mask Parameter: CompareToConstant6_const
                                        * Referenced by: '<S13>/Constant'
                                        */
  real_T CompareToConstant7_const;     /* Mask Parameter: CompareToConstant7_const
                                        * Referenced by: '<S14>/Constant'
                                        */
  real_T translacija_Value;            /* Expression: 0
                                        * Referenced by: '<Root>/translacija'
                                        */
  real_T Gain_Gain;                    /* Expression: 200/2
                                        * Referenced by: '<Root>/Gain'
                                        */
  real_T DeadZone_Start;               /* Expression: -35
                                        * Referenced by: '<S8>/Dead Zone'
                                        */
  real_T DeadZone_End;                 /* Expression: 35
                                        * Referenced by: '<S8>/Dead Zone'
                                        */
  real_T Constant_Value;               /* Expression: 100
                                        * Referenced by: '<S8>/Constant'
                                        */
  real_T Constant1_Value;              /* Expression: -80
                                        * Referenced by: '<S8>/Constant1'
                                        */
  real_T rotacija1_Value;              /* Expression: 0
                                        * Referenced by: '<Root>/rotacija1'
                                        */
  real_T Gain1_Gain;                   /* Expression: 265/90
                                        * Referenced by: '<Root>/Gain1'
                                        */
  real_T Gain3_Gain;                   /* Expression: 285/90
                                        * Referenced by: '<Root>/Gain3'
                                        */
  real_T DeadZone1_Start;              /* Expression: 0
                                        * Referenced by: '<S8>/Dead Zone1'
                                        */
  real_T DeadZone1_End;                /* Expression: 0
                                        * Referenced by: '<S8>/Dead Zone1'
                                        */
  real_T Kr_Gain;                      /* Expression: 1.1
                                        * Referenced by: '<S8>/Kr'
                                        */
  real_T Integrator_IC;                /* Expression: 0
                                        * Referenced by: '<S8>/Integrator'
                                        */
  real_T DeadZone4_Start;              /* Expression: -0.5
                                        * Referenced by: '<S8>/Dead Zone4'
                                        */
  real_T DeadZone4_End;                /* Expression: 0.5
                                        * Referenced by: '<S8>/Dead Zone4'
                                        */
  real_T Kr1_Gain;                     /* Expression: 5
                                        * Referenced by: '<S8>/Kr1'
                                        */
  real_T Saturation_UpperSat;          /* Expression: 25
                                        * Referenced by: '<S8>/Saturation'
                                        */
  real_T Saturation_LowerSat;          /* Expression: -25
                                        * Referenced by: '<S8>/Saturation'
                                        */
  real_T rotacija2_Value;              /* Expression: 0
                                        * Referenced by: '<Root>/rotacija2'
                                        */
  real_T Gain2_Gain;                   /* Expression: 265/90
                                        * Referenced by: '<Root>/Gain2'
                                        */
  real_T Gain4_Gain;                   /* Expression: 285/90
                                        * Referenced by: '<Root>/Gain4'
                                        */
  real_T DeadZone2_Start;              /* Expression: 0
                                        * Referenced by: '<S8>/Dead Zone2'
                                        */
  real_T DeadZone2_End;                /* Expression: 0
                                        * Referenced by: '<S8>/Dead Zone2'
                                        */
  real_T Kr2_Gain;                     /* Expression: 1.1
                                        * Referenced by: '<S8>/Kr2'
                                        */
  real_T Integrator1_IC;               /* Expression: 0
                                        * Referenced by: '<S8>/Integrator1'
                                        */
  real_T DeadZone5_Start;              /* Expression: -0.5
                                        * Referenced by: '<S8>/Dead Zone5'
                                        */
  real_T DeadZone5_End;                /* Expression: 0.5
                                        * Referenced by: '<S8>/Dead Zone5'
                                        */
  real_T Kr3_Gain;                     /* Expression: 3.5
                                        * Referenced by: '<S8>/Kr3'
                                        */
  real_T Saturation1_UpperSat;         /* Expression: 35
                                        * Referenced by: '<S8>/Saturation1'
                                        */
  real_T Saturation1_LowerSat;         /* Expression: -35
                                        * Referenced by: '<S8>/Saturation1'
                                        */
  real_T Ki_Gain;                      /* Expression: 1.1/50
                                        * Referenced by: '<S8>/Ki'
                                        */
  real_T Ki1_Gain;                     /* Expression: 1.1/50
                                        * Referenced by: '<S8>/Ki1'
                                        */
  real_T Constant5_Value;              /* Expression: -22
                                        * Referenced by: '<S8>/Constant5'
                                        */
  real_T Constant7_Value;              /* Expression: -25
                                        * Referenced by: '<S8>/Constant7'
                                        */
  real_T TransferFcn_A;                /* Computed Parameter: TransferFcn_A
                                        * Referenced by: '<S8>/Transfer Fcn'
                                        */
  real_T TransferFcn_C;                /* Computed Parameter: TransferFcn_C
                                        * Referenced by: '<S8>/Transfer Fcn'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_lego2_T {
  const char_T *errorStatus;
  RTWExtModeInfo *extModeInfo;
  RTWSolverInfo solverInfo;

  /*
   * ModelData:
   * The following substructure contains information regarding
   * the data used in the model.
   */
  struct {
    X_lego2_T *contStates;
    int_T *periodicContStateIndices;
    real_T *periodicContStateRanges;
    real_T *derivs;
    boolean_T *contStateDisabled;
    boolean_T zCCacheNeedsReset;
    boolean_T derivCacheNeedsReset;
    boolean_T blkStateChange;
    real_T odeY[3];
    real_T odeF[3][3];
    ODE3_IntgData intgData;
  } ModelData;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T checksums[4];
    int_T numContStates;
    int_T numPeriodicContStates;
    int_T numSampTimes;
  } Sizes;

  /*
   * SpecialInfo:
   * The following substructure contains special information
   * related to other components that are dependent on RTW.
   */
  struct {
    const void *mappingInfo;
  } SpecialInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    time_T tFinal;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *t;
    time_T tArray[2];
  } Timing;
};

/* Block parameters (auto storage) */
extern P_lego2_T lego2_P;

/* Block signals (auto storage) */
extern B_lego2_T lego2_B;

/* Continuous states (auto storage) */
extern X_lego2_T lego2_X;

/* Block states (auto storage) */
extern DW_lego2_T lego2_DW;

/* Model entry point functions */
extern void lego2_initialize(void);
extern void lego2_output(void);
extern void lego2_update(void);
extern void lego2_terminate(void);

/* Real-time Model object */
extern RT_MODEL_lego2_T *const lego2_M;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<S8>/Constant4' : Unused code path elimination
 * Block '<S8>/Constant6' : Unused code path elimination
 * Block '<S8>/Dead Zone3' : Unused code path elimination
 * Block '<S8>/Product4' : Unused code path elimination
 * Block '<S8>/Product6' : Unused code path elimination
 * Block '<S8>/Sum4' : Unused code path elimination
 * Block '<S8>/Sum7' : Unused code path elimination
 */

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'lego2'
 * '<S1>'   : 'lego2/Compare To Constant'
 * '<S2>'   : 'lego2/Compare To Constant1'
 * '<S3>'   : 'lego2/Compare To Constant2'
 * '<S4>'   : 'lego2/Compare To Constant3'
 * '<S5>'   : 'lego2/Motor1'
 * '<S6>'   : 'lego2/Motor2'
 * '<S7>'   : 'lego2/Motor3'
 * '<S8>'   : 'lego2/Subsystem'
 * '<S9>'   : 'lego2/Subsystem/Compare To Constant'
 * '<S10>'  : 'lego2/Subsystem/Compare To Constant1'
 * '<S11>'  : 'lego2/Subsystem/Compare To Constant4'
 * '<S12>'  : 'lego2/Subsystem/Compare To Constant5'
 * '<S13>'  : 'lego2/Subsystem/Compare To Constant6'
 * '<S14>'  : 'lego2/Subsystem/Compare To Constant7'
 */
#endif                                 /* RTW_HEADER_lego2_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

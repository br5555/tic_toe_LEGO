/*
 * File: ert_main.c
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
#include "kernel.h"
#include "kernel_id.h"
#include "ecrobot_interface.h"
#include "ecrobot_private.h"
#include <ext_work.h>                  /* External mode header files */
#include <ext_svr.h>
#include <ext_share.h>
#include <updown.h>

int tick = 0;
double period = 0.1;
int sampleTime = 0;
int or_ext = 0;
int or_mdl = 0;
int timesup = 0;
DeclareEvent(TIMESUP);
DeclareTask(OSEK_Task_main);
DeclareTask(OSEK_Task_background);
void user_1ms_isr_type2(void)
{
  tick++;
  if (tick >= sampleTime) {
    tick = 0;
    or_ext++;
    or_mdl++;
    SetEvent(OSEK_Task_main, TIMESUP);
    timesup = 0;
  }
}

void ecrobot_device_initialize(void)
{
  int st;
  int last_act_time = 0;
  while (ecrobot_get_bt_status() != BT_STREAM) {
    st = systick_get_ms();
    if (st >= last_act_time + 10) {
      ecrobot_poll_nxtstate();
      last_act_time = st;
      ecrobot_init_bt_slave("fei");
      if (ecrobot_get_button_state() == (EXIT_PRESSED)) {
        ecrobot_device_terminate();
        display_clear(1);
        systick_wait_ms(10);
        nxt_lcd_power_down();          /* reset LCD hardware */
        systick_wait_ms(10);
        while (1) {
          nxt_avr_power_down();
        }
      }
    }
  }

  /* initialize external mode */
  rtParseArgsForExtMode(0, NULL);
  lego2_initialize();

  /* External mode */
  rtSetTFinalForExtMode(&rtmGetTFinal(lego2_M));
  rtExtModeCheckInit(2);

  {
    boolean_T rtmStopReq = false;
    rtExtModeWaitForStartPkt(lego2_M->extModeInfo, 2, &rtmStopReq);
    if (rtmStopReq) {
      rtmSetStopRequested(lego2_M, true);
    }
  }

  rtERTExtModeStartMsg();
}

TASK(OSEK_Task_main)
{
  sampleTime = (int)(period/0.001);
  display_clear(1);
  display_goto_xy(0, 2);
  display_string("I am running ...");
  display_goto_xy(0, 5);
  display_string("-----------------");
  display_goto_xy(0, 6);
  display_string("lego2");
  display_goto_xy(0, 7);
  display_string("-----------------");
  while (1) {
    WaitEvent(TIMESUP);
    ClearEvent(TIMESUP);
    lego2_output();

    /* Get model outputs here */

    /* External mode */
    rtExtModeUploadCheckTrigger(2);

    {                                  /* Sample time: [0.0s, 0.0s] */
      rtExtModeUpload(0, lego2_M->Timing.t[0]);
    }

    {                                  /* Sample time: [0.1s, 0.0s] */
      rtExtModeUpload(1, (((lego2_M->Timing.clockTick1+
                            lego2_M->Timing.clockTickH1* 4294967296.0)) * 0.1));
    }

    lego2_update();
    rtExtModeCheckEndTrigger();
    or_mdl = 0;
  }

  TerminateTask();
}

TASK(OSEK_Task_background)
{
  int status;
  int link_status = 0;
  while ((rtmGetErrorStatus(lego2_M) == (NULL)) && !rtmGetStopRequested(lego2_M))
  {
    status = ecrobot_get_bt_status();
    if (status != BT_NO_INIT && status != BT_STREAM) {
      ecrobot_term_bt_connection();
    }

    while (ecrobot_get_bt_status() != BT_STREAM) {
      if (link_status == 0) {
        display_clear(1);
      }

      ecrobot_init_bt_slave("fei");
      systick_wait_ms(1000);
      link_status = 0x55;
    }

    if (link_status == 0x55) {
      link_status = 0;
      display_clear(1);
      display_clear(1);
      display_goto_xy(0, 2);
      display_string("I am running ...");
      display_goto_xy(0, 5);
      display_string("-----------------");
      display_goto_xy(0, 6);
      display_string("lego2");
      display_goto_xy(0, 7);
      display_string("-----------------");
    }

    if (timesup == 0) {
      timesup = 1;

      /* External mode */
      {
        boolean_T rtmStopReq = false;
        rtExtModePauseIfNeeded(lego2_M->extModeInfo, 2, &rtmStopReq);
        if (rtmStopReq) {
          rtmSetStopRequested(lego2_M, true);
        }

        if (rtmGetStopRequested(lego2_M) == true) {
          rtmSetErrorStatus(lego2_M, "Simulation finished");
          break;
        }
      }

      /* External mode */
      {
        boolean_T rtmStopReq = false;
        rtExtModeOneStep(lego2_M->extModeInfo, 2, &rtmStopReq);
        if (rtmStopReq) {
          rtmSetStopRequested(lego2_M, true);
        }
      }

      or_ext = 0;
    }
  }

  /* External mode */
  rtExtModeShutdown(2);
  lego2_terminate();
  ecrobot_device_terminate();
  display_clear(1);
  systick_wait_ms(1000);
  nxt_lcd_power_down();
  systick_wait_ms(10);
  while (1) {
    nxt_avr_power_down();
  }

  TerminateTask();
}

void ecrobot_device_terminate(void)
{
  lego2_terminate();
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */

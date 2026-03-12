      ************************************
      *** SPDX-License-Identifier: MIT ***
      ************************************

      ************************************
      *** Author: Eduardo Pozos Huerta ***
      *** File:   exercise_2_u2.cbl    ***
      *** Date:   06/02/2026           ***
      *** Update: 06/02/2026           ***
      ************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN_CBL.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01 WS-ARG.
          02 WS-ARG-COUNT PIC 9(18) VALUE ZERO COMP.
          02 WS-ARG-VALUE PIC S9(3)V9(6) OCCURS 100 TIMES
          INDEXED WS-ARG-INDEX VALUE ZERO COMP-3.

       01 RESULT.
          02 RESULT-XL PIC S9(3)V9(6) VALUE ZERO COMP-3.
          02 RESULT-XR PIC S9(3)V9(6) VALUE ZERO COMP-3.
       
       01 XX.
          02 XL PIC S9(3)V9(6) VALUE ZERO COMP-3.
          02 XM PIC S9(3)V9(6) VALUE ZERO COMP-3.
          02 XR PIC S9(3)V9(6) VALUE ZERO COMP-3.
          02 XI PIC S9(3)V9(6) VALUE 1.00 COMP-3.
          02 XT PIC S9(3)V9(6) VALUE ZERO COMP-3.

       PROCEDURE DIVISION.

           ACCEPT WS-ARG-COUNT FROM ARGUMENT-NUMBER.

           PERFORM VARYING WS-ARG-INDEX FROM 1 BY 1
           
           UNTIL WS-ARG-INDEX > WS-ARG-COUNT
           
           ACCEPT WS-ARG-VALUE(WS-ARG-INDEX) FROM ARGUMENT-VALUE
           
           END-PERFORM.

           SUBTRACT WS-ARG-COUNT FROM WS-ARG-INDEX.

           MOVE WS-ARG-VALUE(WS-ARG-INDEX) TO XL.
           ADD 1 TO WS-ARG-INDEX.
           MOVE WS-ARG-VALUE(WS-ARG-INDEX) TO XM.

           PERFORM PROCESS 21 TIMES.

           DISPLAY "[" XL "," XM "]"
           
           STOP RUN.
       
        PROCESS.
           PERFORM CALC-XR.
           PERFORM CALC-FUCNTION-XL.
           PERFORM CALC-FUCNTION-XR.
           PERFORM MULTIPLY-FUNCTIONS.

           PERFORM DISPLAY-FORMULA.

           ADD 1 TO XI.

        DISPLAY-FORMULA.

           DISPLAY
           "iterator: "  XI X'0A0D'
           "f("XL") = pow(" XL ", 3) - 10("
           XL ") - 5 = " RESULT-XL X'0A0D'
           
           "f("XR") = pow(" XR ", 3) - 10("
           XR ") - 5 = " RESULT-XR X'0A0D'
           
           "f(" RESULT-XL ") * f(" RESULT-XR ") = " XT X'0A0D'
           .

           IF XT < 0
               MOVE XR TO XM
           ELSE 
               MOVE XR TO XL
           END-IF.

        CALC-XR.
           COMPUTE XR = (XL + XM) / 2.

        CALC-FUCNTION-XL.
           COMPUTE RESULT-XL = (XL ** 3) - (10 * XL) - 5.

        CALC-FUCNTION-XR.
           COMPUTE RESULT-XR = (XR ** 3) - (10 * XR) - 5.

        MULTIPLY-FUNCTIONS.
           COMPUTE XT = RESULT-XL * RESULT-XR.

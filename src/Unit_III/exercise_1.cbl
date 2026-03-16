      ************************************
      *** SPDX-License-Identifier: MIT ***
      ************************************

      ************************************
      *** Author: Eduardo Pozos Huerta ***
      *** File:   exercise_1.cbl       ***
      *** Date:   11/03/2026           ***
      *** Update: 11/03/2026           ***
      ************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXERCISE_I.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       77 WS-COUNTER  PIC 9(03) COMP VALUE ZERO.
       77 WS-ITERATOR PIC 9(03) COMP VALUE 0001.

       01 WS-XN.
          02 WS-X1 PIC S9(4)V9(5) COMP-3 VALUE ZERO.
          02 WS-X2 PIC S9(4)V9(5) COMP-3 VALUE ZERO.
          02 WS-X3 PIC S9(4)V9(5) COMP-3 VALUE ZERO.
       
       01 WS-BI.
          02 WS-B1 PIC S9(4)V9(5) COMP-3 VALUE 500.
          02 WS-B2 PIC S9(4)V9(5) COMP-3 VALUE 200.
          02 WS-B3 PIC S9(4)V9(5) COMP-3 VALUE 030.

       01 WS-AN.
          02 WS-A11 PIC S9(4)V9(5) COMP-3 VALUE 17.
          02 WS-A12 PIC S9(4)V9(5) COMP-3 VALUE -2.
          02 WS-A13 PIC S9(4)V9(5) COMP-3 VALUE -3.

          02 WS-A21 PIC S9(4)V9(5) COMP-3 VALUE -5.
          02 WS-A22 PIC S9(4)V9(5) COMP-3 VALUE 21.
          02 WS-A23 PIC S9(4)V9(5) COMP-3 VALUE -2.

          02 WS-A31 PIC S9(4)V9(5) COMP-3 VALUE -5.
          02 WS-A32 PIC S9(4)V9(5) COMP-3 VALUE -5.
          02 WS-A33 PIC S9(4)V9(5) COMP-3 VALUE 22.
       
       01 WS-RESULT.
          02 WS-TEMP1 PIC S9(4)V9(5) COMP-3 VALUE ZERO.
          02 WS-TEMP2 PIC S9(4)V9(5) COMP-3 VALUE ZERO.
          02 WS-TEMP3 PIC S9(4)V9(5) COMP-3 VALUE ZERO.


       PROCEDURE DIVISION.

           PERFORM VARYING WS-COUNTER FROM 1 BY 1
                   UNTIL WS-COUNTER > 30
           
           DISPLAY
           "Iteration -> " WS-ITERATOR X'0A' X'0A'
           "X1 = " WS-X1 "  X2  = " WS-X2 " X3  = " WS-X3 X'0A'
           "B1 = " WS-B1 "  B2  = " WS-B2 " B3  = " WS-B3 X'0A'
           "A11 = " WS-A11 " A12 = " WS-A12 " A13 = " WS-A13 X'0A'
           "A21 = " WS-A21 " A22 = " WS-A22 " A23 = " WS-A23 X'0A'
           "A31 = " WS-A31 " A32 = " WS-A32 " A33 = " WS-A33 X'0A'

           COMPUTE WS-TEMP1 = (WS-B1 - (WS-A12 * WS-X2)
                              - (WS-A13 * WS-X3)) / WS-A11

           COMPUTE WS-TEMP2 = (WS-B2 - (WS-A21 * WS-X1)
                              - (WS-A23 * WS-X3)) / WS-A22

           COMPUTE WS-TEMP3 = (WS-B3 - (WS-A31 * WS-X1)
                              - (WS-A32 * WS-X2)) / WS-A33

           DISPLAY
           "X1 = (" WS-B1 " - "
           "(" WS-A12 " * " WS-X2  ") -"
           "(" WS-A13 " * " WS-X3  ")) / " WS-A11 " = " WS-TEMP1 X'0A'

           "X2 = (" WS-B2 " - "
           "(" WS-A21 " * " WS-X1  ") -"
           "(" WS-A23 " * " WS-X3  ")) / " WS-A22 " = " WS-TEMP2 X'0A'
           
           "X3 = (" WS-B3 " - "
           "(" WS-A31 " * " WS-X1  ") -"
           "(" WS-A32 " * " WS-X2  ")) / " WS-A33 " = " WS-TEMP3 X'0A'

           MOVE WS-TEMP1 TO WS-X1
           MOVE WS-TEMP2 TO WS-X2
           MOVE WS-TEMP3 TO WS-X3

           COMPUTE WS-ITERATOR = WS-COUNTER + 1

           END-PERFORM.

           STOP RUN.

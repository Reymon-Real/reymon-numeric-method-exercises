      ************************************
      *** SPDX-License-Identifier: MIT ***
      ************************************

      ************************************
      *** Author: Eduardo Pozos Huerta ***
      *** File:   main.cbl             ***
      *** Date:   06/02/2026           ***
      *** Update: 06/02/2026           ***
      ************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN_CBL.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       77 ARRAY       PIC S9(2)V9(30) OCCURS 50 TIMES COMP-3.
       77 ARRAY-INDEX PIC 9(2)        VALUE ZERO COMP-3.
       77 RESULT      PIC S9(2)V9(30) VALUE ZERO COMP-3.
       77 TEMP        PIC S9(2)V9(30) VALUE ZERO COMP-3.

       PROCEDURE DIVISION.
          
           MOVE ZERO TO ARRAY(ARRAY-INDEX).
           PERFORM DISPLAY-FORMULA 25 TIMES.
           
           STOP RUN.
       
       DISPLAY-FORMULA.
           PERFORM CALC-FUCNTION.
           COMPUTE TEMP = ARRAY-INDEX + 1.

           DISPLAY
           "f(" RESULT ") = x" TEMP " = "
           "0.5 * Sin(" ARRAY(ARRAY-INDEX) ") + 1 = "
           RESULT
           END-DISPLAY.

           ADD 1 TO ARRAY-INDEX.
           MOVE RESULT TO ARRAY(ARRAY-INDEX).

       CALC-FUCNTION.
           COMPUTE RESULT = 0.5 * FUNCTION SIN(ARRAY(ARRAY-INDEX)) + 1.

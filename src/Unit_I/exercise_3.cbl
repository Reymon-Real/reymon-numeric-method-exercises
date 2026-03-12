      ************************************
      *** SPDX-License-Identifier: MIT ***
      ************************************

      ************************************
      *** Author: Eduardo Pozos Huerta ***
      *** File:   exercise_3_u1.cbl    ***
      *** Date:   06/02/2026           ***
      *** Update: 06/02/2026           ***
      ************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN_CBL.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01 ARRAY-TABLE.
           05 ARRAY-ITEM  PIC S9(2)V9(4) OCCURS 50 TIMES
           INDEXED BY ARRAY-INDEX COMP-3.

       77 TEMP   PIC S9(2)V9(4) VALUE ZERO COMP-3.
       77 SEED   PIC S9(2)V9(4) VALUE ZERO COMP-3.
       77 RESULT PIC S9(2)V9(4) VALUE ZERO COMP-3.

       PROCEDURE DIVISION.
          
           MOVE SEED TO ARRAY-ITEM(ARRAY-INDEX).
           PERFORM DISPLAY-FORMULA 7 TIMES.
           
           STOP RUN.
       
        DISPLAY-FORMULA.
           PERFORM CALC-FUCNTION.

           DISPLAY "g(x" ARRAY-INDEX ") = "
           "sqrt( (" ARRAY-ITEM(ARRAY-INDEX) " + 5) / 2 ) = " RESULT.

           ADD 1 TO ARRAY-INDEX.
           MOVE RESULT TO ARRAY-ITEM(ARRAY-INDEX).

        CALC-FUCNTION.
           COMPUTE RESULT = ARRAY-ITEM(ARRAY-INDEX) + 5.
           COMPUTE RESULT = RESULT / 2.
           COMPUTE RESULT = FUNCTION SQRT(RESULT).

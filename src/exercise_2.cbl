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

       01 ARRAY-TABLE.
           05 ARRAY-ITEM  PIC S9(31) OCCURS 50 TIMES
           INDEXED BY ARRAY-INDEX COMP-3.

       77 RESULT PIC S9(31) VALUE ZERO COMP-3.
       77 TEMP   PIC S9(31) VALUE ZERO COMP-3.

       PROCEDURE DIVISION.
          
           MOVE ZERO TO ARRAY-ITEM(ARRAY-INDEX).
           PERFORM DISPLAY-FORMULA 6 TIMES.
           
           STOP RUN.
       
        DISPLAY-FORMULA.
           PERFORM CALC-FUCNTION.

           DISPLAY "g(" ARRAY-ITEM(ARRAY-INDEX)
           ") = 2 * pow(" ARRAY-ITEM(ARRAY-INDEX) ", 2) - 5 = " RESULT.

           ADD 1 TO ARRAY-INDEX.
           MOVE RESULT TO ARRAY-ITEM(ARRAY-INDEX).

        CALC-FUCNTION.
           COMPUTE RESULT = ARRAY-ITEM(ARRAY-INDEX) ** 2.
           COMPUTE RESULT = 2 * RESULT.
           COMPUTE RESULT = RESULT - 5.

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

       77 WS-ARG-LENGTH PIC S9(9)  COMP.
       77 WS-ARG-VALUE  PIC X(100) OCCURS 1000 INDEXED BY WS-ARG-INDEX.
       77 WS-ARG-SAVE   PIC X(100) OCCURS 1000.

       LINKAGE SECTION.

       PROCEDURE DIVISION.

       	   PERFORM SAVE-COMMAND-LINE-ARGUMENTS.

       	   SUBTRACT WS-ARG-LENGTH FROM WS-ARG-INDEX.

       	   DISPLAY WS-ARG-LENGTH.
       	   DISPLAY WS-ARG-VALUE(WS-ARG-INDEX).
           
           STOP RUN.

       SAVE-COMMAND-LINE-ARGUMENTS.
       	   ACCEPT WS-ARG-LENGTH FROM ARGUMENT-NUMBER.

       	   PERFORM VARYING WS-ARG-INDEX FROM 1 BY 1
       	   UNTIL WS-ARG-INDEX > WS-ARG-LENGTH
       	   ACCEPT WS-ARG-VALUE(WS-ARG-INDEX) FROM ARGUMENT-VALUE
       	   END-PERFORM.

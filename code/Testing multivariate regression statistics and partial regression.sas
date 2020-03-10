DATA work.SEISHU;

  INFILE "/folders/myfolders/data/T7_1_SEISHU.dat";
  INPUT Y1 Y2 X1 X2 X3 X4 X5 X6 X7 X8;

TITLE "HW4 Q-10.17";

PROC REG;
  MODEL Y1 Y2 = X1 X2 X3 X4 X5 X6 X7 X8;
  OVERALL: MTEST /PRINT CANPRINT MSTAT = EXACT;
  PARTIAL_X7_X8: MTEST X7, X8/PRINT CANPRINT MSTAT = EXACT;
  PARTIAL_X4_X5_X6: MTEST X4, X5, X6/PRINT CANPRINT MSTAT = EXACT;
  PARTIAL_X1_X2_X3: MTEST X1, X2, X3/PRINT CANPRINT MSTAT = EXACT;
RUN;
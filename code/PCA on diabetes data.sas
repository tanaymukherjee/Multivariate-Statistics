DATA work.DIABETES;

  INFILE "/folders/myfolders/data/T3_4_DIABETES.dat";
  INPUT OBS Y1 Y2 X1 X2 X3;

TITLE "HW6 Q-12.6";

PROC PRINCOMP COV;
VAR Y1 Y2 X1 X2 X3;
RUN;

PROC PRINCOMP;
VAR Y1 Y2 X1 X2 X3;
RUN;
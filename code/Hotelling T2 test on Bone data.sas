DATA work.BONE;
  INFILE "/folders/myfolders/data/T3_6_BONE.dat";
  INPUT OBS Y1 Y2 Y3 Y4;
  
TITLE "HW2 Q-5.14 a)";

PROC IML;
  USE work.BONE;
  READ ALL VAR{Y1 Y2 Y3 Y4} INTO X;
  N = NROW(X);
  RESET PRINT;
  MU = {48, 49, 50, 51};
  XBAR = 1/N*X`*J(N,1);
  S = 1/(N-1)*X`*(I(N)-1/N*J(N))*X;
  T2 = N*(XBAR-MU)`*INV(S)*(XBAR-MU);
RUN;
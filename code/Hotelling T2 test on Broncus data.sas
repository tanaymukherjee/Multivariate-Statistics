DATA work.BRONCUS;

  INFILE "/folders/myfolders/data/T5_10_BRONCUS.dat";
  INPUT Y1 Y2 X1 X2;
  
TITLE "HW2 Q-5.22";

PROC IML;
  USE work.BRONCUS;
  READ ALL VAR {Y1 Y2} INTO Y;
  READ ALL VAR {X1 X2} INTO X;
  RESET PRINT;
  D = Y - X;
  N = NROW(D);
  MU = {0, 0};
  DBAR = 1/N*D`*J(N,1);
  S = 1/(N-1)*D`*(I(N)-1/N*J(N))*D;
  T2 = N*(DBAR-MU)`*INV(S)*(DBAR-MU);
RUN;

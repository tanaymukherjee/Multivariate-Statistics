TITLE "HW2 Q-5.11";

PROC IML;
  RESET PRINT;
  X = {3 10, 6 12, 5 14, 10 9};
  N = NROW(X);
  MU = {6, 11};
  XBAR = 1/N*X`*J(N,1);
  S = 1/(N-1)*X`*(I(N)-1/N*J(N))*X;
  T2 = N*(XBAR-MU)`*INV(S)*(XBAR-MU);
RUN;
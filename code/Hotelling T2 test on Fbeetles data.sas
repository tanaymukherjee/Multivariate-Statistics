DATA work.FBEETLES;

  INFILE "/folders/myfolders/data/T5_5_FBEETLES.dat";
  INPUT OBS SPEC Y1 Y2 Y3 Y4;
  
TITLE "HW2 Q-5.16 a)";

PROC IML;
  USE work.FBEETLES;
  READ ALL VAR {Y1 Y2 Y3 Y4} INTO X;
  X1 = X[1:19,];
  X2 = X[20:39,];
  RESET PRINT;
  N1 = NROW(X1);
  N2 = NROW(X2);
  X1BAR = 1/N1*X1`*J(N1,1);
  X2BAR = 1/N2*X2`*J(N2,1);
  S1 = 1/(N1-1)*X1`*(I(N1)-1/N1*J(N1))*X1; 
  S2 = 1/(N2-1)*X2`*(I(N2)-1/N2*J(N2))*X2;    
  Spl = 1/(N1+N2-2)*((N1-1)*S1+(N2-1)*S2);     
  T2 = N1*N2/(N1+N2)*(X1BAR-X2BAR)`*INV(Spl)*(X1BAR-X2BAR);
RUN;
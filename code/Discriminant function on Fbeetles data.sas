DATA work.FBEETLES;

  INFILE "/folders/myfolders/data/T5_5_FBEETLES.dat";
  INPUT NUM TYPE Y1 Y2 Y3 Y4;
  
TITLE "HW5 Q-8.8";

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
  
  T1 = (X1BAR[1]-X2BAR[1])/SQRT(Spl[1,1]*(1/n1+1/n2));
  T2 = (X1BAR[2]-X2BAR[2])/SQRT(Spl[2,2]*(1/n1+1/n2));
  T3 = (X1BAR[3]-X2BAR[3])/SQRT(Spl[3,3]*(1/n1+1/n2));
  T4 = (X1BAR[4]-X2BAR[4])/SQRT(Spl[4,4]*(1/n1+1/n2));

  a = INV(Spl)*(X1BAR-X2BAR);
  as=J(4,1);

  as[1]=SQRT(Spl[1,1])*a[1];	
  as[2]=SQRT(Spl[2,2])*a[2];	
  as[3]=SQRT(Spl[3,3])*a[3];	
  as[4]=SQRT(Spl[4,4])*a[4];	

  z1 = a`*X1`;
  z1 = z1`;
  z2 = a`*X2`;
  z2 = z2`;
  PRINT X1BAR,X2BAR,Spl,T1,T2,T3,T4,a,as,z1,z2;

RUN;
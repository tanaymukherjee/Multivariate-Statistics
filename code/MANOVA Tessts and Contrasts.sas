DATA work.FISH;

  INFILE "/folders/myfolders/data/T6_17_FISH.dat";
  INPUT METHOD AROMA FLAVOR TEXTURE MOISTURE;
  
TITLE "HW3 Q-6.27";

PROC GLM;
  CLASS METHOD;
  MODEL AROMA FLAVOR TEXTURE MOISTURE = METHOD;
  CONTRAST 'One - Two Vs Three'
    METHOD .5 .5 -1;
  CONTRAST 'One vs Two'
    METHOD 1 -1 0;
  MANOVA H=METHOD/PRINTE PRINTH;
RUN;
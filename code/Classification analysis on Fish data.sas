DATA work.FISH;

  INFILE "/folders/myfolders/data/T6_17_FISH.dat";
  INPUT METHOD AROMA FLAVOR TEXTURE MOISTURE;
RUN;

TITLE "HW5 Q-9.10";

proc discrim data=FISH outstat=ftstat
method=NORMAL pool=yes list crossvalidate;
class METHOD;
var AROMA FLAVOR TEXTURE MOISTURE;

proc discrim data=FISH outstat=ftstat
method=NORMAL pool=no list crossvalidate;
class METHOD;
var AROMA FLAVOR TEXTURE MOISTURE;

proc discrim data=FISH outstat=ftstat
method=npar k=5 pool=yes list crossvalidate;
class METHOD;
var AROMA FLAVOR TEXTURE MOISTURE;

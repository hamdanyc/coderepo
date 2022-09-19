#! /bin/awk
# keyword.awk

BEGIN {
  keyw[1]="relation"; keyw[2]="conflict"; keyw[3]="border"; keyw[4]="leader"; keyw[5]="immigrant";
  keyw[6]="issue"; keyw[7]="peace"; keyw[8]="policy"; keyw[9]="diplomacy"; keyw[10]="president";
  keyw[11]="prime minister"; keyw[12]="problem"; keyw[13]="analysis"; keyw[14]="social";
  keyw[15]="politic"; keyw[16]="economic";
  IGNORECASE=1; ORS = " ";
  };
FNR ==1 {print "=== Keywords:",keyw[1]","keyw[2]","keyw[3]"...,"keyw[12],"Source:",FILENAME "\n"};
FNR <=3 {print};
{ # main rtn
for (i in keyw)
   if ($0 ~ keyw[i]) # keyword matched 
   {
  	  tot[i]++
      print "\n" keyw[i] ":: " $0;
      i=1;
	  j=1;
      while ($1 == $1) # in para
      {
        getline; # next rec/line
	     i++;
        if ($0 != "") # NR !=0  -- not empty
        {
 	      if ($0 ~ /.\./) j++; # end para.
            {
                gsub("[ ]+"," ",$0)
                print $0;
            }
        }
	    if (j==5 || i==9) break; # end para reached or max line=9
      }
        print "\n";
   }
} # end main
END { ORS = "\n";
  print "\n";
  print "Keyword","Count\n";
  print keyw[1],tot[1];
  print keyw[2],tot[2];
  print keyw[3],tot[3];
  print keyw[4],tot[4];
  print keyw[5],tot[5];
  print keyw[6],tot[6];
  print keyw[7],tot[7];
  print keyw[8],tot[8];
  print keyw[9],tot[9];
  print keyw[10],tot[10];
  print keyw[11],tot[11];
  print keyw[12],tot[12];
  print keyw[13],tot[13];
  print keyw[14],tot[14];
  print keyw[15],tot[15];
  print keyw[16],tot[16];
}

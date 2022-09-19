# keyword_idx.awk
#! /bin/awk

BEGIN {
  keyw[1]="relation"; keyw[2]="conflict"; keyw[3]="border"; keyw[4]="leader"; keyw[5]="immigrant";
  keyw[6]="issue"; keyw[7]="peace"; keyw[8]="policy"; keyw[9]="diplomacy"; keyw[10]="president";
  keyw[11]="prime minister"; keyw[12]="problem"; keyw[13]="analysis"; keyw[14]="social";
  keyw[15]="politic"; keyw[16]="economic";
  w[1]=1; w[2]=1; w[3]=1; w[4]=0.5; w[5]=1;
  w[6]=0.7; w[7]=0.5; w[8]=0.5; w[9]=0.5; w[10]=0.2; w[11]=0.2;
  w[12]=0.7; w[13]=0.7; w[14]=0.5; w[15]=0.5; w[16]=0.5;
  sum_prod = 0;
  flag = 0;
  IGNORECASE=1; ORS = " ";
  };
FNR ==1 {print "=== Keywords:",keyw[1]","keyw[2]","keyw[3]"...,"keyw[16],"Source:",FILENAME "\n"};
FNR <=3 {print};
# main rtn
{
if ($0 ~ /references/ || $0 ~ /bibliography/) flag = 1 # ref/bib page reached
for (i in keyw)
   if ($0 ~ keyw[i] && flag == 0) # keyword matched && ref/bib page not reached
   {
      tot[i]++
      print "\n" keyw[i] ":: " $0;
      i = j = 1;
      # if (flag == 1) next
      while ($1 == $1) # in para
      {
        getline; # next rec/line
	    i++;
        if ($0 != "") # NR !=0  -- not empty
        {
 	      if ($0 ~ /.\./) j++; # end para.
            {
                gsub("[ ]+"," ",$0) # replace extra white space
                print $0;
            }
        }
	    if (j==5 || i==9) break; # end para reached or max line=9
      }
    print "\n";
    # if (flag == 1) next
   }
} # end main
END { ORS = "\n";
# calc sum_prod idx
 for (i=1; i<=16; i++) sum_prod += tot[i]*w[i];
 if (sum_prod > 49 ) idx = "High"
 else
    if (sum_prod > 19 && sum_prod <= 49) idx = "Mid"
    else
  	    if (sum_prod <= 19) idx = "Low"

  print "\n";
  print "Keyword","Count\n";
  for (i in keyw)
    print keyw[i],tot[i];
  print "Doc. Index:", idx,"("sum_prod")" ;
}

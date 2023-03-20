#!/usr/bin/awk -f

@include "min_lib.awk"
# "fo hr fb kitchen steward security purchase maint aset it hk sales finance gm control"
BEGIN {
 dept[1] = "front office"; dept[2] = "hr"; dept[3] = "f&b"; dept[4] = "kitchen"; dept[5] = "steward"
 dept[6] = "security"; dept[7] = "purchasing"; dept[8] = "maintenance"; dept[9] = "asset"; dept[10] = "\bit\b"
 dept[11] = "house keeping"; dept[12] = "sales"; dept[13] = "finance"; dept[14] = "gm"; dept[15] = "pengurus"
 i = 0
 IGNORECASE = 1
 print "Dept#",toupper(dept[1])
}
{
  rep_with()
  if (!/^[0-9]{2}:[0-9]{2}/) {  # remove time stamp & word < 2
   {
     for (i = 1; i < 16; i++)
       if ($0 ~ dept[i]) print "\nDept#",toupper(dept[i])
   }
   print $0
   {

  for (i = 1; i <= NF; i++)
       if ($i ~ /[0-9]+$/) {
          k = index($i,".")
          j = substr($i,1,k-1)
          if (j != "") print "-->",$i,toupper(dept[j])
       }
   } # for loop
  }
} # main

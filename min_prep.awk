#!/usr/bin/awk -f

@include "min_lib.awk"
# "fo hr fb kitchen steward security purchase maint aset it hk sales finance gm control"
BEGIN {
 dept[1] = "front office"; dept[2] = "hr"; dept[3] = "f\&b"; dept[4] = "kitchen"; dept[5] = "steward"
 dept[6] = "security"; dept[7] = "purchasing"; dept[8] = "maintenance"; dept[9] = "aset"; dept[10] = "\bit\b"
 dept[11] = "house keeping"; dept[12] = "sales"; dept[13] = "finance"; dept[14] = "gm"; dept[15] = "pengurus"
 i = 0
 IGNORECASE = 1
}
{
  rep_with()
  print $0
  for ( i in dept) {
    if ($0 ~ dept[i]) print "dept#",i,toupper(dept[i])
    # if ($0 ~ /w[0-9]{1}\./) print "dept#",i,toupper(dept[i])
  }
}

#!/usr/bin/awk -f

@include "min_lib.awk"
# "fo hr fb kitchen steward security purchase maint aset it hk sales finance gm control"
BEGIN {
 dept[1] = "front office"; dept[2] = "hr"; dept[3] = "f\&b"; dept[4] = "kitchen"; dept[5] = "steward"
 dept[6] = "security"; dept[7] = "purchasing"; dept[8] = "maintenance"; dept[9] = "aset"; dept[10] = "\bit\b"
 dept[11] = "house keeping"; dept[12] = "sales"; dept[13] = "finance"; dept[14] = "gm"; dept[15] = "pengurus"
 i = 0
 IGNORECASE = 1
 print "Dept#",toupper(dept[1])
}
{
  rep_with()
  if (!/^[0-9]{2}:[0-9]{2}/) { # remove time stamp & word < 2
  if (NF >= 1) 
    print $0
  else; if (/[0-9]{1}\.[0-9]|tangguh|selesai|kekal|progress|remove|remain|done|settle|keluar/) print $0
  }

  for ( i in dept) {
    if ($0 ~ dept[i]) print "\n\nDept#",i,toupper(dept[i])
  }

  if ($1 ~ /^[0-9]{1}\.[0-9]/) {
     i = index($1,".")
     j = substr($1,1,i-1)
     print "Dept#", toupper(dept[j]),"\n"
  }
  if ($1 ~ /^[0-9]{2}\.[0-9]/) {
     i = index($1,".")
     j = substr($1,1,i-1)
     if (j <= 15) print "Dept#", toupper(dept[j]),"\n"
  }
}

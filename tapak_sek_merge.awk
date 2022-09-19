#! /usr/bin/awk
# ~/Documents/awk_script/tapak_sek_merge.awk

BEGIN {FS=","
   {print "KOD SEKOLAH" "," "NAMA SEKOLAH" "," "NO.FAIL LAMA" "," "NO.FAIL MYETAPP" "," "NO. LOT" "," "NO. PT"}
};
NR==FNR {a[$1] = $2; next};
{print a[$1] "," $1 "," $2 "," $3 "," $4 "," $5 "," $6 "," $7}

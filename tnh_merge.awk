#! /usr/bin/awk
# ~/Documents/awk_script/tnh_merge.awk

BEGIN {FS=","
   {print "KOD SEKOLAH" "," "NAMA SEKOLAH" "," "MUKIM" "," "DAERAH" "," "NEGERI" "," "LONGITUD" "," "LATITUD" "," "," "MUKIM" "," "DAERAH" "," "NEGERI" "," "NO.FAIL LAMA" "," "NO.FAIL MYETAPP" "," "NO.LOT" "," "NO.PT"}
};
NR==FNR {a[$1] = $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $8; next};
{print $2 "," $1 "," $3 "," $4 "," $5 "," $6 "," $7 "," a[$1]}


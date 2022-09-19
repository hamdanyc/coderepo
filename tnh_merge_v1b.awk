#! /usr/bin/awk
# ~/Documents/awk_script/tnh_merge_v1b.awk
# step 2:  join "ruj_sek_2021" with "pemutihan" (~/Documents/awk_script/tnh_step2a.sh)
# source: Documents/tanah/data/proses/nota.txt  target: ~/Documents/tanah/data/nota_all.txt
# index: kod_sek

BEGIN {FS=","
   {print "KOD SEKOLAH" "," "NAMA SEKOLAH" "," "NOTA 1" "," "NOTA 2" "," "NOTA 3" "," "NOTA 4"}
 }
NR==FNR {a[$2] = $1 "," $3 "," $4; next};
{print $2 "," $1 "," a[$2]}

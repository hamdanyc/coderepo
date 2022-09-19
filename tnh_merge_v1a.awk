#! /usr/bin/awk
# ~/Documents/awk_script/tnh_merge_v1a.awk
# step 2:  join "ruj_sek_2021" with "pemutihan" (~/Documents/awk_script/tnh_step2a.sh)
# source: Documents/tanah/data/proses/putih_all.txt  target: ~/Documents/tanah/data/ruj_sek_2021.txt
# index: kod_sek

BEGIN {FS=","
   {print "KOD SEKOLAH" "," "NAMA SEKOLAH" "," "LONGITUD" "," "LATITUD" "," "NEGERI" "," "DAERAH" "," "MUKIM"  ","  "STATUS_TNH(PTP/KN/FELDA/ASLI/NCR/OP/WARTA/IND)" ","  "NO_FAIL" "," "FAIL_KPM" "," "NO_HAK_MILIK" "," "KATEGORI_PROJEK(PEMUTIHAN/RMK/DAIF)" "," "NO PT"  "NO_LOT" "," "KELUASAN_(H)" "," "TKH_GERAN" "," "PELAN_PA" "," "STATUS_PROJEK" "," "CATATAN_PROSES"}
 }
NR==FNR {a[$1] = $2 "," $3 ",," $4 "," $5 "," $6 ",," $7 "," $9 "," $10"," $12 ",,,"; next};
{print $2 "," $1 "," $6 "," $7 "," $5"," a[$1]}

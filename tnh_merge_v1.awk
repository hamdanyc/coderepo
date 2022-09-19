#! /usr/bin/awk
# ~/Documents/awk_script/tnh_merge_v1.awk
# step 2:  join "ruj_sek_2021" with "pemutihan" (~/Documents/awk_script/tnh_step2a.sh)
# source: Documents/tanah/data/proses/putih_all.txt  target: ~/Documents/tanah/data/ruj_sek_2021.txt
# index: kod_sek

BEGIN {FS=","
   {print "KOD SEKOLAH" "," "NAMA SEKOLAH" "," "LONGITUD" "," "LATITUD" "," "NEGERI" "," "DAERAH" "," "MUKIM"  ","  "STATUS TNH(PTP/KN/FELDA/ASLI/NCR/OP/WARTA/IND)" ","  "NO.HAK MILIK" "," "KATEGORI PROJEK(PEMUTIHAN/RMK/DAIF)" "," "NO LOT/PT"  "NO. HAKMILIK" "," "LUAS (H)" "," "PELAN PA" "," "STATUS PROJEK" "," "CATATAN PROSES"}
 }
NR==FNR {a[$2]= $8 "," $9 "," $6 "," $10 "," "PEMUTIHAN" "," $11"," substr($12,1,4) "," $20 "," $37 ; next};
{print $2 "," $1 "," $6 "," $7 "," $5"," a[$2]}

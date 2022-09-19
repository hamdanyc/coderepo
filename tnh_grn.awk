#! usr/bin/awk
# ~/Documents/awk_script/tnh_grn.awk
# extract project from tapak 
BEGIN {FS=","}
     {
#    sub(/SEKOLAH DI/,"",$8)
#    sub(/SEKOLAH KEBANGSAAN/,"SK",$8)
#    sub(/SEKOLAH JENIS KEBANGSAAN TAMIL/,"SJK(T)",$8)
#    sub(/SEKOLAH JENIS KEBANGSAAN CINA/,"SJK(C)",$8)
#    sub(/SJKC/,"SJK(C)",$8)
#    sub(/SJKT/,"SJK(T)",$8)
#    sub(/SMKA/,"SMA",$8)
#    sub(/SEKOLAH MENENGAH TEKNIK/,"SMT",$8)
#    sub(/SEKOLAH MENENGAH/,"SMK",$8)
#    sub(/SEKOLAH MENENGAH SAINS/,"SMS",$8)
#    sub(/SMK SAINS/,"SMS",$8)
#    sub(/SEKOLAH MENENGAH AGAMA/,"SMA",$8)
#    sub(/SEKOLAH MENENGAH KEBANGSAAN/,"SMK",$8)
#    sub(/SMK KEBANGSAAN/,"SMK",$8)
#    sub(/SMK AGAMA/,"SMA",$8)
#    sub(/\(SJK\(T\)\) LADANG/,"LDG.",$8)
#    sub(/DI DAERAH/,"",$8)
#    sub(/DAERAH/,"",$8)
#    sub(/KAMPUNG/,"KG.",$8)
#    sub(/DI WILAYAH/,",WILAYAH ",$8)
    sub(/TAPAK/,"",$8)
    sub(/(TAMB)AHAN/,"",$8)
#    sub(/ /,"",$8)
}
    $8 ~ "SEK.|SEKOLAH|KOLEJ|SRK|SK|SM|SMK|KEBANGSAAN|VOKASIONAL|TEKNIK|SMS" {
    if(index($8,"SEK.") != 0)  str = substr($8,index($8,"SEK."),length($8))
    else if(index($8,"SM") != 0) str = substr($8,index($8,"SM"),length($8))
    else if(index($8,"SMK") != 0) str = substr($8,index($8,"SMK"),length($8))
    else if(index($8,"SMS") != 0) str = substr($8,index($8,"SMS"),length($8))
    else if(index($8,"SK") != 0) str = substr($8,index($8,"SEKOLAH"),length($8))
    else if(index($8,"KEBANGSAAN") != 0) str = substr($8,index($8,"KEBANGSAAN"),length($8))
    else if(index($8,"SEKOLAH") != 0) str = substr($8,index($8,"SEKOLAH"),length($8))
    else if(index($8,"KOLEJ") != 0) str = substr($8,index($8,"SEKOLAH"),length($8))
    else if(index($8,"VOKASIONAL") != 0) str = substr($8,index($8,"VOKASIONAL"),length($8))
    else if(index($8,"TEKNIK") != 0) str = substr($8,index($8,"TEKNIK"),length($8))
    print(str "," $2 "," $3 "," $4 "," $5 "," $6 "," $7 "," $9 "," $10 "," $11 )
}

# run this
# awk -f ~/Documents/awk_script/tnh_rmk.awk rmk.csv > daif_rmk_mod.csv
# sed -i -f ~/Documents/awk_script/tnh_proses.sed daif_rmk_mod.csv
# awk -F"," '{i=index($3,"("); if(i != 0) print substr($3,i+1,7) "," $2 "," substr($3,1,i-1) "," $1 ; else print ",," $2 ","  $3 "," $1} ' daif_rmk_mod.csv > daif_rmk.csv
# awk -F"," 'NF==1 || NF<=10 {i = NF; while (i <= 10) {p=$0; i=i+NF} print p "," $0}' geran_neg.csv
# awk -F"," 'NF<=10 {i = NF; while (i <= 10) {p=$0; i=i+NF}; getline; print p "," $0}' geran_neg.csv | sed -f ~/Documents/awk_script/tnh_proses.sed | awk -F"," '$1 !~ /[A-Z]/ && NF>5 {print}'
# awk -F"," 'NF==11 {print $0}' geran_neg.csv | sed -f ~/Documents/awk_script/tnh_proses.sed | awk -F"," '$1 ~ /[0-9]/ {print}'

#! usr/bin/awk
# extract project from tapak 
BEGIN {FS="|"}
    $4 ~ "SK|SMK|SJK|SEKOLAH" {
    sub(/SEKOLAH DI/,"",$4)
    sub(/SEKOLAH KEBANGSAAN/,"SK",$4)
    sub(/SEKOLAH JENIS KEBANGSAAN TAMIL/,"SJK(T)",$4)
    sub(/SEKOLAH JENIS KEBANGSAAN CINA/,"SJK(C)",$4)
    sub(/SJKC/,"SJK(C)",$4)
    sub(/SJKT/,"SJK(T)",$4)
    sub(/SMKA/,"SMA",$4)
    sub(/SEKOLAH MENENGAH TEKNIK/,"SMT",$4)
    sub(/SEKOLAH MENENGAH/,"SMK",$4)
    sub(/SEKOLAH MENENGAH SAINS/,"SMS",$4)
    sub(/SMK SAINS/,"SMS",$4)
    sub(/SEKOLAH MENENGAH AGAMA/,"SMA",$4)
    sub(/SEKOLAH MENENGAH KEBANGSAAN/,"SMK",$4)
    sub(/SMK KEBANGSAAN/,"SMK",$4)
    sub(/SMK AGAMA/,"SMA",$4)
    sub(/\(SJK\(T\)\) LADANG/,"LDG.",$4)
    sub(/DI DAERAH/,"",$4)
    sub(/DAERAH/,"",$4)
    sub(/KAMPUNG/,"KG.",$4)
    sub(/DI WILAYAH/,",WILAYAH ",$4)
    sub(/ /,"",$4)
}
    $4 ~ "SM|SK|SMK|SMT|SMV|SJK|SEKOLAH|KOLEJ" && $4 ~ /DAIF/ {
    if(index($4,"SK") != 0)  print "DAIF," substr($4,index($4,"SK"),length($4))
    else if(index($4,"SMK") != 0) print "DAIF," substr($4,index($4,"SMK"),length($4))
    else if(index($4,"SJK") != 0) print "DAIF," substr($4,index($4,"SJK"),length($4))
    else if(index($4,"SEKOLAH") != 0) print "DAIF," substr($4,index($4,"SEKOLAH"),length($4))
}
    $4 ~ "SM|SK|SMK|SMT|SMV|SJK|SEKOLAH|KOLEJ" && $4 !~ /DAIF/ {
    if(index($4,"SK") != 0)  print "RMK," substr($4,index($4,"SK"),length($4))
    else if(index($4,"SMK") != 0) print "RMK," substr($4,index($4,"SMK"),length($4))
    else if(index($4,"SJK") != 0) print "RMK," substr($4,index($4,"SJK"),length($4))
    else if(index($4,"SEKOLAH") != 0) print "RMK," substr($4,index($4,"SEKOLAH"),length($4))
}

# run this
# awk -f ~/Documents/awk_script/tnh_rmk.awk rmk.csv > daif_rmk_mod.csv
# sed -i -f ~/Documents/awk_script/tnh_proses.sed daif_rmk_mod.csv
# awk -F"," '{i=index($3,"("); if(i != 0) print substr($3,i+1,7) "," $2 "," substr($3,1,i-1) "," $1 ; else print ",," $2 ","  $3 "," $1} ' daif_rmk_mod.csv > daif_rmk.csv

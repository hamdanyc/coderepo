# awk -F"," 'NR==FNR{a[$1]=$2;next}{if (a[$1])print a[$1],$0;else print "Not Found", $0;}' OFS=";"  /Documents/tanah/data/tapak/sabah.csv  awk -F, 'FNR==NR {lines[$5]; next} $2 in lines' ~/Documents/tanah/data/tapak/sabah.csv  ~/Documents/tanah/data/proses/sabah.csv
awk "NR==FNR{a[$5]=$3;next} a[$1]{print a[$1],$0}" ~/Documents/tanah/data/tapak/sabah.csv  ~/Documents/tanah/data/proses/sabah.csv
awk -F "," '$3 !~ /^$/ {print $3}' ~/Documents/tanah/data/proses/sabah.csv > ~/Documents/tanah/data/proses/sabah.txt
awk -F "," '$6 !~ /^$/ {print $6}' ~/Documents/tanah/data/tapak/sabah.csv > ~/Documents/tanah/data/tapak/sabah.txt
sed -e 's/SEKOLAH KEBANGSAAN/SK/s' -e 's/SEKOLAH MENENGAH KEBANGSAAN/SMK/s' -e 's/PEJABAT PENDIDIKAN DAERAH/PPD/s' ~/Documents/tanah/data/proses/sabah.txt


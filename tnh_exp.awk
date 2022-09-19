awk -F"," 'NR<=5 {print NR,NF}' grn_neg.csv
awk -F"," 'BEGIN{OFS=","};NR<=10 {if(NF!=2) for(i=1;i<=NF;i++) print NR,i,$i}' grn_neg.csv
awk -F"," 'NR<50 && !(NR%2){print $0,p} {p=$0}' grn_neg.csv
awk -F"," 'BEGIN{i=1};{tot[NF]++};END{for(i=1;i<=15;i++) print i,tot[i]}' grn_neg.csv

1 1214
2 2811
3 3900
4 175
5 87
6 251
7 713
8 2699
9 812
10 1573
11 199
12 59
13 
14 
15 

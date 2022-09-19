#! usr/binawk
# ~/Documents/awk_script/tnh_grn_ext.awk

BEGIN {FS=","}
# Main
# j=NF
# nf[j]++
{
if (NF<=10) {
#    j=NF
#    nf[j]++

   i = NF 
   while (i <= 10)
    {
        p = $0
        getline
        print p " " $0
        i = i+NF
    }
} else  print
}

END {
# for (j in nf) print j "=" nf[j]
} 
# $1 !~ /[A-Z]/ && NF>5 {print}


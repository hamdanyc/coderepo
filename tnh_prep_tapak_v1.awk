#! /usr/bin/awk
# tnh_prep_tapak_v1.awk
# step 1

BEGIN {FS=","} 
$6 !~ /^$/ && NR > 15 {print $6 "," $4 "," $5 "," $41 "," $45}

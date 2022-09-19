#! /bin/awk

BEGIN{FS=OFS="|"}

{
  if ($4 ~ /sinarharian/)
     $1 = "sinarharian"
  else  if ($4 ~ /theborneopost/)
     $1 = "borneopost"
  else  if ($4 ~ /harakahdaily/)
     $1 = "harakah"
  else  if ($4 ~ /umnoonline/)
     $1 = "umnoonline"
  if ($4 ~ /sarawakvoice/)
     $1 = "sarawakvoice"
  else  if ($4 ~ /themalaymailonline/)
     $1 = "themalaymailonline"
  else  if ($4 ~ /utusan/)
     $1 = "utusan"
  else  if ($4 ~ /theedge/)
     $1 = "theedge"
  if ($4 ~ /[0-9]+\/[0-9]+\/[0-9]+/)
     $2= substr($4,31,10)
  if ($5 ~ /[0-9]+\/[0-9]+\/[0-9]+/)
  {
     i = match($5,/[0-9]+\/[0-9]+\/[0-9]+/)
     split(substr($5,i,i+10),tmp,"/")
     # $2 = substr($5,i,i+10)
     $2 = substr(tmp[3],1,4)"/"tmp[2]"/"tmp[1]
  }
  if($1 != "NA" || $2 != "NA") {print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}
}

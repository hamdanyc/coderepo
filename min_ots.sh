#! /usr/bin/sh
# summarise each files
rm *.srt
FILES="fo hr fb kitchen steward security purchase maint aset it hk sales finance gm control"
FS="fo.srt hr.srt fb.srt kitchen.srt steward.srt security.srt purchase.srt maint.srt aset.srt it.srt hk.srt sales.srt finance.srt gm.srt control.srt"
for f in $FILES
do
  echo "summarise $f file..."
  # ref to minit's para (insert)
  awk 'FNR==1 {print "\nDept:"toupper(FILENAME)}; /[0-9]{1}\.[0-9]/ || /tangguh/ || /selesai/ || /staf/ || /kekal/ || /progress/ {print $0}' "$f" > "$f.srt"
  # take action on each file. $f store current file name
  ots "$f" >> "$f.srt"
done
cat $FS > minit.txt

BEGIN {
    NR != 1 & NF == 10
}
{ printf("INSERT INTO text (src,datePub,headlines,newslink,article,negative,positive,sentiment,kategori,tag) VALUES('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s');\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10); }

#! /usr/bin/awk
# biblio.awk
# Pre proc ref.txt -- awk 'FNR == 1 {print "==="};FNR <= 20 {print}' *.pdf.txt > ref.txt
#      change CAP to  lower -- sed -i 's/\w\+/\L\u&/g' ref.txt

BEGIN {FS="[><]"
fld["author"] = "author"; fld["editor"] = "editor";
fld["writer"] = "writer"; fld["year"] = "year";
fld["title"] = "title"; fld["name"] = "name";
fld["pub"] = "pub"; fld["vol"] = "vol";
fld["place"] = "place"; fld["type"] = "type";
}
# type; fields entry
# article; author, title, journal, year, vol
# book;    author/editor, title, publisher, year
# conf;    author, title, booktitle, year
# thesis;  author, title, school, year
# misc;    author, title, year
# booklet; author, title, booktitle, year

# main
{
for (i in fld) { # every tag
    if ($0 ~ fld[i]) tag[i] = $3 # entry value
    # set entry type
    if (tag["type"] != "") type = tag["type"]

    if (tag["author"] == "") author = "Anonymous"
    else
        if (tag["editor"] == "" || tag["writer"] == "") author = tag["author"]
    else
        if (tag["editor"] != "" && tag["writer"] == "" ) author = tag["author"]", "tag["editor"]
    else
        if (tag["writer"] != "") author = tag["author"]", "tag["editor"]", "tag["writer"]
    }

    if ($0 ~ /===/) { # rec changed
    j++
    if (out == "lst") print author", ", "("tag["year"]").", "\""tag["title"]"\".",tag["name"]": "tag["vol"]".", tag["place"]".", tag["pub"]".\n";
    else
    print "@"type"{"substr(author,1,3)j",\n","title={"tag["title"]"},\n","author={"author"},\n","name={"tag["name"]"},\n",
        "volume={"tag["vol"]"},\n","year={"tag["year"]"},\n","publisher={"tag["pub"]"},\n}\n"
    for (i in fld) tag[i] = ""; # init arrays
 }
}

#@article{md2012managing,
#  title={Managing Malaysia--Indonesia relations in the context of democratization: the emergence of non-state actors},
#  author={Md. Khalid, Khadijah and Yacob, Shakila},
#  journal={International Relations of the Asia-Pacific},
#  volume={12},
#  number={3},
#  pages={355--387},
#  year={2012},
#  publisher={Oxford University Press}
#}

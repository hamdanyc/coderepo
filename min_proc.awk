#!/usr/bin/awk -f

@include "min_lib.awk"
BEGIN {
 i = 0
 IGNORECASE = 1
}
{
  if (!/^[0-9]{2}:[0-9]{2}/) { # remove time stamp
    print $0
  if ($1 != "#" && NF > 2) print $0
  rep_with()
  if ($1 == "#") { # split file at the marker & write
    i = i + 1
    x = $2
    next
 }
  print > x
 }
}

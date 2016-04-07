#!/bin/awk -f
# or try 
#  awk -f calc.awk data/actors-utf8.list | sort -rn >actors.csv
BEGIN {
  FS = "\t"
  OFS = ","
  MIN_ROLES = 33
  MIN_SELF = 33
  MIN_RECENT =50
  ch = ""
  n = 0  # appearances
  a = 0  # acting
  s = 0  # self
  r = 0
  print "1.0", "Name", "As self", "As role"
}


{
  # Blank line, switching
  if($0 ~ /^\s*$/) {
      if (ch && a >= MIN_ROLES && s >= MIN_SELF && r >= MIN_RECENT) print s/(s+a), "\"" ch "\"", s, a
  } else {
    n += 1
    if(length($1) > 2)  {
      n = 0
      s = 0
      r = 0
      a = 0
      ch = $1
    }
  }
}

# If it's within the 21st century, let's count it.
/\(20/ { r += 1 }

# If it lists a role, let's count it.
/\[/ {
    if($0 ~ /\[Themselv|\[Himsel?f|\[Host|\(archive footage|\[Themse/) { s += 1 } else { a += 1 }
}

END {
    print n, ch
}


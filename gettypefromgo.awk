BEGIN { start = 0 }
{ if ($1 == "type" && $NF == "{"){
    start = 1
    print "Line:" NR
  }
  if (start == 1){
    print $0
    if ($1 == "}"){
      start = 0
    }    
  }
}

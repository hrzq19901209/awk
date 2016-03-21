BEGIN { start = 0 
	line[0] = "//"
        num = 0
      }
{ 
  if ($1 == "//"){
    num++
    line[num] = $0
  }
  if ($1 != "//"){
    if($1 == "type" && $NF == "{"){
      #OK,wthat the line stores is the commets of the current type,print them.
      i = 1
      while(i <= num){
        print line[i]
	i++
      }
      #OK,all of the current type's comments have been printed,reset the line,num = 0
      num = 0
    }else{
      #OK,wthat the line stores is not the commets of the current type,clear them,num = 0
      num = 0
    }
  }
  if ($1 == "type" && $NF == "{"){
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

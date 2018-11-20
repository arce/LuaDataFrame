require "dataFrame"

n = c{2, 3, 5}
s = c{"aa", "bb", "cc"}
b = c{true, false, true}

dfrm1 = dataFrame{NUMBER=n,STRING=s,BOOLEAN=b}
 
printDataFrame(dfrm1)

print()

dfrm2 = readCSV("data.csv", true, ",")

printDataFrame(dfrm2)

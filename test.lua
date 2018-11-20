require "dataFrame"

n = c{2, 3, 5}
s = c{"aa", "bb", "cc"}
b = c{true, false, true}

dfrm1 = dataFrame{numbers=n,strings=s,booleans=b}

printDataFrame(dfrm1)

print()

dfrm2 = dataFrame("Test2")
dfrm2['numbers'] = n
dfrm2['strings'] = s
dfrm2['booleans'] = b
 
printDataFrame(dfrm2)

print()

dfrm3 = readCSV("data.csv", true, ",")

printDataFrame(dfrm3)

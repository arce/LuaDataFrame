require "dataFrame"

local dfrm1 = dataFrame("Test1")
dfrm1.addRow{name="juan",age=23,weight=176}
dfrm1.addRow{name="jose",age=32,weight=250}
dfrm1.addRow{name="pedro",age=29,weight=210}

printDataFrame(dfrm1)
print()

local dfrm2 = dataFrame("Test2")
dfrm2.addColumns{"name","age","weight"}
dfrm2['name'][1] = "juan"
dfrm2['age'][1] = 23
dfrm2['weight'][1] = 176

dfrm2['name'][2] = "jose"
dfrm2['age'][2] = 32
dfrm2['weight'][2] = 250

printDataFrame(dfrm2)
print()


dfrm3 = readCSV("data.csv", true, ",")

printDataFrame(dfrm3)
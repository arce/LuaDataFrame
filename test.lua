require "dataFrame"

n = c{2, 3, 5}
s = c{"aa", "bb", "cc"}
b = c{true, false, true}
df = dataFrame{primero=n,segundo=s,tercero=b} -- df is a data frame
 
for i = 1,df.size() do
  printVector(df[i])
end

print(df[1][2])
printVector(df.names())

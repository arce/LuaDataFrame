local write = io.write
require "dataVector"
require "CSV"

function dataFrame(args)
  local table = args or {}
  local _table = table
  table = {}
  local metatable = {
    __newindex = function(table,k,v)
      _table[k] = v
    end,
    __index = function(table,k)
     return _table[k]
    end
  }
  table.size = function()
    return #_table
  end
  table.names = function()
    local _names = vector()
    for k,_ in pairs(_table) do
      _names[_names.size()+1] = k
    end
    return _names
  end
  setmetatable(table,metatable)
  return table
end

function printDataFrame(dfrm)
  local names = dfrm.names()
  for i=1,names.size() do
      write(names[i].." ")
  end
  write("\n")
  for i=1,dfrm[names[1]].size() do
    for j=1,names.size() do
      write(tostring(dfrm[names[j]][i]).." ")
    end
    write("\n")
  end
end

function readCSV(file, header, sep)
  local dfrm = dataFrame()
  local fd = io.open(file)
  local line = fd:read()
  local headers = fromCSV(line)
  for i=1,#headers do
    dfrm[headers[i]] = vector()
  end
  local register = nil
  local count = 1
  local line = fd:read()
  while line ~= nil do
    register = fromCSV(line)
    for i=1,#register do
      dfrm[headers[i]][count] = register[i]
    end
    line = fd:read()
    count = count + 1
  end
  return dfrm
end

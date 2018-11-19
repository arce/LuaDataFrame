require "dataVector"

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

local oldFenv = getfenv()
local newFenv = {}
setmetatable(newFenv, {__index = _G})
setfenv(1, newFenv)
local tab = {haha = "you", "are", "cool"}
setmetatable(tab, {__call  = function(t, k) 
	print(k) PrintTable(t)
	return "lol"
	end})
print(tab.haha)
setfenv(1, oldFenv)
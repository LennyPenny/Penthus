setfenv(1, getfenv(3)) --setting the fenv to the one we created

local modules, _ = file.Find(name.."/modules/*.lua", "lsv") --why is it 'lsv' and not 'LUA'??
for k, v in pairs(modules) do
	if v == "modules.lua" then continue end
	include(name.."/modules/"..v)
end
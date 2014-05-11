setfenv(1, getfenv(3)) --setting the fenv to the one we created

local libs, _ = file.Find(name.."/lib/*.lua", "lsv") --why is it 'lsv' and not 'LUA'??
for k, v in pairs(libs) do
	if v == "lib.lua" then continue end
	include(name.."/lib/"..v)
end
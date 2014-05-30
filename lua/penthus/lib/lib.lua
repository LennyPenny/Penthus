--setfenv(1, getfenv(3)) --setting the fenv to the one we created

local libs, _ = file.Find(name.."/lib/*.lua", "lsv") --why is it 'lsv' and not 'LUA'??
for k, lib in pairs(libs) do --loading our libs
	if lib == "lib.lua" then continue end
	penthusInclude(name.."/lib/"..lib)
end
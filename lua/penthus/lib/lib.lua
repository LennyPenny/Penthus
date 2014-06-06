local libs, _ = file.Find(name.."/lib/*.lua", "lsv") --why is it 'lsv' and not 'LUA'??
for k, lib in pairs(libs) do --loading our libs
	if lib == "lib.lua" then continue end
	penthusInclude(name.."/lib/"..lib)
end

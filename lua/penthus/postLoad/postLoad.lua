local modules, _ = file.Find(penthus:getName().."/postLoad/*.lua", "lsv") --why is it 'lsv' and not 'LUA'??
for k, modul in pairs(modules) do --loading the file and saving the names of the modules
	if modul == "postLoad.lua" then continue end
	penthusInclude(penthus:getName().."/postLoad/"..modul, false)
end
setfenv(1, getfenv(3)) --setting the fenv to the one we created

local modules, _ = file.Find(penthus:getName().."/modules/*.lua", "lsv") --why is it 'lsv' and not 'LUA'??
for k, modul in pairs(modules) do --loading the file and saving the names of the modules
	if modul == "modules.lua" then continue end
	include(penthus:getName().."/modules/"..modul)

	modul = string.Replace(modul, ".lua", "")
	table.insert(penthus.mods, modul)
end

for k, modul in pairs(penthus.mods) do --initializing the modules
	penthus:add(modul, _G[modul].new())
end

for k, modu in pairs(penthus.mod) do --all modules are now initialized and can begin operation
	if modu.___onLoaded then
		modu:___onLoaded()
	end
end
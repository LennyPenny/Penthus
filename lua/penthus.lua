local newFenv = {} --this will be our new fenv (it's local so anti cheats can't touch it)
local ourOG = _G
setmetatable(newFenv, {__index = ourOG}) --copying _G into our new fenv
setfenv(1, newFenv) --making our new fenv active for the rest of the file

name = "penthus" --don't reference this, use penthus.getName()

function penthusInclude(path)
	local fil = file.Read("addons/Penthus/lua/"..path, "MOD") --this will make sure we can load, no matter what
	fil = fil or file.Read(path, "LUA") --merging directly into the lua folder is more convienent for devwork
	fil = "setfenv(1, getfenv(3)) "..fil --this will set the fenv of any file we load, to this fenv we have right here

	RunStringEx(fil, path) --making sure we can still read errors
end


penthusInclude(name.."/lib/lib.lua") --loading critical, non SIMPLOO libs

class "penthus" {
	public {
		static {
			mods = {}; --keeping track of all modules we have in modules/ here
		};

		mod = {}; --all modules will be loaded into this
		add = function(self, name, instance) --this is how we load modules into the penthus class (taken care of by modules/modules.lua)
			self.mod[name] = instance
		end;

		getName = function() 
			return self.name
		end;
		getVersion = function()
			return self.version
		end;
	};

	private {
		name = name;
		version = "0";
	};
}
penthus = penthus.new()

penthusInclude(penthus:getName().."/modules/modules.lua")

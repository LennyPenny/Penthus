local newFenv = {} --this will be our new fenv (it's local so shitty anti cheats can't touch it)
setmetatable(newFenv, {__index = _G}) --copying _G into our new fenv
setfenv(1, newFenv) --making our new fenv active for the rest of the file

name = "penthus" --don't reference this, use penthus.getName()


include(name.."/lib/lib.lua") --loading critical, non SIMPLOO libs

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

include(name.."/modules/modules.lua")
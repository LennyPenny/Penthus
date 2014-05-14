setfenv(1, getfenv(3)) --setting the fenv to the one we created

class "settings" {
	public {
		add = function(self, cat, options, callback) -- example: settings:add("bhop", {name = "toggle", typ = "Boolean"}, func)
			self.settings[cat] = self.settings[cat] or {}

			table.insert(self.settings[cat], {options = options, callback = callback})
		end;

		getSettingsTab = function()
			return self.settings
		end
	};

	private {
		settings = {}
	};
}
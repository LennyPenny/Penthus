setfenv(1, getfenv(3)) --setting the fenv to the one we created

class "settings" {
	public {
		add = function(self, cat, name, type, callback) -- example: settings:add("bhop", "toggle", "binary", func)
			self.settings[cat] = self.settings[cat] or {}

			table.insert(self.settings[cat], {name, type, callback})
		end;

		getSettingsTab = function()
			return self.settings
		end
	};

	private {
		settings = {}
	};
}
class "settings" {
	public {
		add = function(self, cat, options, callback) -- example: settings:add("bhop", {name = "Boolean", typ = "Boolean"}, func) (typs: Boolean (note: it will be a number in the callback), Float, Generic (text), Int, VectorColor)
			self.settings[cat] = self.settings[cat] or {}

			table.insert(self.settings[cat], {options = options, callback = callback})
		end;

		getSettingsTab = function()
			return self.settings
		end;
	};

	private {
		settings = {}
	};
}
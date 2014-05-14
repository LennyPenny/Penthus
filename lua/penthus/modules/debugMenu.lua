setfenv(1, getfenv(3))

class "debugMenu" {
	private {
		frame = "";
		propPanel = "";
		propRows = {};
		settings = {};

		loadSettings = function()
			self.settings = penthus.mod.settings:getSettingsTab()
		end;

		createFrame = function()
			self.frame = vgui.Create("DFrame")
			self.frame:SetTitle("Penthus debug menu")
			self.frame:SetSize(400, 500)
			self.frame:Center()
			self.frame:SetBackgroundBlur(1) --this should be an option too xD
			self.frame:MakePopup()

			self.propPanel = vgui.Create("DProperties", self.frame)
			self.propPanel:Dock(FILL)
		end;

		createViews = function()
			for cat, opt in pairs(self.settings) do
				for k, row in pairs(opt) do
					self.propRows[cat] = self.propRows[cat] or {}
					self.propRows[cat][row.options.name] = self.propPanel:CreateRow(cat, row.options.name)
					self.propRows[cat][row.options.name]:Setup(row.options.typ)
					self.propRows[cat][row.options.name]:SetValue(false)
				end
			end
		end;

		open = function()
			self:loadSettings()
			self:createFrame()
			self:createViews()
		end;
	};
}

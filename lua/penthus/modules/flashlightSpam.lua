class "flashlightSpam" {
	public {
		___onLoaded = function(self)
			penthus.mod.settings:add("Flashlight Spammer", {name = "toggle", typ = "Boolean"}, self.toggler)
		end;

		toggler = function(data)
			self:toggle(data)
		end;
	};

	private {
		toggle = function(self, data)
			if data == 1 then
				self:turnOn()

			elseif data == 0 then
				self:turnOff()
			end
		end;

		turnOn = function()
			hook.Add("CreateMove", "penthusFlashlightSpam", self.spammer)
		end;
		turnOff = function()
			hook.Remove("CreateMove", "penthusFlashlightSpam")
		end;

		spammer = function(cmd)
			if input.IsKeyDown(KEY_F) then --no IN_ enum for flashlights:( but who uses smth else than f anyway
				cmd:SetImpulse(100)
			end
		end;
	};
}
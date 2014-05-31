class "bhop" {
	public {
		___onLoaded = function(self)
			penthus.mod.settings:add("bhop", {name = "toggle", typ = "Boolean"}, self.toggle)
		end;

		toggle = function(data)
			self:toggler(data)
		end;
	};

	private {
		toggler = function(self, data)
			if data == 1 then
				self:turnOn()

			elseif data == 0 then
				self:turnOff()
			end
		end;

		turnOn = function()
			hook.Add("CreateMove", "penthus_bhop", self.jump)
		end;
		turnOff = function()
			hook.Remove("CreateMove", "penthus_bhop")
		end;

		jump = function(cmd)
			if not cmd:KeyDown(IN_JUMP) then return end --do we even want to bhop
			if LocalPlayer():IsOnGround() then return end --would we wanna jump
			if LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP or LocalPlayer():WaterLevel() >= 2 then return end --does it make sense to jump?

			cmd:SetButtons(cmd:GetButtons() - IN_JUMP) --while in air, don't jump
		end;
	};
}

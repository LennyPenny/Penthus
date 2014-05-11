setfenv(1, getfenv(3)) --setting the fenv to the one we created

class "bHop" {
	public {
		__construct = function(self)
			hook.Add("CreateMove", "penthus_bHop", self.jump)
		end;
	};

	private {
		jump = function(cmd)
			if !cmd:KeyDown(IN_JUMP) then return end --do we even want to bhop
			if LocalPlayer():IsOnGround() then return end --would we wanna jump
			if LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP or LocalPlayer():WaterLevel() > 2 then return end --does it make sense to jump?

			cmd:SetButtons(cmd:GetButtons() - IN_JUMP) --while in air, don't jump
		end;
	};
}
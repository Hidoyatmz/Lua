local function ForcePhase1(event, player, newZone, newArea)
	if(player:IsGM() == false) then
		player:SetPhaseMask(1);
	end

	local speed = player:GetSpeed(1);

	if(player:GetSpeed(1) == 21)then
		player:SetSpeed(1, 1);
		player:Dismount();
	end

	if(player:HasAura(69127))then
		player:RemoveAura( 69127 )
	end
end

RegisterPlayerEvent( 27, ForcePhase1 )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
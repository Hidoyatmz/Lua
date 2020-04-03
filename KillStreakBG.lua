PlayerStackKillStreak = {};
local function LootGladiateurGear(event, killer, killed)
	if(killer:InBattleground() == true or killer:InArena() == true)then
		local kGuid = killer:GetGUIDLow();
		local vGuid = killed:GetGUIDLow();

		if(PlayerStackKillStreak[kGuid] == nil)then
			PlayerStackKillStreak[kGuid] = 0
			PlayerStackKillStreak[kGuid] = PlayerStackKillStreak[kGuid]+1;
		else
			if(PlayerStackKillStreak[kGuid] >= 15)then
				PlayerStackKillStreak[kGuid] = 0
				killer:AddItem(3000002, 5);
				killer:RemoveAura(200024);
			end
			if(PlayerStackKillStreak[kGuid] >= 5)then
				killer:AddAura(70571, killer)
			end
			PlayerStackKillStreak[kGuid] = PlayerStackKillStreak[kGuid]+1;
		end

		if(PlayerStackKillStreak[vGuid] ~= nil)then
			for i=1, PlayerStackKillStreak[vGuid]do
				if(PlayerStackKillStreak[vGuid] >= 5)then
					killer:AddAura(70571, killer)
				end
				PlayerStackKillStreak[kGuid] = PlayerStackKillStreak[kGuid]+1;
				killer:AddAura(200024, killer);
				killer:SetScale(killer:GetScale()+0.1)
			end
			if(PlayerStackKillStreak[vGuid] >= 15)then
				PlayerStackKillStreak[vGuid] = 0;
				killer:AddItem(3000002, 5);
				killer:RemoveAura(200024);
			else
				PlayerStackKillStreak[vGuid] = 0
			end
		end

		killed:SetScale(1);
		killed:RemoveAura(200024);
		killer:AddAura(200024, killer);
		local currentscale = killer:GetScale();
		if(currentscale >= 2)then
			nextScale = 2;
		else
			nextScale = currentscale+0.1;
		end
		killer:SetScale(nextScale);
	end
end

RegisterPlayerEvent( 6, LootGladiateurGear )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
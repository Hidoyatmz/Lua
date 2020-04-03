require "Functions/Player/player";

local function AddPvPXP(event, killer, killed)
	local pGuid = killer:GetGUIDLow();
	local tGuid = killed:GetGUIDLow()
	if(pGuid ~= tGuid)then
		AddPvPXp(pGuid, 10)
		killer:SendBroadcastMessage("Vous avez gagné 10 xp PvP.")
		local players = killer:GetPlayersInRange( 20, 2);
		for _,v in pairs(players) do
			local rGuid = v:GetGUIDLow();
			AddPvPXp(rGuid, 10);
			v:SendBroadcastMessage("Vous avez gagné 10 xp PvP.")
		end
	end
end

local function AddPvEXP(event, killer, killed)
	local pGuid = killer:GetGUIDLow();
	local pMap = killer:GetMapId()
	local pDif = killer:GetDifficulty();
	if(pMap == 543 or pMap == 209 or pMap == 533 or pMap == 603 or pMap == 389 or pMap == 615 or pMap == 249 or pMap == 649)then
		if(pDif == 0)then
			AddPvEXp(pGuid, 10)
			killer:SendBroadcastMessage("Vous avez gagné 10 xp PvE.")
			local players = killer:GetPlayersInRange( 20, 2);
			for _,v in pairs(players) do
				local vGuid = v:GetGUIDLow();
				AddPvEXp(vGuid, 10);
				v:SendBroadcastMessage("Vous avez gagné 10 xp PvP.")
			end
		end
	end
end

RegisterPlayerEvent( 6, AddPvPXP )
RegisterPlayerEvent( 7, AddPvEXP )
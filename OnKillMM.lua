local function OnKillMM(event, killer, killed)
	local pGuid = killer:GetGUIDLow();
	local cGuid = killed:GetGUID();
	local cEntry = GetGUIDEntry(cGuid);
	if (cEntry == 34564) then
		AddMMKill(pGuid);
		local players = killer:GetPlayersInRange(50000, 2);
		for k,v in pairs(players) do
			local vGuid = v:GetGUIDLow();
			AddMMKill(vGuid);
		end
	elseif (cEntry == 36597) then
		killer:AddItem(3000017 ,1)
		local players = killer:GetPlayersInRange(50000, 2);
		for k,v in pairs(players) do
			v:AddItem(3000017 ,1)
		end
	elseif (cEntry == 28860) then
		killer:AddItem(3000018 ,1)
		local players = killer:GetPlayersInRange(50000, 2);
		for k,v in pairs(players) do
			v:AddItem(3000018 ,1)
		end
	elseif (cEntry == 10184) then
		killer:AddItem(3000019 ,1)
		local players = killer:GetPlayersInRange(50000, 2);
		for k,v in pairs(players) do
			v:AddItem(3000019 ,1)
		end
	elseif (cEntry == 34564) then
		killer:AddItem(3000020 ,1)
		local players = killer:GetPlayersInRange(50000, 2);
		for k,v in pairs(players) do
			v:AddItem(3000020 ,1)
		end
	end
end

RegisterPlayerEvent( 7, OnKillMM )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
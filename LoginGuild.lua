local function OnLoginGuild(event, player)
	local pName = player:GetName();
	local pGuildName = player:GetGuildName();
	if(pGuildName == nil)then
		return false;
	end
	local players = GetPlayersInWorld();
	for _,v in pairs(players) do
		if(v:GetGuildName() == pGuildName and v:GetName() ~= pName)then
			v:SendBroadcastMessage("|cFF32CD32[|r|cffffff00"..pName.."|r|cFF32CD32] vient de se connecter.|r");
		end
	end
end

local function OnLogoutGuild(event, player)
	local pName = player:GetName();
	local pGuildName = player:GetGuildName();
	if(pGuildName == nil)then
		return false;
	end
	local players = GetPlayersInWorld();
	for _,v in pairs(players) do
		if(v:GetGuildName() == pGuildName and v:GetName() ~= pName)then
			v:SendBroadcastMessage("|cFF32CD32[|r|cffffff00"..pName.."|r|cFF32CD32] vient de se déconnecter.|r");
		end
	end
end


RegisterPlayerEvent( 3, OnLoginGuild )
RegisterPlayerEvent( 4, OnLogoutGuild )
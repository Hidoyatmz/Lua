local StoneEntry = 7000542

local function OnUseStone(event, player, item, target)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	local pMaxSpells = GetPlayerMaxSpell(pGuid);
	if(pMaxSpells < 14)then
		IncreaseMaxSpells(pGuid)
		player:SendBroadcastMessage("Votre limite de spell a augmenté de 1.")
		player:RemoveItem( StoneEntry, 1 )
	else
		player:SendBroadcastMessage("Vous avez déjà atteint la limite maximum du serveur.")
	end
end

RegisterItemEvent( StoneEntry, 2, OnUseStone )
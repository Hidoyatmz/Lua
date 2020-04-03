local NPC = 101028

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();

	player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Arcane_TeleportWarSpear:40:40:-22:0|t Passer la porte", 1, 1, false, "Etes vous sûr ?")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Achievement_BG_returnXflags_def_WSG:40:40:-22:0|t Partir", 1, 2)
	player:GossipSetText("Bonsoir " .. pName .. ", souhaitez vous passer de l'autre coté ?" )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code)
	local name = player:GetName();
	local accountid = player:GetAccountId();

	if (intid == 1) then
		player:Teleport( 0, -740.357422, 1519.845825, 14.877981, 5.848909 );
		player:GossipComplete();
	elseif (intid == 2)then
		player:GossipComplete();
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
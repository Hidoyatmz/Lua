local NPC = 101026
local JetonDona = 3000000

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();

	player:GossipMenuAddItem(0, "|TInterface\\icons\\VAS_FactionChange:40:40:-22:0|t Changer de faction", 1, 1, false, "Etes vous sûr ? Vous allez payer 15 jetons donation.")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\VAS_RaceChange:40:40:-22:0|t Changer de race", 1, 2, false, "Etes vous sûr ? Vous allez payer 10 jetons donation.")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\VAS_NameChange:40:40:-22:0|t Changer de nom", 1, 3, false, "Etes vous sûr ? Vous allez payer 5 jetons donation.")
	player:GossipSetText("Bonsoir " .. pName .. ", souhaitez vous customiser votre personnage ?" )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code)
	local name = player:GetName();
	local accountid = player:GetAccountId();

	if (intid == 1) then
		local donatepoints = player:GetItemCount( JetonDona )
		if(donatepoints > 15)then
			object:SendUnitWhisper("Vous pouvez maintenant vous déconnecter pour changer de faction !", 0, player, true)
			player:RemoveItem(JetonDona, 15);
			player:SetAtLoginFlag(64);
			player:GossipComplete();
		else
			object:SendUnitWhisper("Vous n'avez pas assez de jetons de donation !", 0, player, true)
			player:GossipComplete();
		end
	elseif(intid == 2)then
		local donatepoints = player:GetItemCount( JetonDona )
		if(donatepoints > 10)then
			object:SendUnitWhisper("Vous pouvez maintenant vous déconnecter pour changer de race !", 0, player, true)
			player:RemoveItem(JetonDona, 10);
			player:SetAtLoginFlag(4);
			player:GossipComplete();
		else
			object:SendUnitWhisper("Vous n'avez pas assez de jetons de donation !", 0, player, true)
			player:GossipComplete();
		end
	elseif(intid == 3)then
		local donatepoints = player:GetItemCount( JetonDona )
		if(donatepoints > 5)then
			object:SendUnitWhisper("Vous pouvez maintenant vous déconnecter pour changer de nom !", 0, player, true)
			player:RemoveItem(JetonDona, 5);
			player:SetAtLoginFlag(1);
			player:GossipComplete();
		else
			object:SendUnitWhisper("Vous n'avez pas assez de jetons de donation !", 0, player, true)
			player:GossipComplete();
		end
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
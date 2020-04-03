local NPC = 101024
local Fragment = 3000102
local JetonDona = 3000000
local JetonVote = 3000001
local Jeton = 3000002
local JetonSpell = 3000002

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	local iCountFrag = player:GetItemCount( Fragment )
	local iCountDona = player:GetItemCount( JetonDona )
	local iCountVote = player:GetItemCount( JetonVote )
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Fomor_Boss_Rune_Red_Frag:40:40:-22:0|t Fragments vers jetons spell", 1, 1, true, "Dans la prochaine fenêtre, entrez le nombre de jetons donation à convertir.")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Fomor_Boss_Rune_Yellow:40:40:-22:0|t Jetons donation vers jetons spell", 1, 2, true, "Dans la prochaine fenêtre, entrez le nombre de jetons donation à convertir.")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Fomor_Boss_Rune_Brown:40:40:-22:0|t Jetons vote vers jetons spell", 1, 3, true, "Dans la prochaine fenêtre, entrez le nombre de jetons vote à convertir.")
	player:GossipSetText("Bonsoir " .. pName .. ", souhaitez vous échanger vos fragments spell contre un jeton spell ?\n\nVous avez " .. iCountFrag .." fragments jetons spell.\nVous avez " .. iCountDona .." jetons donations.\nVous avez " .. iCountVote .." jetons de vote." )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
	local pGuid = player:GetGUIDLow();
	if(intid == 1)then
		local iCount = player:GetItemCount( Fragment )
		local points = tonumber(code);
		if(points <= 0)then
			player:KickPlayer()
			return false;
		end
		local musthave = points*100;
		if(iCount >= musthave)then
			player:RemoveItem( Fragment, musthave )
			player:AddItem( Jeton, points)
			object:SendUnitWhisper("Tenez ! Voila vos "..points.." jetons spell.", 0, player, true);
		else
			object:SendUnitWhisper("Vous n'avez pas assez de fragments de jeton pour que je puisse vous fabriquer un jeton.", 0, player, true)
		end
		player:GossipComplete();
	elseif(intid == 2)then
		local donatepoints = player:GetItemCount( JetonDona )
		local points = tonumber(code);
		if(points <= 0)then
			player:KickPlayer()
			return false;
		end
		local giveitem = code*4;
		if (donatepoints >= points) then
			player:SendAreaTriggerMessage("Vous avez échangé "..code.." jetons de donation contre "..giveitem.." jetons spell.");
			player:AddItem(JetonSpell, giveitem);
			player:RemoveItem(JetonDona, code)
			player:GossipComplete();
		else
			player:SendAreaTriggerMessage("Vous n'avez pas assez de points de donation sur vous.");
			player:GossipComplete();
		end
	elseif(intid == 3)then
		local votepoints = player:GetItemCount( JetonVote )
		local points = tonumber(code);
		if(points <= 0)then
			player:KickPlayer()
			return false;
		end

		if (votepoints >= points) then
			player:SendAreaTriggerMessage("Vous avez échangé "..code.." jetons de donation contre "..code.." jetons spell.");
			player:AddItem(JetonSpell, code);
			player:RemoveItem(JetonVote, code)
			player:GossipComplete();
		else
			player:SendAreaTriggerMessage("Vous n'avez pas assez de points de vote sur vous.");
			player:GossipComplete();
		end
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
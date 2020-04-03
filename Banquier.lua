local NPC = 101025
local JetonDona = 3000000
local JetonVote = 3000001
local JetonSpell = 3000002

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	local accountid = player:GetAccountId();
	local sql = AuthDBQuery("SELECT username, vip, votepoints, donatepoints FROM account WHERE id = "..accountid..";");
	local informations = {
		username = sql:GetString(0);
		getvip = sql:GetUInt32(1);
		votepoints = sql:GetUInt32(2);
		donatepoints = sql:GetUInt32(3);
	}

	local pdonatepoints = player:GetItemCount(3000000);
	local pvotepoints = player:GetItemCount(3000001);

	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Fomor_Boss_Rune_Yellow:40:40:-22:0|t Jetons Donation ("..informations.donatepoints..")", 1, 1, true, "Dans la prochaine fenêtre, entrez le nombre de points que vous souhaitez retirer.")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Fomor_Boss_Rune_Brown:40:40:-22:0|t Jetons Vote ("..informations.votepoints..")", 1, 2, true, "Dans la prochaine fenêtre, entrez le nombre de points que vous souhaitez retirer.")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Fomor_Boss_Rune_Yellow:40:40:-22:0|t Jetons Donation ("..pdonatepoints..")", 1, 5, true, "Dans la prochaine fenêtre, entrez le nombre de points que vous souhaitez ajouter.")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Fomor_Boss_Rune_Brown:40:40:-22:0|t Jetons Vote ("..pvotepoints..")", 1, 6, true, "Dans la prochaine fenêtre, entrez le nombre de points que vous souhaitez ajouter.")
	--player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Fomor_Boss_Rune_Red:40:40:-22:0|t Jetons donation vers jetons spell", 1, 3, true, "Dans la prochaine fenêtre, entrez le nombre de jetons donation à convertir.")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_misc_coin_16:40:40:-22:0|t Faire un don d'or ", 1, 3);
	player:GossipMenuAddItem(0, "|TInterface\\icons\\UI_Promotion_CharacterBoost:40:40:-22:0|t Bonus VIP", 1, 4);
	player:GossipSetText("Bonsoir " .. pName .. ", souhaitez vous récuperer des jetons ?" )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code)
	local name = player:GetName();
	local accountid = player:GetAccountId();

	if(intid == 6)then
		local pName = player:GetName();
		local pAccId = player:GetAccountId();
		local votepoints = player:GetItemCount( JetonVote )
		local points = tonumber(code);
		if(points <= 0)then
			player:KickPlayer()
			return false;
		end

		if(votepoints >= points)then
			local Query1 = AuthDBExecute("UPDATE account SET votepoints = votepoints+"..points.." WHERE id = "..accountid..";");
			player:RemoveItem(JetonVote, points);
			player:SendAreaTriggerMessage("Vous avez ajouté "..code.." jetons de vote sur votre compte.");
			player:GossipComplete();
		else
			player:SendAreaTriggerMessage("Vous n'avez pas assez de points de donation sur vous.");
			player:GossipComplete();
		end
	end

	if(intid == 5)then
		local pName = player:GetName();
		local pAccId = player:GetAccountId();
		local donatepoints = player:GetItemCount( JetonDona )
		local points = tonumber(code);
		if(points <= 0)then
			player:KickPlayer()
			return false;
		end

		if(donatepoints >= points)then
			local Query1 = AuthDBExecute("UPDATE account SET donatepoints = donatepoints+"..points.." WHERE id = "..accountid..";");
			player:RemoveItem(JetonDona, points);
			player:SendAreaTriggerMessage("Vous avez ajouté "..code.." jetons de donation sur votre compte.");
			player:GossipComplete();
		else
			player:SendAreaTriggerMessage("Vous n'avez pas assez de points de donation sur vous.");
			player:GossipComplete();
		end
	end

	if(intid == 4)then
		local pName = player:GetName();
		local pAccId = player:GetAccountId();
		local Query1 = AuthDBQuery("SELECT vip FROM account WHERE id = "..pAccId..";");
		local pIsVIP = Query1:GetUInt32(0);
		if(pIsVIP == 1)then
			object:SendUnitWhisper("Et voila vos bonus VIP\nMerci de soutenir le serveur !", 0, player, true)
			player:GossipComplete();
			player:AddItem(3000504);
			player:AddItem(8000022);
			player:SetKnownTitle(185);
			player:LearnSpell(80873);
			player:LearnSpell(80874);
			player:LearnSpell(80875);
		else
			object:SendUnitWhisper("Vous n'êtes pas VIP.\nLe VIP coute 35 |TInterface\\icons\\Ability_Fomor_Boss_Rune_Yellow:30:30:0:0|t sur le site internet. https://wow-crusade.com.", 0, player, true)
			player:GossipComplete();
		end
	end

	if (intid == 3) then
		player:SetCoinage(100000000);
		player:GossipComplete();
	end	

	if (intid == 2) then
		local sql = AuthDBQuery("SELECT votepoints FROM account WHERE id = "..accountid..";");
		local votepoints = sql:GetUInt32(0);
		local points = tonumber(code);
		if(points <= 0)then
			player:KickPlayer()
			return false;
		end
		if (votepoints >= points) then
			local sql2 = AuthDBQuery("UPDATE account SET votepoints = votepoints-"..code.." WHERE id = "..accountid..";");
			player:SendAreaTriggerMessage("Vous avez pris "..code.." points de vote depuis votre compte.");
			player:AddItem(JetonVote, code)
			player:GossipComplete()
		else
			player:SendAreaTriggerMessage("Vous n'avez pas assez de points de vote sur votre compte.");
			player:GossipComplete();
		end
	end

	if (intid == 1) then
		local sql = AuthDBQuery("SELECT donatepoints FROM account WHERE id = "..accountid..";");
		local donatepoints = sql:GetUInt32(0);
		local points = tonumber(code);
		if(points <= 0)then
			player:KickPlayer()
			return false;
		end
		if (donatepoints >= points) then
			local sql2 = AuthDBQuery("UPDATE account SET donatepoints = donatepoints-"..code.." WHERE id = "..accountid..";");
			player:SendAreaTriggerMessage("Vous avez pris "..code.." points de donation depuis votre compte.");
			player:AddItem(JetonDona, code);
			player:GossipComplete();
		else
			player:SendAreaTriggerMessage("Vous n'avez pas assez de points de donation sur votre compte.");
			player:GossipComplete();
		end
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
local NPC = 101039

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
	local pGuild = player:GetGuildName();
	local pGuildId = player:GetGuildId();
	if(pGuild ~= nil)then
		player:GossipClearMenu();
		local Query = CharDBQuery("SELECT guildlevel, xp, requiredxp FROM guild WHERE guildid = "..pGuildId..";");
		local guildlevel = Query:GetUInt32(0);
		local guildxp = Query:GetUInt32(1);
		local guildrequiredxp = Query:GetUInt32(2);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\UI_Promotion_CharacterBoost:40:40:-22:0|t Niveau supérieur ("..guildxp.."/"..guildrequiredxp.."xp)", 1, 1);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\VAS_NameChange:40:40:-22:0|t Modifier le nom (500 xp)", 1, 2, true, "Dans la prochaine fenêtre entrez le nom souhaitez.\n\nNotez qu'un changement de nom requiert un redémarrage du serveur pour prendre effet.");
		player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_dungeon_utgardekeep_normal:40:40:-22:0|t Vendeur de guilde level 5", 1, 3);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_dungeon_utgardepinnacle_10man:40:40:-22:0|t Vendeur de guilde level 10", 1, 4);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_dungeon_utgardepinnacle_heroic:40:40:-22:0|t Vendeur de guilde level 15", 1, 5);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_dungeon_utgardepinnacle_normal:40:40:-22:0|t Vendeur de guilde level 20", 1, 6);
		player:GossipSetText("Bonjour " .. pName .. ", voici les informations concernant votre guilde\n\n               |cFF4B0082["..pGuild.."]|r\nNiveau: "..guildlevel.."\nXp: "..guildxp.."\nXp nécessaire: "..guildrequiredxp);
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	else
		player:GossipComplete();
		player:SendAreaTriggerMessage("Vous n'avez pas de guilde...");
	end
end

local function OnGossipSelect(event, player, creature, sender, intid, code)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	local pGuild = player:GetGuildName();
	local pGuildId = player:GetGuildId();
	if(intid == 1)then
		local Query = CharDBQuery("SELECT guildlevel, xp, requiredxp FROM guild WHERE guildid = "..pGuildId..";");
		local guildlevel = Query:GetUInt32(0);
		local guildxp = Query:GetUInt32(1);
		local guildrequiredxp = Query:GetUInt32(2);
		local QueryLeader = CharDBQuery("SELECT leaderguid FROM guild WHERE guildid = "..pGuildId);
		local gLeader = QueryLeader:GetUInt32(0);		
		if(gLeader == pGuid)then
			if(guildxp >= guildrequiredxp)then
				player:SendAreaTriggerMessage("Niveau de guilde augmenté de 1 !");
				local QueryUpdate = CharDBExecute("UPDATE guild SET xp = xp-requiredxp, guildlevel = guildlevel+1, requiredxp = requiredxp*1.7 WHERE guildid = "..pGuildId..";");
				player:GossipComplete();
			else
				player:SendAreaTriggerMessage("Vous n'avez pas assez d'xp pour augmenter le niveau de votre guilde.");
				player:GossipComplete();
			end
		else
			print(gLeader.." != "..pGuid);
			player:SendAreaTriggerMessage("Vous devez etre le chef de guilde pour effectuer cette action.");
			player:GossipComplete();
		end
	elseif(intid == 2)then
		local newname = string.gsub(code, "'", " ");
		local QueryCheckName = CharDBQuery("SELECT name FROM guild WHERE name = '"..newname.."';");
		if(QueryCheckName)then
			player:SendAreaTriggerMessage("Une guilde utilise déjà ce nom...");
			player:GossipComplete();
		else
			local Query = CharDBQuery("SELECT guildlevel, xp, requiredxp FROM guild WHERE guildid = "..pGuildId..";");
			local guildlevel = Query:GetUInt32(0);
			local guildxp = Query:GetUInt32(1);
			local guildrequiredxp = Query:GetUInt32(2);
			local QueryLeader = CharDBQuery("SELECT leaderguid FROM guild WHERE guildid = "..pGuildId);
			local gLeader = QueryLeader:GetUInt32(0);
			if(gLeader == pGuid)then
				if(guildxp >= 500)then
					local newname = string.gsub(code, "'", " ");
					local QueryUpdate = CharDBExecute("UPDATE guild SET name = '"..newname.."', xp = xp-500 WHERE guildid = "..pGuildId..";");
					player:SendAreaTriggerMessage("Nom de la guilde modifié avec succés.");
					player:GossipComplete();
				end
			else
				player:SendAreaTriggerMessage("Vous n'avez pas assez d'xp pour changer le nom de votre guilde.");
				player:GossipComplete();
			end
		end
	elseif(intid == 3)then
		local Query = CharDBQuery("SELECT guildlevel, xp, requiredxp FROM guild WHERE guildid = "..pGuildId..";");
		local guildlevel = Query:GetUInt32(0);
		local guildxp = Query:GetUInt32(1);
		local guildrequiredxp = Query:GetUInt32(2);
		if(guildlevel >= 5)then
			player:SendListInventory(creature, 100020);
		else
			player:SendAreaTriggerMessage("Le niveau de votre guilde doit être supérieur ou égal à 5.");
			player:GossipComplete();
		end
	elseif(intid == 4)then
		local Query = CharDBQuery("SELECT guildlevel, xp, requiredxp FROM guild WHERE guildid = "..pGuildId..";");
		local guildlevel = Query:GetUInt32(0);
		local guildxp = Query:GetUInt32(1);
		local guildrequiredxp = Query:GetUInt32(2);
		if(guildlevel >= 10)then
			player:SendListInventory(creature, 100021);
		else
			player:SendAreaTriggerMessage("Le niveau de votre guilde doit être supérieur ou égal à 10.");
			player:GossipComplete();
		end
	elseif(intid == 5)then
		local Query = CharDBQuery("SELECT guildlevel, xp, requiredxp FROM guild WHERE guildid = "..pGuildId..";");
		local guildlevel = Query:GetUInt32(0);
		local guildxp = Query:GetUInt32(1);
		local guildrequiredxp = Query:GetUInt32(2);
		if(guildlevel >= 15)then
			player:SendListInventory(creature, 100022);
		else
			player:SendAreaTriggerMessage("Le niveau de votre guilde doit être supérieur ou égal à 15.");
			player:GossipComplete();
		end
	elseif(intid == 6)then
		local Query = CharDBQuery("SELECT guildlevel, xp, requiredxp FROM guild WHERE guildid = "..pGuildId..";");
		local guildlevel = Query:GetUInt32(0);
		local guildxp = Query:GetUInt32(1);
		local guildrequiredxp = Query:GetUInt32(2);
		if(guildlevel >= 20)then
			player:SendListInventory(creature, 100023);
		else
			player:SendAreaTriggerMessage("Le niveau de votre guilde doit être supérieur ou égal à 20.");
			player:GossipComplete();
		end
	elseif(intid == 998)then
		OnGossipHello(event, player, object, unit);
	end
end



local function AddGuildXPPvP(event, killer, killed)
	if(killer:GetGuildName() ~= nil)then
		local pGuildId = killer:GetGuildId();
		if(killer:GetName() ~= killed:GetName())then
			killer:SendAreaTriggerMessage("Vous avez gagner 5 points d'xp pour votre guilde en tuant "..killed:GetName());
		end
		local Query = CharDBExecute("UPDATE guild SET xp = xp+5 WHERE guildid = "..pGuildId..";");
	end

	if(killed:GetGuildName() ~= nil)then
		local pGuildId = killed:GetGuildId();
		local Query = CharDBQuery("SELECT xp FROM guild WHERE guildid = "..pGuildId..";");
		local guildxp = Query:GetUInt32(0);
		if(guildxp >= 2)then
			if(killer:GetName() ~= killed:GetName())then
				killed:SendAreaTriggerMessage("Vous avez fait perdre 2 points d'xp à votre en guilde en mourant contre "..killer:GetName());
			else
				killed:SendAreaTriggerMessage("Vous avez fait perdre 2 points d'xp à votre en guilde en vous scuicidant");
			end
			local Query = CharDBExecute("UPDATE guild SET xp = xp-2 WHERE guildid = "..pGuildId..";");
		end
	end
end

local function AddGuildXPPvE(event, killer, killed)
	local pMap = killer:GetMapId()
	local pGuildId = killer:GetGuildId();
	local pDif = killer:GetDifficulty();
	if(pMap == 543 or pMap == 209 or pMap == 533 or pMap == 603 or pMap == 389 or pMap == 615 or pMap == 249 or pMap == 649)then
		if(killer:GetGuildName() ~= nil)then
			if(pDif == 0)then
				local Query = CharDBExecute("UPDATE guild SET xp = xp+2 WHERE guildid = "..pGuildId..";");
				local playerstoadd = killer:GetPlayersInRange( 20, 2 )
				if(pMap == 543 or pMap == 209 or pMap == 533 or pMap == 603 or pMap == 389 or pMap == 615 or pMap == 249 or pMap == 649)then
					if(pDif == 0)then
						for k,v in pairs(playerstoadd) do
							v:AddItem(3000015, 1);
						end
						killer:AddItem(3000015, 1);
					end
				end
			end
			killer:SendBroadcastMessage("Vous avez fait gagner 2 points d'xp à votre guilde.");
		end
	end
end

local function RemoveGuildXPPvE(event, killer, killed)
	local pMap = killed:GetMapId()
	local pGuildId = killed:GetGuildId();
	if(killer:GetGuildName() ~= nil)then
		if(pMap == 543 or pMap == 209 or pMap == 533 or pMap == 603 or pMap == 389)then
			local Query = CharDBQuery("SELECT xp FROM guild WHERE guildid = "..pGuildId..";");
			local guildxp = Query:GetUInt32(0);
			if(guildxp >= 2)then
				if(killed:GetGuildName() ~= nil)then
					local Query = CharDBExecute("UPDATE guild SET xp = xp-2 WHERE guildid = "..pGuildId..";");
					killed:SendBroadcastMessage("Vous avez fait perdre 2 points d'xp à votre guilde.");
				end
			end
		end
	end
end

RegisterPlayerEvent( 6, AddGuildXPPvP )
RegisterPlayerEvent( 7, AddGuildXPPvE )
RegisterPlayerEvent( 8, RemoveGuildXPPvE )
RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
local NPC = 101038

local function round(number)
  if (number - (number % 0.1)) - (number - (number % 1)) < 0.5 then
    number = number - (number % 1)
  else
    number = (number - (number % 1)) + 1
  end
 return number
end

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
	player:GossipClearMenu();
	player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_bg_winav_bothmines:40:40:-22:0|t Équipes 1v1", 1, 1);
	player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_arena_2v2_7:40:40:-22:0|t Équipes 2v2", 1, 2);
	player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_arena_3v3_7:40:40:-22:0|t Équipes 3v3", 1, 3);
	player:GossipMenuAddItem(0, "|TInterface\\icons\\ability_warrior_incite:40:40:-22:0|t Victoires honorables", 1, 4);
	player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_bg_winav_underxminutes:40:40:-22:0|t Temps joué", 1, 5);
	player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_dungeon_utgardepinnacle_normal:40:40:-22:0|t Niveaux de guilde", 1, 6);
	player:GossipSetText("Bonjour " .. pName .. ", souhaitez vous voir certaines statistiques du serveur ?" )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code)
	local pName = player:GetName();
	if(intid == 1)then
		player:GossipClearMenu();
		local Query = CharDBQuery("SELECT name, rating FROM arena_team WHERE type = 1 ORDER BY rating DESC LIMIT 5;");
		if(Query)then
			repeat
				player:GossipMenuAddItem(0, "|cFF800080Nom:|r "..Query:GetString(0).."\n|cFF800080Cote:|r "..Query:GetUInt32(1), 1, 998);
			until not Query:NextRow()
		end
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipSetText("Bonjour " .. pName .. ", souhaitez voici les équipes 1v1 ayant la plus grosse côte d'équipe du serveur" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 2)then
		player:GossipClearMenu();
		local Query = CharDBQuery("SELECT name, rating FROM arena_team WHERE type = 2 ORDER BY rating DESC LIMIT 5;");
		if(Query)then
			repeat
				player:GossipMenuAddItem(0, "|cFF800080Nom d'équipe:|r "..Query:GetString(0).."\n|cFF800080Cote d'équipe:|r "..Query:GetUInt32(1), 1, 998);
			until not Query:NextRow()
		end
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipSetText("Bonjour " .. pName .. ", souhaitez voici les équipes 2v2 ayant la plus grosse côte d'équipe du serveur" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 3)then
		player:GossipClearMenu();
		local Query = CharDBQuery("SELECT name, rating FROM arena_team WHERE type = 3 ORDER BY rating DESC LIMIT 5;");
		if(Query)then
			repeat
				player:GossipMenuAddItem(0, "|cFF800080Nom d'équipe:|r "..Query:GetString(0).."\n|cFF800080Cote d'équipe:|r "..Query:GetUInt32(1), 1, 998);
			until not Query:NextRow()
		end
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipSetText("Bonjour " .. pName .. ", souhaitez voici les équipes 3v3 ayant la plus grosse côte d'équipe du serveur" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 4)then
		player:GossipClearMenu();
		local Query = CharDBQuery("SELECT name, totalKills FROM characters ORDER BY totalKills DESC LIMIT 5;");
		if(Query)then
			repeat
				player:GossipMenuAddItem(0, "|cFF800080Nom:|r "..Query:GetString(0).."\n|cFF800080Victoires honorables:|r "..Query:GetUInt32(1), 1, 998);
			until not Query:NextRow()
		end
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipSetText("Bonjour " .. pName .. ", voici les joueurs ayant le plus de victoire honorable sur le serveur" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 5)then
		player:GossipClearMenu();
		local Query = CharDBQuery("SELECT name, totaltime FROM characters ORDER BY totaltime DESC LIMIT 5;");
		if(Query)then
			repeat
				local timeplayed = round(Query:GetUInt32(1)/3600);
				player:GossipMenuAddItem(0, "|cFF800080Nom:|r "..Query:GetString(0).."\n|cFF800080Temps joué:|r "..timeplayed.." heures", 1, 998);
			until not Query:NextRow()
		end
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipSetText("Bonjour " .. pName .. ", voici les joueurs ayant le plus jouer sur le serveur" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 6)then
		player:GossipClearMenu();
		local Query = CharDBQuery("SELECT name, guildlevel, xp, requiredxp FROM guild ORDER BY guildlevel DESC LIMIT 5;");
		if(Query)then
			repeat
				local guildname = Query:GetString(0);
				local guildlevel = Query:GetUInt32(1);
				local xp = Query:GetUInt32(2);
				local needxp = Query:GetUInt32(3);
				player:GossipMenuAddItem(0, "|cFF800080Nom:|r "..guildname.."\n|cFF800080Niveau:|r "..guildlevel, 1, 998);
			until not Query:NextRow()
		end
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipSetText("Bonjour " .. pName .. ", voici les guildes du serveur ayant le plus avancé en niveau de guilde." )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 998)then
		OnGossipHello(event, player, object, unit)
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
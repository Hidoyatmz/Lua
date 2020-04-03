local NPC = 101040

local function round(number)
  if (number - (number % 0.1)) - (number - (number % 1)) < 0.5 then
    number = number - (number % 1)
  else
    number = (number - (number % 1)) + 1
  end
 return number
end

local function OnGossipHello(event, player, object, unit)
		player:GossipClearMenu();
		local Query = WorldDBQuery("SELECT * FROM npc_played");
		if(Query)then
			repeat
				local id = Query:GetUInt32(0);
				local time = Query:GetUInt32(1);
				if(time <= 86400)then
					timeplayed = round(Query:GetUInt32(1)/3600).." heures";
				else
					timeplayed = round(Query:GetUInt32(1)/86400).." jours";
				end
				player:GossipMenuAddItem(0, "Temps de jeu requis: "..timeplayed, 1, id, false, "Soyez certains d'avoir de la place dans vos sacs avant de cliquer sur 'Accepter'.");
			until not Query:NextRow()
		end
		player:GossipMenuAddItem(0, "Partir...", 1, 999);
		player:GossipSetText("Bonjour, vous êtes venu récuperer vos récompenses de temps de jeu ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, creature, sender, intid, code)
	local pGuid = player:GetGUIDLow();
	local pPlayed = player:GetTotalPlayedTime();
	if(intid == 999)then
		player:GossipComplete();
	else
		local QueryCheck = CharDBQuery("SELECT guid FROM character_played_reward WHERE rewardid = "..intid.." AND guid = "..pGuid..";");
		if(QueryCheck)then
			player:GossipComplete();
			player:SendAreaTriggerMessage("Vous avez déjà récuperé cette récompense...");
		else
			local QueryGive = WorldDBQuery("SELECT item_1, item_amount_1, item_2, item_amount_2, item_3, item_amount_3, seconds FROM npc_played WHERE id = "..intid..";");
			local item1 = QueryGive:GetUInt32(0);
			local aitem1 = QueryGive:GetUInt32(1);
			local item2 = QueryGive:GetUInt32(2);
			local aitem2 = QueryGive:GetUInt32(3);
			local item3 = QueryGive:GetUInt32(4);
			local aitem3 = QueryGive:GetUInt32(5);
			local musthavetime = QueryGive:GetUInt32(6);
			if(musthavetime <= pPlayed)then
				player:AddItem(item1, aitem1);
				player:AddItem(item2, aitem2);
				player:AddItem(item3, aitem3);
				local QueryUpdate = CharDBExecute("INSERT INTO character_played_reward(guid, rewardid) VALUES("..pGuid..","..intid..");");
				player:SendAreaTriggerMessage("Voila vos objets !");
				player:GossipComplete();
			else
				player:SendAreaTriggerMessage("Vous n'avez pas assez joué pour recevoir cette récompense...");
			end
		end
		player:GossipComplete();
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
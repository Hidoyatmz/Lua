local NPC1 = 101041
local NPC2 = 101042
local NPC3 = 101043
local NPC4 = 101044

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
	local pGuild = player:GetGuildName();
	local pGuildId = player:GetGuildId();
	if(pGuild ~= nil)then
		player:GossipClearMenu();
		player:GossipMenuAddItem(0, "Montrez moi ce que vous avez à vendre", 1, 1);
		player:GossipMenuAddItem(0, "Partir", 1, 998);
		player:GossipSetText("Alors c'est donc vous qui controlez Atreval ?");
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
		local Query = WorldDBQuery("SELECT name FROM guild_control WHERE control = 1 AND guid = "..pGuildId);
		if(Query)then
			player:SendListInventory(creature, 101041);
		else
			player:SendAreaTriggerMessage("Votre guilde ne controle pas Atreval.")
			player:GossipComplete();
		end
	elseif(intid == 998)then
		player:GossipComplete();
	end
end

local function OnGossipHello2(event, player, object, unit)
	local pName = player:GetName();
	local pGuild = player:GetGuildName();
	local pGuildId = player:GetGuildId();
	if(pGuild ~= nil)then
		player:GossipClearMenu();
		player:GossipMenuAddItem(0, "Montrez moi ce que vous avez à vendre", 1, 1);
		player:GossipMenuAddItem(0, "Partir", 1, 998);
		player:GossipSetText("Alors c'est donc vous qui controlez Atreval ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	else
		player:GossipComplete();
		player:SendAreaTriggerMessage("Vous n'avez pas de guilde...");
	end
end

local function OnGossipSelect2(event, player, creature, sender, intid, code)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	local pGuild = player:GetGuildName();
	local pGuildId = player:GetGuildId();

	if(intid == 1)then
		local Query = WorldDBQuery("SELECT name FROM guild_control WHERE control = 1 AND guid = "..pGuildId);
		if(Query)then
			player:SendListInventory(creature, 101042);
		else
			player:SendAreaTriggerMessage("Votre guilde ne controle pas Atreval.")
			player:GossipComplete();
		end
	elseif(intid == 998)then
		player:GossipComplete();
	end
end

local function OnGossipHello3(event, player, object, unit)
	local pName = player:GetName();
	local pGuild = player:GetGuildName();
	local pGuildId = player:GetGuildId();
	if(pGuild ~= nil)then
		player:GossipClearMenu();
		player:GossipMenuAddItem(0, "Montrez moi ce que vous avez à vendre", 1, 1);
		player:GossipMenuAddItem(0, "Partir", 1, 998);
		player:GossipSetText("Alors c'est donc vous qui controlez Atreval ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	else
		player:GossipComplete();
		player:SendAreaTriggerMessage("Vous n'avez pas de guilde...");
	end
end

local function OnGossipSelect3(event, player, creature, sender, intid, code)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	local pGuild = player:GetGuildName();
	local pGuildId = player:GetGuildId();

	if(intid == 1)then
		local Query = WorldDBQuery("SELECT name FROM guild_control WHERE control = 1 AND guid = "..pGuildId);
		if(Query)then
			player:SendListInventory(creature, 101043);
		else
			player:SendAreaTriggerMessage("Votre guilde ne controle pas Atreval.")
			player:GossipComplete();
		end
	elseif(intid == 998)then
		player:GossipComplete();
	end
end

local function OnGossipHello4(event, player, object, unit)
	local pName = player:GetName();
	local pGuild = player:GetGuildName();
	local pGuildId = player:GetGuildId();
	if(pGuild ~= nil)then
		player:GossipClearMenu();
		player:GossipMenuAddItem(0, "Montrez moi ce que vous avez à vendre", 1, 1);
		player:GossipMenuAddItem(0, "Partir", 1, 998);
		player:GossipSetText("Alors c'est donc vous qui controlez Atreval ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	else
		player:GossipComplete();
		player:SendAreaTriggerMessage("Vous n'avez pas de guilde...");
	end
end

local function OnGossipSelect4(event, player, creature, sender, intid, code)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	local pGuild = player:GetGuildName();
	local pGuildId = player:GetGuildId();

	if(intid == 1)then
		local Query = WorldDBQuery("SELECT name FROM guild_control WHERE control = 1 AND guid = "..pGuildId);
		if(Query)then
			player:SendListInventory(creature, 101044);
		else
			player:SendAreaTriggerMessage("Votre guilde ne controle pas Atreval.")
			player:GossipComplete();
		end
	elseif(intid == 998)then
		player:GossipComplete();
	end	
end

RegisterCreatureGossipEvent( NPC1, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC1, 2, OnGossipSelect )

RegisterCreatureGossipEvent( NPC2, 1, OnGossipHello2 )
RegisterCreatureGossipEvent( NPC2, 2, OnGossipSelect2 )

RegisterCreatureGossipEvent( NPC3, 1, OnGossipHello3 )
RegisterCreatureGossipEvent( NPC3, 2, OnGossipSelect3 )

RegisterCreatureGossipEvent( NPC4, 1, OnGossipHello4 )
RegisterCreatureGossipEvent( NPC4, 2, OnGossipSelect4 )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
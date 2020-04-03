local NPC = 1500000

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	local pQStatus = player:GetQuestStatus(1000003)

	if (pQStatus == 0) then
		player:GossipMenuAddItem(0, "Salam mon frère", 1, 2)
		player:GossipSetText("Wesh fradé qu'est-ce que tu fou la ?" )
	elseif(pQStatus == 3)then
		player:GossipMenuAddItem(0, "C'est toi le voleur de collier ?", 1, 1)
		player:GossipMenuAddItem(0, "Salam mon frère", 1, 2)
		player:GossipSetText("Wesh fradé qu'est-ce que tu fou la ?" )
	end
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
	local pGuid = player:GetGUIDLow();
	if(intid == 1)then
		player:GossipMenuAddItem(0, "Ne me force pas à devoir te tuer pour récuperer se collier...", 1, 3)
		player:GossipSetText("Mais nan wesheuh casse toi de la t ki ?" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 2)then
		player:GossipComplete();
	elseif(intid == 3)then
		player:AddItem(1500000,1)
		player:GossipSetText("Ouais bon ok t'as gagné... Tiens le voila ton collier !\nInshallah quand je serais plus grande jte défonce" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
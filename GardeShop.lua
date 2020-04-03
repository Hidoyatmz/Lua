local NPC = 1000000

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
	player:GossipClearMenu();
	player:GossipMenuAddItem(0, "Téléporteur", 1, 1)
	player:GossipMenuAddItem(0, "Les maîtres de classe", 1, 2)
	player:GossipMenuAddItem(0, "Banquier & Aubergiste", 1, 13)
	player:GossipMenuAddItem(0, "Maître et vendeur de monture", 1, 3)
	player:GossipMenuAddItem(0, "Maîtres d'armes", 1, 4)
	player:GossipMenuAddItem(0, "Maîtres de l'arene", 1, 5)
	player:GossipMenuAddItem(0, "Fournitures & poisons", 1, 6)
	player:GossipMenuAddItem(0, "Vendeur JcJ", 1, 7)
	player:GossipMenuAddItem(0, "Vendeur JcE", 1, 8)
	player:GossipMenuAddItem(0, "Vendeur de départ", 1, 9)
	player:GossipMenuAddItem(0, "Sorts hors-classe & remboursement", 1, 10)
	player:GossipMenuAddItem(0, "Maître des métiers", 1, 11)
	player:GossipMenuAddItem(0, "Transmogrification", 1, 12)
	player:GossipMenuAddItem(0, "Partir", 1, 999)
	player:GossipSetText("Bonsoir " .. pName .. ", souhaitez vous passer de l'autre coté ?" )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code)
	local pName = player:GetName();

	if(intid == 1)then
		player:Teleport(571, 2938.6572, 73.6227, 6.9898, 1.5813);
	elseif(intid == 2)then
		player:GossipMenuAddItem(0, "Guerrier", 1, 20)
		player:GossipMenuAddItem(0, "Paladin", 1, 21)
		player:GossipMenuAddItem(0, "Chevalier de la mort", 1, 22)
		player:GossipMenuAddItem(0, "Voleur", 1, 23)
		player:GossipMenuAddItem(0, "Druide", 1, 24)
		player:GossipMenuAddItem(0, "Chasseur", 1, 25)
		player:GossipMenuAddItem(0, "Chaman", 1, 26)
		player:GossipMenuAddItem(0, "Prêtre", 1, 27)
		player:GossipMenuAddItem(0, "Démoniste", 1, 28)
		player:GossipMenuAddItem(0, "Mage", 1, 29)
		player:GossipMenuAddItem(0, "Retour", 1, 998)
		player:GossipSetText("Bonsoir " .. pName .. ", souhaitez vous passer de l'autre coté ?" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 3)then
		player:Teleport(571, 2910.6538, 82.3408, 3.6209, 1.1444);
		player:GossipComplete();
	elseif(intid == 4)then
		player:Teleport(571, 2829.2375, 113.1310, 1.2124, 4.5105);
		player:GossipComplete();
	elseif(intid == 5)then
		player:Teleport(571, 2933.1425, 53.9472, 5.1555, 4.9273);
		player:GossipComplete();
	elseif(intid == 6)then
		player:Teleport(571, 2829.2375, 113.1310, 1.2124, 4.5105);
		player:GossipComplete();
	elseif(intid == 7)then
		player:Teleport(571, 2765.2990, 94.7457, 3.5808, 0.7568);
		player:GossipComplete();
	elseif(intid == 8)then
		player:Teleport(571, 2761.0207, 77.2070, 4.5609, 4.4364);
		player:GossipComplete();
	elseif(intid == 9)then
		player:Teleport(571, 2765.2990, 94.7457, 3.5808, 0.7568);
		player:GossipComplete();
	elseif(intid == 10)then
		player:Teleport(571, 2836.3464, 172.8704, 2.0054, 1.3459);
		player:GossipComplete();
	elseif(intid == 11)then
		player:Teleport(571, 2863.1826, 70.7834, 1.3496, 2.3117);
		player:GossipComplete();
	elseif(intid == 12)then
		player:Teleport(571, 2887.6159, 37.2442, 1.4065, 5.9640);
		player:GossipComplete();
	elseif(intid == 13)then
		player:Teleport(571, 2902.2976, 108.9327, 2.7063, 0.3778);
		player:GossipComplete();
	elseif(intid == 20)then
		player:Teleport(571, 2731.2102, 78.5104, 4.6243, 3.4565);
		player:GossipComplete();
	elseif(intid == 21)then
		player:Teleport(571, 2922.7636, 117.2621, 5.4707, 0.8176);
		player:GossipComplete();
	elseif(intid == 22)then
		player:Teleport(571, 2801.5266, 169.0055, 4.2839, 1.8504);
		player:GossipComplete();
	elseif(intid == 23)then
		player:Teleport(571, 2743.2404, 131.2062, 5.5928, 2.5847);
		player:GossipComplete();
	elseif(intid == 24)then
		player:Teleport(571, 2817.8876, -41.1268, 3.2852, 4.9802);
		player:GossipComplete();
	elseif(intid == 25)then
		player:Teleport(571, 2893.5620, 141.1632, 3.3016, 0.8018);
		player:GossipComplete();
	elseif(intid == 26)then
		player:Teleport(571, 2867.7358, -26.4585, 1.7836, 5.6437);
		player:GossipComplete();
	elseif(intid == 27)then
		player:Teleport(571, 2786.9809, 2.2804, 2.1813, 1.7012);
		player:GossipComplete();
	elseif(intid == 28)then
		player:Teleport(571, 2772.6174, -63.7147, 6.9179, 4.1909);
		player:GossipComplete();
	elseif(intid == 29)then
		player:Teleport(571, 2866.8063, 53.1572, 0.4957, 3.063869);
		player:GossipComplete();
	elseif(intid == 998)then
		OnGossipHello(event, player, object, unit)
	elseif(intid == 999)then
		player:GossipComplete();
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
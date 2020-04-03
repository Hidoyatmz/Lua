local NpcSpellVendor = 100017
local TokenID = 21215

local function OnGossipHello(event, player, object, unit)
	local pRace = player:GetRaceAsString(2)
	local pName = player:GetName();
	local class = player:GetClass();
	player:GossipClearMenu();

	if(player:IsAlliance())then
		pFactionTP = "Alliance";
	else
		pFactionTP = "Horde";
	end

	local pLevel = player:GetLevel();

	if(pLevel >= 80)then
		Query = WorldDBQuery('SELECT * FROM npc_teleporter WHERE faction = "All" AND parentgroup = "0" AND active = 1;')
		Query2 = WorldDBQuery('SELECT * FROM npc_teleporter WHERE faction = "VIP" AND parentgroup = "0" AND active = 1;')
		Query3 = WorldDBQuery('SELECT * FROM npc_teleporter WHERE faction = "'..pFactionTP..'" AND parentgroup = "0" AND active = 1;')

			if(Query3) then
				repeat
					local row3 = {
						icon 				= Query3:GetString(0),
						name 				= Query3:GetString(1),
						faction 			= Query3:GetString(9),
						id 			= Query3:GetUInt32(10)
					}

					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row3.icon .. ":40:40:-22:0|t " .. row3.name, 1, row3.id)

				until not Query3:NextRow()
			end

			if(Query2) then
				repeat
					local row2 = {
						icon 				= Query2:GetString(0),
						name 				= Query2:GetString(1),
						faction 			= Query2:GetString(9),
						id 			= Query2:GetUInt32(10)
					}

					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row2.icon .. ":40:40:-22:0|t " .. row2.name, 1, row2.id)

				until not Query2:NextRow()
			end
			if(Query) then
				repeat
					local row = {
						icon 				= Query:GetString(0),
						name 				= Query:GetString(1),
						faction 			= Query:GetString(9),
						id 			= Query:GetUInt32(10)
					}

					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.name, 1, row.id)

				until not Query:NextRow()
			end
		player:GossipSetText("Bonjour " .. pName .. ", où souhaitez-vous aller ?" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	else
		player:GossipSetText("Bonjour " .. pName .. ", vous devez être niveau 80 pour pouvoir vous téléporter ailleurs qu'en zone XP." )
		player:GossipMenuAddItem(0, "Retourner à la zone xp.", 1, 995)
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	end
end

local function OnClickTeleport(event, player, object, sender, intid, code, menuid)
	local pName = player:GetName();
	if(intid == 995)then
		player:Teleport(1, -6541.454102, 2853.834473, 2.278454, 1.501072);
	elseif(intid == 3)then
		Query4 = WorldDBQuery('SELECT * FROM npc_teleporter WHERE faction = "All" AND parentgroup = "1" AND active = 1;')
		player:GossipClearMenu();
		if(Query4) then
			repeat
				local row4 = {
					icon 				= Query4:GetString(0),
					name 				= Query4:GetString(1),
					faction 			= Query4:GetString(9),
					id 			= Query4:GetUInt32(10)
				}

				player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row4.icon .. ":40:40:-22:0|t " .. row4.name, 1, row4.id)

			until not Query4:NextRow()
		end
		player:GossipMenuAddItem(0, "Retour", 1, 999)
		player:GossipSetText("Bonsoir " .. pName .. ", où souhaitez-vous aller ?" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 2)then
		Query4 = WorldDBQuery('SELECT * FROM npc_teleporter WHERE faction = "All" AND parentgroup = "2" AND active = 1 ORDER BY name ASC;')
		player:GossipClearMenu();
		if(Query4) then
			repeat
				local row4 = {
					icon 				= Query4:GetString(0),
					name 				= Query4:GetString(1),
					faction 			= Query4:GetString(9),
					id 			= Query4:GetUInt32(10)
				}

				player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row4.icon .. ":40:40:-22:0|t " .. row4.name, 1, row4.id)

			until not Query4:NextRow()
		end
		player:GossipMenuAddItem(0, "Retour", 1, 999)
		player:GossipSetText("Bonsoir " .. pName .. ", où souhaitez-vous aller ?" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 19)then
		Query4 = WorldDBQuery('SELECT * FROM npc_teleporter WHERE faction = "All" AND parentgroup = "3" AND active = 1;')
		player:GossipClearMenu();
		if(Query4) then
			repeat
				local row4 = {
					icon 				= Query4:GetString(0),
					name 				= Query4:GetString(1),
					faction 			= Query4:GetString(9),
					id 			= Query4:GetUInt32(10)
				}

				player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row4.icon .. ":40:40:-22:0|t " .. row4.name, 1, row4.id)

			until not Query4:NextRow()
		end
		player:GossipMenuAddItem(0, "Retour", 1, 999)
		player:GossipSetText("Bonsoir " .. pName .. ", où souhaitez-vous aller ?" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 24)then
		Query4 = WorldDBQuery('SELECT * FROM npc_teleporter WHERE faction = "All" AND parentgroup = "4" AND active = 1;')
		player:GossipClearMenu();
		if(Query4) then
			repeat
				local row4 = {
					icon 				= Query4:GetString(0),
					name 				= Query4:GetString(1),
					faction 			= Query4:GetString(9),
					id 			= Query4:GetUInt32(10)
				}

				player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row4.icon .. ":40:40:-22:0|t " .. row4.name, 1, row4.id)

			until not Query4:NextRow()
		end
		player:GossipMenuAddItem(0, "Retour", 1, 999)
		player:GossipSetText("Bonsoir " .. pName .. ", où souhaitez-vous aller ?" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 999)then
		OnGossipHello(event, player, object, unit);
	else
		QueryTP = WorldDBQuery('SELECT map, x, y, z, o FROM npc_teleporter WHERE id = "'..intid..'";');
		local rowtp = {
			map 		= QueryTP:GetString(0),
			x 			= QueryTP:GetString(1),
			y 			= QueryTP:GetString(2),
			z 			= QueryTP:GetString(3),
			o 			= QueryTP:GetString(4)
		}
		player:Dismount();
		player:Teleport(rowtp.map, rowtp.x, rowtp.y, rowtp.z, rowtp.o);
	end
end

RegisterCreatureGossipEvent(NpcSpellVendor, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcSpellVendor, 2, OnClickTeleport)


local console = debug.getinfo (1, "S").short_src;
print("- "..console);
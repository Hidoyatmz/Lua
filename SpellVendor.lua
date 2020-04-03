local NpcSpellVendor = 100012
local TokenID = 3000002

local function OnGossipHello(event, player, object, unit)
	local pRace = player:GetRaceAsString(2)
	local pName = player:GetName();
	local class = player:GetClass();
	player:GossipClearMenu();
	if(class ~= 1) then player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Warrior_Warbringer:40:40:-22:0|t Guerrier", 1, 101) end
	if(class ~= 2) then player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Paladin_SheathofLight:40:40:-22:0|t Paladin", 1, 102) end
	if(class ~= 3) then player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Hunter_ZenArchery:40:40:-22:0|t Chasseur", 1, 103) end
	if(class ~= 4) then player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Rogue_Waylay:40:40:-22:0|t Voleur", 1, 104) end
	if(class ~= 5) then player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Shadow_ShadowPower:40:40:-22:0|t Prêtre", 1, 105) end
	if(class ~= 6) then player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_DeathKnight_FrozenRuneWeapon:40:40:-22:0|t Chevalier de la mort", 1, 106) end
	if(class ~= 7) then player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Shaman_StaticShock:40:40:-22:0|t Chaman", 1, 107) end
	if(class ~= 8) then player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Mage_ShatterShield:40:40:-22:0|t Mage", 1, 108) end
	if(class ~= 9) then player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Warlock_FireandBrimstone:40:40:-22:0|t Démoniste", 1, 109) end
	if(class ~= 11) then player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Druid_TigersRoar:40:40:-22:0|t Druide", 1, 111) end
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Achievement_Dungeon_ClassicRaider:40:40:-22:0|t Hors classe", 1, 110)
	player:GossipSetText("De quelle classe souhaitez-vous acheter un sort ?" )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnClassSelect(event, player, object, sender, intid, code, menuid)
	if(intid == 101) then 
		player:GossipMenuAddItem(0, "Retour", 1, 1)
		Query = WorldDBQuery("SELECT * FROM spellvendor WHERE classid = 1 ORDER BY prix DESC;")
		if(Query) then
			repeat
				local row = {
					spellid 	= Query:GetUInt32(0),
					prix 		= Query:GetUInt32(1),
					refund 		= Query:GetUInt32(2),
					spellname 	= Query:GetString(3),
					icon 		= Query:GetString(4),
					desc 		= Query:GetString(5),
				}
				if(player:HasItem(TokenID, row.prix)) then
					row.prix = "|cff337935[" .. row.prix .. " jetons]|r";
				else
					row.prix = "|cffb12f2f[" .. row.prix .. " jetons]|r";
				end
				if(player:HasSpell(row.spellid) == false) then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.spellname .. " " .. row.prix, 1, row.spellid, false, row.desc)
				end
			until not Query:NextRow()
		end
    	player:GossipSetText("Voici les sorts du Guerrier disponible" )
    	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 102) then 
		player:GossipMenuAddItem(0, "Retour", 1, 1)
		Query = WorldDBQuery("SELECT * FROM spellvendor WHERE classid = 2 ORDER BY prix DESC;")
		if(Query) then
			repeat
				local row = {
					spellid 	= Query:GetUInt32(0),
					prix 		= Query:GetUInt32(1),
					refund 		= Query:GetUInt32(2),
					spellname 	= Query:GetString(3),
					icon 		= Query:GetString(4),
					desc 		= Query:GetString(5),
				}
				if(player:HasItem(TokenID, row.prix)) then
					row.prix = "|cff337935[" .. row.prix .. " jetons]|r";
				else
					row.prix = "|cffb12f2f[" .. row.prix .. " jetons]|r";
				end
				if(player:HasSpell(row.spellid) == false) then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.spellname .. " " .. row.prix, 1, row.spellid, false, row.desc)
				end
			until not Query:NextRow()
		end
    	player:GossipSetText("Voici les sorts du Paladin disponible" )
    	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 103) then 
		player:GossipMenuAddItem(0, "Retour", 1, 1)
		Query = WorldDBQuery("SELECT * FROM spellvendor WHERE classid = 3 ORDER BY prix DESC;")
		if(Query) then
			repeat
				local row = {
					spellid 	= Query:GetUInt32(0),
					prix 		= Query:GetUInt32(1),
					refund 		= Query:GetUInt32(2),
					spellname 	= Query:GetString(3),
					icon 		= Query:GetString(4),
					desc 		= Query:GetString(5),
				}
				if(player:HasItem(TokenID, row.prix)) then
					row.prix = "|cff337935[" .. row.prix .. " jetons]|r";
				else
					row.prix = "|cffb12f2f[" .. row.prix .. " jetons]|r";
				end
				if(player:HasSpell(row.spellid) == false) then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.spellname .. " " .. row.prix, 1, row.spellid, false, row.desc)
				end
			until not Query:NextRow()
		end
    	player:GossipSetText("Voici les sorts du Chasseur disponible" )
    	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 104) then 
		player:GossipMenuAddItem(0, "Retour", 1, 1)
		Query = WorldDBQuery("SELECT * FROM spellvendor WHERE classid = 4 ORDER BY prix DESC;")
		if(Query) then
			repeat
				local row = {
					spellid 	= Query:GetUInt32(0),
					prix 		= Query:GetUInt32(1),
					refund 		= Query:GetUInt32(2),
					spellname 	= Query:GetString(3),
					icon 		= Query:GetString(4),
					desc 		= Query:GetString(5),
				}
				if(player:HasItem(TokenID, row.prix)) then
					row.prix = "|cff337935[" .. row.prix .. " jetons]|r";
				else
					row.prix = "|cffb12f2f[" .. row.prix .. " jetons]|r";
				end
				if(player:HasSpell(row.spellid) == false) then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.spellname .. " " .. row.prix, 1, row.spellid, false, row.desc)
				end
			until not Query:NextRow()
		end
    	player:GossipSetText("Voici les sorts du Voleur disponible" )
    	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 105) then 
		player:GossipMenuAddItem(0, "Retour", 1, 1)
		Query = WorldDBQuery("SELECT * FROM spellvendor WHERE classid = 5 ORDER BY prix DESC;")
		if(Query) then
			repeat
				local row = {
					spellid 	= Query:GetUInt32(0),
					prix 		= Query:GetUInt32(1),
					refund 		= Query:GetUInt32(2),
					spellname 	= Query:GetString(3),
					icon 		= Query:GetString(4),
					desc 		= Query:GetString(5),
				}
				if(player:HasItem(TokenID, row.prix)) then
					row.prix = "|cff337935[" .. row.prix .. " jetons]|r";
				else
					row.prix = "|cffb12f2f[" .. row.prix .. " jetons]|r";
				end
				if(player:HasSpell(row.spellid) == false) then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.spellname .. " " .. row.prix, 1, row.spellid, false, row.desc)
				end
			until not Query:NextRow()
		end
    	player:GossipSetText("Voici les sorts du Prêtre disponible" )
    	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 106) then 
		player:GossipMenuAddItem(0, "Retour", 1, 1)
		Query = WorldDBQuery("SELECT * FROM spellvendor WHERE classid = 6 ORDER BY prix DESC;")
		if(Query) then
			repeat
				local row = {
					spellid 	= Query:GetUInt32(0),
					prix 		= Query:GetUInt32(1),
					refund 		= Query:GetUInt32(2),
					spellname 	= Query:GetString(3),
					icon 		= Query:GetString(4),
					desc 		= Query:GetString(5),
				}
				if(player:HasItem(TokenID, row.prix)) then
					row.prix = "|cff337935[" .. row.prix .. " jetons]|r";
				else
					row.prix = "|cffb12f2f[" .. row.prix .. " jetons]|r";
				end
				if(player:HasSpell(row.spellid) == false) then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.spellname .. " " .. row.prix, 1, row.spellid, false, row.desc)
				end
			until not Query:NextRow()
		end
    	player:GossipSetText("Voici les sorts du Chevalier de la mort disponible" )
    	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 107) then 
		player:GossipMenuAddItem(0, "Retour", 1, 1)
		Query = WorldDBQuery("SELECT * FROM spellvendor WHERE classid = 7 ORDER BY prix DESC;")
		if(Query) then
			repeat
				local row = {
					spellid 	= Query:GetUInt32(0),
					prix 		= Query:GetUInt32(1),
					refund 		= Query:GetUInt32(2),
					spellname 	= Query:GetString(3),
					icon 		= Query:GetString(4),
					desc 		= Query:GetString(5),
				}
				if(player:HasItem(TokenID, row.prix)) then
					row.prix = "|cff337935[" .. row.prix .. " jetons]|r";
				else
					row.prix = "|cffb12f2f[" .. row.prix .. " jetons]|r";
				end
				if(player:HasSpell(row.spellid) == false) then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.spellname .. " " .. row.prix, 1, row.spellid, false, row.desc)
				end
			until not Query:NextRow()
		end
    	player:GossipSetText("Voici les sorts du Chaman disponible" )
    	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 108) then 
		player:GossipMenuAddItem(0, "Retour", 1, 1)
		Query = WorldDBQuery("SELECT * FROM spellvendor WHERE classid = 8 ORDER BY prix DESC;")
		if(Query) then
			repeat
				local row = {
					spellid 	= Query:GetUInt32(0),
					prix 		= Query:GetUInt32(1),
					refund 		= Query:GetUInt32(2),
					spellname 	= Query:GetString(3),
					icon 		= Query:GetString(4),
					desc 		= Query:GetString(5),
				}
				if(player:HasItem(TokenID, row.prix)) then
					row.prix = "|cff337935[" .. row.prix .. " jetons]|r";
				else
					row.prix = "|cffb12f2f[" .. row.prix .. " jetons]|r";
				end
				if(player:HasSpell(row.spellid) == false) then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.spellname .. " " .. row.prix, 1, row.spellid, false, row.desc)
				end
			until not Query:NextRow()
		end
    	player:GossipSetText("Voici les sorts du Mage disponible" )
    	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 109) then 
		player:GossipMenuAddItem(0, "Retour", 1, 1)
		Query = WorldDBQuery("SELECT * FROM spellvendor WHERE classid = 9 ORDER BY prix DESC;")
		if(Query) then
			repeat
				local row = {
					spellid 	= Query:GetUInt32(0),
					prix 		= Query:GetUInt32(1),
					refund 		= Query:GetUInt32(2),
					spellname 	= Query:GetString(3),
					icon 		= Query:GetString(4),
					desc 		= Query:GetString(5),
				}
				if(player:HasItem(TokenID, row.prix)) then
					row.prix = "|cff337935[" .. row.prix .. " jetons]|r";
				else
					row.prix = "|cffb12f2f[" .. row.prix .. " jetons]|r";
				end
				if(player:HasSpell(row.spellid) == false) then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.spellname .. " " .. row.prix, 1, row.spellid, false, row.desc)
				end
			until not Query:NextRow()
		end
    	player:GossipSetText("Voici les sorts du Démoniste disponible" )
    	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 111) then 
		player:GossipMenuAddItem(0, "Retour", 1, 1)
		Query = WorldDBQuery("SELECT * FROM spellvendor WHERE classid = 11 ORDER BY prix DESC;")
		if(Query) then
			repeat
				local row = {
					spellid 	= Query:GetUInt32(0),
					prix 		= Query:GetUInt32(1),
					refund 		= Query:GetUInt32(2),
					spellname 	= Query:GetString(3),
					icon 		= Query:GetString(4),
					desc 		= Query:GetString(5),
				}
				if(player:HasItem(TokenID, row.prix)) then
					row.prix = "|cff337935[" .. row.prix .. " jetons]|r";
				else
					row.prix = "|cffb12f2f[" .. row.prix .. " jetons]|r";
				end
				if(player:HasSpell(row.spellid) == false) then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.spellname .. " " .. row.prix, 1, row.spellid, false, row.desc)
				end
			until not Query:NextRow()
		end
    	player:GossipSetText("Voici les sorts du Druide disponible" )
    	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 110) then 
		player:GossipMenuAddItem(0, "Retour", 1, 1)
		Query = WorldDBQuery("SELECT * FROM spellvendor WHERE classid = 10 ORDER BY prix DESC;")
		if(Query) then
			repeat
				local row = {
					spellid 	= Query:GetUInt32(0),
					prix 		= Query:GetUInt32(1),
					refund 		= Query:GetUInt32(2),
					spellname 	= Query:GetString(3),
					icon 		= Query:GetString(4),
					desc 		= Query:GetString(5),
				}
				if(player:HasItem(TokenID, row.prix)) then
					row.prix = "|cff337935[" .. row.prix .. " jetons]|r";
				else
					row.prix = "|cffb12f2f[" .. row.prix .. " jetons]|r";
				end
				if(player:HasSpell(row.spellid) == false) then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\" .. row.icon .. ":40:40:-22:0|t " .. row.spellname .. " " .. row.prix, 1, row.spellid, false, row.desc)
				end
			until not Query:NextRow()
		end
    	player:GossipSetText("Voici les sorts hors classe disponible" )
    	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    elseif(intid == 1) then
    	OnGossipHello(event, player, object)
    else
    	Query = WorldDBQuery("SELECT prix, spellname FROM spellvendor WHERE spellid = " .. intid .. ";");
		if(Query) then
			if(player:HasSpell(intid)) then
				player:SendBroadcastMessage("Vous possédez déjà ce sort...");
				player:GossipComplete();
				return false;
			end

			if(player:HasItem(TokenID, Query:GetUInt32(0))) then
				local pGuid = player:GetGUIDLow();
				Query2 = WorldDBQuery("SELECT spells, maxspells FROM userspells WHERE guid = " .. pGuid .. ";");
				if(Query2) then
					player:GossipComplete();
					local spells = Query2:GetUInt32(0);
					local maxspells = GetPlayerMaxSpell(pGuid);
					if(spells >= maxspells)then
						player:SendBroadcastMessage("|cffb12f2fVous avez atteint vos "..maxspells.." spells sur ce personnage, vous pouvez augmenter ce nombres par divers moyens.|r");
						return false;
					end
					QueryU = WorldDBExecute("UPDATE userspells SET spells = spells + 1 WHERE guid = " .. pGuid ..";");
					player:SendBroadcastMessage("|cff337935Vous venez d'acheter le sort " .. Query:GetString(1));
					player:LearnSpell(intid);
					player:RemoveItem(TokenID, Query:GetUInt32(0));
				else
					QueryI = WorldDBExecute("INSERT INTO userspells(guid, spells, maxspells) VALUES(" .. pGuid ..", 1, 8);");
					player:SendBroadcastMessage("|cff337935Vous venez d'acheter le sort " .. Query:GetString(1));
					player:LearnSpell(intid);
					player:RemoveItem(TokenID, Query:GetUInt32(0));
					player:GossipComplete();
				end
			else
				player:SendBroadcastMessage("|cffb12f2fVous n'avez pas assez de jetons pour acheter " .. Query:GetString(1));
				player:GossipComplete();
			end
		end
	end
end

RegisterCreatureGossipEvent(NpcSpellVendor, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcSpellVendor, 2, OnClassSelect)


local console = debug.getinfo (1, "S").short_src;
print("- "..console);
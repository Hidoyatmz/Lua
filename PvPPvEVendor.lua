local NPC = 101067

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
		player:GossipClearMenu();
		player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_dungeon_coablackdragonflight_normal:40:40:-22:0|t PvP II.5", 1, 1);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_dungeon_nexusraid_heroic:40:40:-22:0|t PvE III.5", 1, 2);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_dungeon_nexusraid_heroic:40:40:-22:0|t PvE V", 1, 3);
		player:GossipMenuAddItem(0, "Partir...", 1, 999);
		player:GossipSetText("Vous cherchez une armure pour combattre votre faction ennemie ? Vous êtes au bon endroit ! Dites-moi, que voulez vous ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code)
	local pName = player:GetName();
	if(intid == 1)then
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\INV_Helmet_Plate_ChallengePaladin_D_01:40:40:-22:0|t Armure", 1, 8);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_sword_2h_artifactashbringer_d_01:40:40:-22:0|t Arme", 1, 9);
		player:GossipSetText("Vous cherchez une armure pour combattre votre faction ennemie ? Vous êtes au bon endroit ! Dites-moi, que voulez vous ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 8)then
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Druid_TigersRoar:40:40:-22:0|t Druide", 1, 10);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Hunter_ZenArchery:40:40:-22:0|t Chasseur", 1, 11);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Mage_ShatterShield:40:40:-22:0|t Mage", 1, 12);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Paladin_SheathofLight:40:40:-22:0|t Paladin", 1, 13);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Rogue_Waylay:40:40:-22:0|t Voleur", 1, 14);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Warlock_FireandBrimstone:40:40:-22:0|t Démoniste", 1, 15);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Warrior_Warbringer:40:40:-22:0|t Guerrier", 1, 16);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_DeathKnight_FrozenRuneWeapon:40:40:-22:0|t Chevalier de la mort", 1, 17);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Shadow_ShadowPower:40:40:-22:0|t Prêtre", 1, 18);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Shaman_StaticShock:40:40:-22:0|t Chaman", 1, 19);
		player:GossipSetText("Vous cherchez une armure pour combattre votre faction ennemie ? Vous êtes au bon endroit ! Dites-moi, que voulez vous ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 9)then
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_sword_24:40:40:-22:0|t A une main", 1, 100);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_hammer_10:40:40:-22:0|t A deux mains", 1, 110);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_weapon_rifle_02:40:40:-22:0|t A distance", 1, 120);
		player:GossipSetText("Vous cherchez une armure pour combattre votre faction ennemie ? Vous êtes au bon endroit ! Dites-moi, que voulez vous ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 2)then
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Druid_TigersRoar:40:40:-22:0|t Druide", 1, 20);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Hunter_ZenArchery:40:40:-22:0|t Chasseur", 1, 21);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Mage_ShatterShield:40:40:-22:0|t Mage", 1, 22);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Paladin_SheathofLight:40:40:-22:0|t Paladin", 1, 23);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Rogue_Waylay:40:40:-22:0|t Voleur", 1, 24);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Warlock_FireandBrimstone:40:40:-22:0|t Démoniste", 1, 25);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Warrior_Warbringer:40:40:-22:0|t Guerrier", 1, 26);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_DeathKnight_FrozenRuneWeapon:40:40:-22:0|t Chevalier de la mort", 1, 27);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Shadow_ShadowPower:40:40:-22:0|t Prêtre", 1, 28);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Shaman_StaticShock:40:40:-22:0|t Chaman", 1, 29);
		player:GossipSetText("Vous cherchez une armure pour combattre votre faction ennemie ? Vous êtes au bon endroit ! Dites-moi, que voulez vous ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 3)then
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\INV_Helmet_Plate_ChallengePaladin_D_01:40:40:-22:0|t Armure", 1, 51);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_sword_2h_artifactashbringer_d_01:40:40:-22:0|t Arme", 1, 50);
		player:GossipSetText("Vous cherchez une armure pour combattre votre faction ennemie ? Vous êtes au bon endroit ! Dites-moi, que voulez vous ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 51)then
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Druid_TigersRoar:40:40:-22:0|t Druide", 1, 30);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Hunter_ZenArchery:40:40:-22:0|t Chasseur", 1, 31);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Mage_ShatterShield:40:40:-22:0|t Mage", 1, 32);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Paladin_SheathofLight:40:40:-22:0|t Paladin", 1, 33);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Rogue_Waylay:40:40:-22:0|t Voleur", 1, 34);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Warlock_FireandBrimstone:40:40:-22:0|t Démoniste", 1, 35);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Warrior_Warbringer:40:40:-22:0|t Guerrier", 1, 36);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_DeathKnight_FrozenRuneWeapon:40:40:-22:0|t Chevalier de la mort", 1, 37);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Shadow_ShadowPower:40:40:-22:0|t Prêtre", 1, 38);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Shaman_StaticShock:40:40:-22:0|t Chaman", 1, 39);
		player:GossipSetText("Vous cherchez une armure pour combattre votre faction ennemie ? Vous êtes au bon endroit ! Dites-moi, que voulez vous ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 50)then
		player:GossipMenuAddItem(0, "Retour...", 1, 998);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_sword_24:40:40:-22:0|t A une main", 1, 300);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_hammer_10:40:40:-22:0|t A deux mains", 1, 310);
		player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_weapon_rifle_02:40:40:-22:0|t A distance", 1, 320);
		player:GossipSetText("Vous cherchez une armure pour combattre votre faction ennemie ? Vous êtes au bon endroit ! Dites-moi, que voulez vous ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 10)then
		player:SendListInventory(object, 98502);
	elseif(intid == 11)then
		player:SendListInventory(object, 98505);
	elseif(intid == 12)then
		player:SendListInventory(object, 98509);
	elseif(intid == 13)then
		player:SendListInventory(object, 98507);
	elseif(intid == 14)then
		player:SendListInventory(object, 98503);
	elseif(intid == 15)then
		player:SendListInventory(object, 98501);
	elseif(intid == 16)then
		player:SendListInventory(object, 98508);
	elseif(intid == 17)then
		player:SendListInventory(object, 98506);
	elseif(intid == 18)then
		player:SendListInventory(object, 98500);
	elseif(intid == 19)then
		player:SendListInventory(object, 98504);
	elseif(intid == 100)then
		player:SendListInventory(object, 98510);
	elseif(intid == 110)then
		player:SendListInventory(object, 98511);
	elseif(intid == 120)then
		player:SendListInventory(object, 98512);
	elseif(intid == 20)then
		player:SendListInventory(object, 98515);
	elseif(intid == 21)then
		player:SendListInventory(object, 98518);
	elseif(intid == 22)then
		player:SendListInventory(object, 98522);
	elseif(intid == 23)then
		player:SendListInventory(object, 98520);
	elseif(intid == 24)then
		player:SendListInventory(object, 98516);
	elseif(intid == 25)then
		player:SendListInventory(object, 98514);
	elseif(intid == 26)then
		player:SendListInventory(object, 98521);
	elseif(intid == 27)then
		player:SendListInventory(object, 98519);
	elseif(intid == 28)then
		player:SendListInventory(object, 98513);
	elseif(intid == 29)then
		player:SendListInventory(object, 98517);
	elseif(intid == 30)then
		player:SendListInventory(object, 99512);
	elseif(intid == 31)then
		player:SendListInventory(object, 99500);
	elseif(intid == 32)then
		player:SendListInventory(object, 99501);
	elseif(intid == 33)then
		player:SendListInventory(object, 99502);
	elseif(intid == 34)then
		player:SendListInventory(object, 99503);
	elseif(intid == 35)then
		player:SendListInventory(object, 99504);
	elseif(intid == 36)then
		player:SendListInventory(object, 99505);
	elseif(intid == 37)then
		player:SendListInventory(object, 99506);
	elseif(intid == 38)then
		player:SendListInventory(object, 99507);
	elseif(intid == 39)then
		player:SendListInventory(object, 99508);
	elseif(intid == 300)then
		player:SendListInventory(object, 99509);
	elseif(intid == 310)then
		player:SendListInventory(object, 99510);
	elseif(intid == 320)then
		player:SendListInventory(object, 99511);
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
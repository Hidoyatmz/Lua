local NPC = 75010

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
		player:GossipClearMenu();
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
		player:GossipMenuAddItem(0, "Partir...", 1, 999);
		player:GossipSetText("Vous cherchez une armure pour combattre votre faction ennemie ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code)
	local pName = player:GetName();
	if(intid == 10)then
		player:SendListInventory(object, 75003);
	elseif(intid == 11)then
		player:SendListInventory(object, 75006);
	elseif(intid == 12)then
		player:SendListInventory(object, 75001);
	elseif(intid == 13)then
		player:SendListInventory(object, 75008);
	elseif(intid == 14)then
		player:SendListInventory(object, 75004);
	elseif(intid == 15)then
		player:SendListInventory(object, 75002);
	elseif(intid == 16)then
		player:SendListInventory(object, 75009);
	elseif(intid == 17)then
		player:SendListInventory(object, 75007);
	elseif(intid == 18)then
		player:SendListInventory(object, 75000);
	elseif(intid == 19)then
		player:SendListInventory(object, 75005);
	elseif(intid == 999)then
		player:GossipComplete();
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
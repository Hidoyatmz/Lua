local npcid = 101036
local JetonID = 3000011

function profession_gossip(unit, player, object, unit)
    local pName = player:GetName();
    player:GossipClearMenu();
    player:GossipMenuAddItem(0, "|TInterface\\icons\\INV_Misc_ScrewDriver_02:40:40:-22:0|t Professions ->|r", 0, 1)
    player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_reputation_01:40:40:-22:0|t Partir...|r", 0, 999)
    player:GossipSetText("Bonjour " .. pName .. "." )
    player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end
 
function profession_select(event, player, object, unit, intid)
    local pName = player:GetName();

    if (intid == 1) then
        player:GossipMenuAddItem(0, "|TInterface\\icons\\trade_alchemy:40:40:-22:0|t Alchimie|r", 0, 10)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\INV_Ingot_05:40:40:-22:0|t Forge|r", 0, 13)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\INV_Misc_LeatherScrap_02:40:40:-22:0|t Travail du cuir|r", 0, 16)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\INV_Fabric_Felcloth_Ebon:40:40:-22:0|t Tisseur|r", 0, 19)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_misc_wrench_01:40:40:-22:0|t Ingénieur|r", 0, 22)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\trade_engraving:40:40:-22:0|t Enchanteur|r", 0, 25)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_misc_gem_01:40:40:-22:0|t Joaillerie|r", 0, 28)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\INV_Scroll_08:40:40:-22:0|t Caligraphie|r", 0, 31)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\INV_Misc_Herb_07:40:40:-22:0|t Herboriste|r", 0, 34)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_misc_pelt_wolf_01:40:40:-22:0|t Dépeçeur|r", 0, 37)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\trade_mining:40:40:-22:0|t Mineur|r", 0, 40)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_misc_food_15:40:40:-22:0|t Cuisinier|r", 0, 43)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\spell_holy_sealofsacrifice:40:40:-22:0|t Premier secours|r", 0, 46)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\trade_fishing:40:40:-22:0|t Pêche|r", 0, 49)
        player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_ChargePositive:40:40:-22:0|t Utiliser 5000 jetons métiers pour augmenter mes métiers.|r", 0, 100)
        player:GossipSetText("Bonjour " .. pName .. ", souhaitez vous augmenter vos métiers niveau maximum ?\n\nCela vous coutera 5000 jetons métiers." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Alchemy
    if (intid == 10) then
        player:GossipMenuAddItem(0, "Apprendre Alchimie", 0, 11)
        player:GossipMenuAddItem(0, "Oublier Alchimie", 0, 12)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Blacksmithing
    if (intid == 13) then
        player:GossipMenuAddItem(0, "Apprendre Forge", 0, 14)
        player:GossipMenuAddItem(0, "Oublier Forge", 0, 15)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Leatherworking
    if (intid == 16) then
        player:GossipMenuAddItem(0, "Apprendre Travail du cuir", 0, 17)
        player:GossipMenuAddItem(0, "Oublier Travail du cuir", 0, 18)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Tailoring
    if (intid == 19) then
        player:GossipMenuAddItem(0, "Apprendre Tisseur", 0, 20)
        player:GossipMenuAddItem(0, "Oublier Tisseur", 0, 21)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Engineering
    if (intid == 22) then
        player:GossipMenuAddItem(0, "Apprendre Ingénieur", 0, 23)
        player:GossipMenuAddItem(0, "Oublier Ingénieur", 0, 24)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Enchanting
    if (intid == 25) then
        player:GossipMenuAddItem(0, "Apprendre Enchanteur", 0, 26)
        player:GossipMenuAddItem(0, "Oublier Enchanteur", 0, 27)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Jewelcrafting
    if (intid == 28) then
        player:GossipMenuAddItem(0, "Apprendre Joaillerie", 0, 29)
        player:GossipMenuAddItem(0, "Oublier Joaillerie", 0, 30)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Inscription
    if (intid == 31) then
        player:GossipMenuAddItem(0, "Apprendre Caligraphie", 0, 32)
        player:GossipMenuAddItem(0, "Oublier Caligraphie", 0, 33)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Herbalism
    if (intid == 34) then
        player:GossipMenuAddItem(0, "Apprendre Herboriste", 0, 35)
        player:GossipMenuAddItem(0, "Oublier Herboriste", 0, 36)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Skinning
    if (intid == 37) then
        player:GossipMenuAddItem(0, "Apprendre Dépeçeur", 0, 38)
        player:GossipMenuAddItem(0, "Oublier Dépeçeur", 0, 39)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Mining
    if (intid == 40) then
        player:GossipMenuAddItem(0, "Apprendre Mineur", 0, 41)
        player:GossipMenuAddItem(0, "Oublier Mineur", 0, 42)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Cooking
    if (intid == 43) then
        player:GossipMenuAddItem(0, "Apprendre Cuisinier", 0, 44)
        player:GossipMenuAddItem(0, "Oublier Cuisinier", 0, 45)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- First Aid
    if (intid == 46) then
        player:GossipMenuAddItem(0, "Apprendre Premier secours", 0, 47)
        player:GossipMenuAddItem(0, "Oublier Premier secours", 0, 48)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
    -- Fishing
    if (intid == 49) then
        player:GossipMenuAddItem(0, "Apprendre Pêche", 0, 50)
        player:GossipMenuAddItem(0, "Oublier Pêche", 0, 51)
        player:GossipMenuAddItem(0, "Retour", 0, 500)
        player:GossipSetText("Bonjour " .. pName .. "." )
        player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
    end
   
   
    -- ----- Learn/Unlearn ----- --
    -- Alchemy
    if (intid == 11) then   
        player:CastSpell(player, 51303, true)
        player:GossipComplete()
    end
    if (intid == 12) then
        player:RemoveSpell(51304)
        player:RemoveSpell(28596)
        player:RemoveSpell(11611)
        player:RemoveSpell(3464)
        player:RemoveSpell(3101)
        player:RemoveSpell(2259)
        player:GossipComplete()
    end
   
    -- Blacksmithing
    if (intid == 14) then
        player:CastSpell(player, 51298, true)
        player:GossipComplete()
    end
    if (intid == 15) then
        player:RemoveSpell(51300)
        player:RemoveSpell(29844)
        player:RemoveSpell(9785)
        player:RemoveSpell(3538)
        player:RemoveSpell(3100)
        player:RemoveSpell(2018)
        player:GossipComplete()
    end
 
    -- Leatherworking
    if (intid == 17) then
        player:CastSpell(player, 51301, true)
        player:GossipComplete()
    end
    if (intid == 18) then
        player:RemoveSpell(51302)
        player:RemoveSpell(32549)
        player:RemoveSpell(10662)
        player:RemoveSpell(3811)
        player:RemoveSpell(3104)
        player:RemoveSpell(2108)
        player:GossipComplete()
    end
 
    -- Tailoring
    if (intid == 20) then
        player:CastSpell(player, 51308, true)
        player:GossipComplete()
    end
    if (intid == 21) then
        player:RemoveSpell(51309)
        player:RemoveSpell(26790)
        player:RemoveSpell(12180)
        player:RemoveSpell(3910)
        player:RemoveSpell(3909)
        player:RemoveSpell(3908)
        player:GossipComplete()
    end
 
    -- Engineering
    if (intid == 23) then
        player:CastSpell(player, 51305, true)
        player:GossipComplete()
    end
    if (intid == 24) then
        player:RemoveSpell(51306)
        player:RemoveSpell(30350)
        player:RemoveSpell(12656)
        player:RemoveSpell(4038)
        player:RemoveSpell(4037)
        player:RemoveSpell(4036)
        player:GossipComplete()
    end
 
    -- Enchanting
    if (intid == 26) then
        player:CastSpell(player, 51312, true)
        player:GossipComplete()
    end
    if (intid == 27) then
        player:RemoveSpell(51313)
        player:RemoveSpell(28029)
        player:RemoveSpell(13920)
        player:RemoveSpell(7413)
        player:RemoveSpell(7412)
        player:RemoveSpell(7411)
        player:GossipComplete()
    end
 
    -- Jewelcrafting
    if (intid == 29) then
        player:CastSpell(player, 51310, true)
        player:GossipComplete()
    end
    if (intid == 30) then
        player:RemoveSpell(51311)
        player:RemoveSpell(28897)
        player:RemoveSpell(28895)
        player:RemoveSpell(28894)
        player:RemoveSpell(25230)
        player:RemoveSpell(25229)
        player:GossipComplete()
    end
 
    -- Inscription
    if (intid == 32) then
        player:CastSpell(player, 45380, true)
        player:GossipComplete()
    end
    if (intid == 33) then
        player:RemoveSpell(45363)
        player:RemoveSpell(45361)
        player:RemoveSpell(45360)
        player:RemoveSpell(45359)
        player:RemoveSpell(45358)
        player:RemoveSpell(45357)
        player:GossipComplete()
    end
 
    -- Herbalism
    if (intid == 35) then
        player:CastSpell(player, 50301, true)
        player:GossipComplete()
    end
    if (intid == 36) then
        player:RemoveSpell(50300)
        player:RemoveSpell(28695)
        player:RemoveSpell(11993)
        player:RemoveSpell(3570)
        player:RemoveSpell(2368)
        player:RemoveSpell(2366)
        player:GossipComplete()
    end
 
    -- Skinning
    if (intid == 38) then
        player:CastSpell(player, 50307, true)
        player:GossipComplete()
    end
    if (intid == 39) then
        player:RemoveSpell(50305)
        player:RemoveSpell(32678)
        player:RemoveSpell(10768)
        player:RemoveSpell(8618)
        player:RemoveSpell(8617)
        player:RemoveSpell(8613)
        player:GossipComplete()
    end
 
    -- Mining
    if (intid == 41) then
        player:CastSpell(player, 50309, true)
        player:GossipComplete()
    end
    if (intid == 42) then
        player:RemoveSpell(50310)
        player:RemoveSpell(29354)
        player:RemoveSpell(10248)
        player:RemoveSpell(3564)
        player:RemoveSpell(2576)
        player:RemoveSpell(2575)
        player:GossipComplete()
    end
   
    -- Cooking
    if (intid == 44) then
        player:CastSpell(player, 51295, true)
        player:GossipComplete()
    end
    if (intid == 45) then
        player:RemoveSpell(51296)
        player:RemoveSpell(33359)
        player:RemoveSpell(18260)
        player:RemoveSpell(3413)
        player:RemoveSpell(3102)
        player:RemoveSpell(2550)
        player:RemoveSpell(2550)
        player:GossipComplete()
    end
   
    -- First Aid
    if (intid == 47) then
        player:CastSpell(player, 50299, true)
        player:GossipComplete()
    end
    if (intid == 48) then
        player:RemoveSpell(45542)
        player:RemoveSpell(27028)
        player:RemoveSpell(10846)
        player:RemoveSpell(7924)
        player:RemoveSpell(3274)
        player:RemoveSpell(3273)
        player:GossipComplete()
    end
   
    -- Fishing
    if (intid == 50) then
        player:CastSpell(player, 51293, true)
        player:GossipComplete()
    end
    if (intid == 51) then
        player:RemoveSpell(51294)
        player:RemoveSpell(33095)
        player:RemoveSpell(18248)
        player:RemoveSpell(7732)
        player:RemoveSpell(7731)
        player:RemoveSpell(7620)
        player:GossipComplete()
    end
   
   
    -----------------------------------------------------
   
    if (intid == 100) then
        if(player:HasItem( JetonID, 5000, false ))then
            player:RemoveItem( JetonID, 5000 )
            player:AdvanceSkill(171, 450) -- Alchemy
            player:AdvanceSkill(164, 450) -- Blacksmithing
            player:AdvanceSkill(333, 450) -- Enchanting
            player:AdvanceSkill(202, 450) -- Engineering
            player:AdvanceSkill(182, 450) -- Herbalism
            player:AdvanceSkill(773, 450) -- Inscription
            player:AdvanceSkill(755, 450) -- Jewelcrafting
            player:AdvanceSkill(165, 450) -- Leatherworking
            player:AdvanceSkill(186, 450) -- Mining
            player:AdvanceSkill(393, 450) -- Skinning
            player:AdvanceSkill(197, 450) -- Tailoring
            player:AdvanceSkill(185, 450) -- Cooking
            player:AdvanceSkill(129, 450) -- First Aid
            player:AdvanceSkill(356, 450) -- Fishing
            player:GossipComplete()
        else
            player:GossipComplete();
            player:SendBroadcastMessage("Vous devez avoir 5000 jetons métier pour pouvoir augmenter vos métiers niveau maximum.");
        end
    end
   
    if (intid == 500) then
        profession_gossip(unit, player, object, unit)
    end
   
    if (intid == 999) then
        player:GossipComplete()
    end
end
 
RegisterCreatureGossipEvent(npcid, 1, profession_gossip)
RegisterCreatureGossipEvent(npcid, 2, profession_select)
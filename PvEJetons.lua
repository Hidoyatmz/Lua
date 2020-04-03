local NPC = 101023

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	Query = CharDBQuery("SELECT JT1, JT2, JT3, JT4, JMM FROM characters WHERE guid = " .. pGuid ..";")
		if(Query) then
			repeat
				local row = {
					jt1 	= Query:GetUInt32(0),
					jt2 		= Query:GetUInt32(1),
					jt3 		= Query:GetUInt32(2),
					jt4 	= Query:GetUInt32(3),
					jmm 		= Query:GetUInt32(4)
				}

				if(row.jt1 == 0)then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_BossFelOrcs_Necromancer_Purple:40:40:-22:0|t Clef T1", 1, 1)
				end
				if(row.jt2 == 0)then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_BossFelOrcs_Necromancer_Green:40:40:-22:0|t Clef T2", 1, 2)
				end
				if(row.jt3 == 0)then
					player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_BossFelOrcs_Necromancer_Orange:40:40:-22:0|t Clef T3", 1, 3)
				end
				-- if(row.jt4 == 0)then
				-- 	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_BossFelOrcs_Necromancer_Red:40:40:-22:0|t Clef T4", 1, 4)
				-- end
				-- if(row.jmm == 0)then
				-- 	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_BossFelOrcs_Necromancer_Blue:40:40:-22:0|t Clef Mythique", 1, 5)
				-- end 
			until not Query:NextRow()
		end
	player:GossipSetText("Bonsoir " .. pName .. ", souhaitez vous récuperer vos jetons d'accès PvE quotidien ?" )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
	local pGuid = player:GetGUIDLow();
	if(intid == 1)then
		CharDBExecute("UPDATE characters SET JT1 = 1 WHERE guid = " .. pGuid ..";")
		player:AddItem(3000004)
		player:GossipComplete()
	elseif(intid ==2)then
		CharDBExecute("UPDATE characters SET JT2 = 1 WHERE guid = " .. pGuid ..";")
		player:AddItem(3000005)
		player:GossipComplete()
	elseif(intid ==3)then
		CharDBExecute("UPDATE characters SET JT3 = 1 WHERE guid = " .. pGuid ..";")
		player:AddItem(3000006)
		player:GossipComplete()
	elseif(intid ==4)then
		CharDBExecute("UPDATE characters SET JT4 = 1 WHERE guid = " .. pGuid ..";")
		player:AddItem(3000007)
		player:GossipComplete()
	elseif(intid ==5)then
		CharDBExecute("UPDATE characters SET JMM = 1 WHERE guid = " .. pGuid ..";")
		player:AddItem(3000008)
		player:GossipComplete()
	end
	object:SendUnitWhisper("Tenez ! Voila votre clef.", 0, player, true)
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
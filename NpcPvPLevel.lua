require "Functions/Player/player";
local NpcPvPLevel = 101073;

local function PvPLevel(event, player, object)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	local pvplevel = GetPlayerPvPLevel(pGuid);
	local pvpxp = GetPlayerPvPXp(pGuid);
	local pvpnextxp = GetPlayerNextXpPvP(pGuid);
	local pvpnextlevel = pvplevel+1;
	local GetRequiresQuery = WorldDBQuery("SELECT * FROM pvp_level_requirements WHERE level = "..pvpnextlevel);
	if(GetRequiresQuery)then
		local row = {
						level 				= GetRequiresQuery:GetUInt32(0),
						item_requires_count = GetRequiresQuery:GetUInt32(1),
						xp_requires 		= GetRequiresQuery:GetUInt32(2),
						item1 				= GetRequiresQuery:GetUInt32(3),
						item1_count 		= GetRequiresQuery:GetUInt32(4),
						item2 				= GetRequiresQuery:GetUInt32(5),
						item2_count 		= GetRequiresQuery:GetUInt32(6),
						item3 				= GetRequiresQuery:GetUInt32(7),
						item3_count 		= GetRequiresQuery:GetUInt32(8),
						item_reward 		= GetRequiresQuery:GetUInt32(9),
						item_reward_count 	= GetRequiresQuery:GetUInt32(10),
						spell1_reward 		= GetRequiresQuery:GetUInt32(11),
						title1_reward 		= GetRequiresQuery:GetUInt32(12)
					}
		local item1_entry = row.item1;
		local item2_entry = row.item2;
		local item3_entry = row.item3;
		player:GossipMenuAddItem(0, "Exigences pour le prochain niveau:", 1, 0);
		player:GossipMenuAddItem(0, "Experience requise: "..pvpxp.."/"..row.xp_requires, 1, 0);
		--player:SendBroadcastMessage("Pour votre prochain niveau vous avez besoin des objets suivants:")
		if(item1_entry ~= 0)then
			local playerItem1Count = player:GetItemCount(item1_entry, false);
			local item1_name = GetItemLink(item1_entry, 2);
			--player:SendBroadcastMessage(item1_name.." "..playerItem1Count.."/"..row.item1_count);
			player:GossipMenuAddItem(0, item1_name.." "..playerItem1Count.."/"..row.item1_count, 1, 0);
		end
		if(item2_entry ~= 0)then
			local playerItem2Count = player:GetItemCount(item2_entry, false);
			local item2_name = GetItemLink(item2_entry, 2);
			--player:SendBroadcastMessage(item2_name.." "..playerItem2Count.."/"..row.item2_count);
			player:GossipMenuAddItem(0, item2_name.." "..playerItem2Count.."/"..row.item2_count, 1, 0);
		end
		if(item3_entry ~= 0)then
			local playerItem3Count = player:GetItemCount(item3_entry, false);
			local item3_name = GetItemLink(item3_entry, 2);
			--player:SendBroadcastMessage(item3_name.." "..playerItem3Count.."/"..row.item3_count);
			player:GossipMenuAddItem(0, item3_name.." "..playerItem3Count.."/"..row.item3_count, 1, 0);
		end
		player:GossipMenuAddItem(0, "|TInterface\\icons\\UI_Promotion_CharacterBoost:40:40:-22:0|t Passer au niveau : "..pvpnextlevel, 1, 1);
		player:GossipSetText("Bonjour "..pName.."\n\nNiveau suivant: "..pvpnextlevel);
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	else
		player:SendBroadcastMessage("Vous avez atteint le niveau maximum en PvP...")
	end
end

local function PvPlevelUp(event, player, object, sender, intid, code, menu_id)
	if(intid == 1)then
		local pName = player:GetName();
		local pGuid = player:GetGUIDLow();
		local pvplevel = GetPlayerPvPLevel(pGuid);
		local pvpxp = GetPlayerPvPXp(pGuid);
		local pvpnextxp = GetPlayerNextXpPvP(pGuid);
		local pvpnextlevel = pvplevel+1;
		local GetRequiresQuery = WorldDBQuery("SELECT * FROM pvp_level_requirements WHERE level = "..pvpnextlevel);
		local row = {
						level 				= GetRequiresQuery:GetUInt32(0),
						item_requires_count = GetRequiresQuery:GetUInt32(1),
						xp_requires 		= GetRequiresQuery:GetUInt32(2),
						item1 				= GetRequiresQuery:GetUInt32(3),
						item1_count 		= GetRequiresQuery:GetUInt32(4),
						item2 				= GetRequiresQuery:GetUInt32(5),
						item2_count 		= GetRequiresQuery:GetUInt32(6),
						item3 				= GetRequiresQuery:GetUInt32(7),
						item3_count 		= GetRequiresQuery:GetUInt32(8),
						item_reward 		= GetRequiresQuery:GetUInt32(9),
						item_reward_count 	= GetRequiresQuery:GetUInt32(10),
						spell1_reward 		= GetRequiresQuery:GetUInt32(11),
						title1_reward 		= GetRequiresQuery:GetUInt32(12)
					}
		if(pvpxp > row.xp_requires)then
			if(player:HasItem(row.item1, row.item1_count))then
				if(player:HasItem(row.item2, row.item2_count))then
					if(row.item3 ~= 0)then
						if(player:HasItem(row.item3, row.item3_count))then
							player:RemoveItem(row.item1, row.item1_count)
							player:RemoveItem(row.item2, row.item2_count)
							player:RemoveItem(row.item3, row.item3_count)
							UpdatePlayerPvPLevel(pGuid, 1);
							player:SendBroadcastMessage("Félicitation vous avez atteint le niveau "..pvpnextlevel.." en PvP.")
							player:AddItem(row.item_reward, row.item_reward_count);
							if(row.spell1_reward ~= 0)then
								player:LearnSpell(row.spell1_reward);
							end
							if(row.title1_reward ~= 0)then
								player:SetKnownTitle(row.title1_reward)
							end
						else
							player:RemoveItem(row.item1, row.item1_count)
							player:RemoveItem(row.item2, row.item2_count)
							player:SendBroadcastMessage("Vous n'avez pas les objets requis pour passer au prochain niveau.")
						end
					else
						player:AddItem(row.item_reward, row.item_reward_count);
						if(row.spell1_reward ~= 0)then
							player:LearnSpell(row.spell1_reward);
						end
						if(row.title1_reward ~= 0)then
							player:SetKnownTitle(row.title1_reward)
						end
						UpdatePlayerPvPLevel(pGuid, 1);
						player:SendBroadcastMessage("Félicitation vous avez atteint le niveau "..pvpnextlevel.." en PvP.")
					end
				else
					player:SendBroadcastMessage("Vous n'avez pas les objets requis pour passer au prochain niveau.")
				end
			else
				player:SendBroadcastMessage("Vous n'avez pas les objets requis pour passer au prochain niveau.")
			end
		else
			player:SendBroadcastMessage("Vous n'avez pas assez d'xp pvp pour passer au prochain niveau...")
		end
		player:GossipComplete();
	elseif(intid == 0)then
		PvPLevel(event, player, object)
	end
end

RegisterCreatureGossipEvent(NpcPvPLevel, 1, PvPLevel)
RegisterCreatureGossipEvent(NpcPvPLevel, 2, PvPlevelUp)
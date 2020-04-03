require "Functions/Player/player";
local NpcPvPLevel = 101075;
--[[
	// Enum Classes
	1 - Warrior
	2 - Paladin
	3 - Hunter
	4 - Rogue
	5 - Priest
	6 - Death Knight
	7 - Shaman
	8 - Mage
	9 - Warlock
	11 - Druid
]]--
local function PvPLevel(event, player, object)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	local mmKills = GetMMKills(pGuid);
	local chance = 0;
	for i=1,mmKills do
		chance = chance+20;
	end
	if(chance > 100)then
		chance = 100;
	end
	local daysoftheweek={"Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi"}
	local day=daysoftheweek[os.date("*t").wday]
	if(day == "Mercredi")then
		local pLevel = GetPlayerPvELevel(pGuid);
		if(pLevel >= 0)then
			player:GossipMenuAddItem(0, "Récuperer son objet mythique de la semaine (ou pas)", 1, 1);
		else
			player:GossipMenuAddItem(0, "Vous devez avoir un niveau PvE supérieur ou égal à 5.", 1, 2);
		end
	else
		player:GossipMenuAddItem(0, "Nous sommes "..day.." revenez mercredi prochain.", 1, 2);
	end
	player:GossipSetText("Bonjour "..pName.."\nCette semaine vous avez réalisé "..mmKills.." fois l'instance Mythique au complet.\n\nVous avez "..chance.."% de chance de gagner un objet mythique.");
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function PvPlevelUp(event, player, object, sender, intid, code, menu_id)
	if(intid == 1)then
		local pName = player:GetName();
		local pGuid = player:GetGUIDLow();
		local mmKills = GetMMKills(pGuid);
		local chance = 0;
		for i=1,mmKills do
			chance = chance+20;
		end
		if(chance > 100)then
			chance = 100;
		end
		if(HasRollMM(pGuid) == false)then
			local pRand = math.random(1, 100);
			SethasMM(pGuid);
			if(pRand <= chance)then
				player:SendBroadcastMessage("Félicitation "..pName.." vous avez gagné votre objet mythique !");
				local Items = {
					[1] = {2060025,2060024,2060023,2060022,2060021,2060020,2060019,2060018,2060017,2060016,2060015,2060014,2060013,2060012,2060011,2060010,2060009,2060008,2060007,2060006,2060005,2060004,2060003,2060001,2060000},
					[2] = {2160038,2160037,2160036,2160035,2160034,2160033,2160032,2160031,2160030,2160029,2160028,2160027,2160026,2160025,2160024,2160023,2160022,2160021,2160020,2160019,2160018,2160017,2160016,2160015,2160014,2160013,2160012,2160011,2160010,2160009,2160008,2160007,2160006,2160005,2160004,2160003,2160002,2160001,2160000},
					[3] = {2560012,2560011,2560010,2560009,2560008,2560007,2560006,2560005,2560004,2560003,2560002,2560001,2560000},
					[4] = {2360012,2360011,2360010,2360009,2360008,2360007,2360006,2360005,2360004,2360003,2360002,2360001,2360000,},
					[5] = {2961012,2961011,2961010,2961009,2961008,2961007,2961006,2961005,2961004,2961003,2961002,2961001,2961000,2960012,2960011,2960010,2960009,2960008,2960007,2960006,2960005,2960004,2960003,2960002,2960001,2960000},
					[6] = {2260025,2260024,2260023,2260022,2260021,2260020,2260019,2260018,2260017,2260016,2260015,2260014,2260013,2260012,2260011,2260010,2260009,2260008,2260007,2260006,2260005,2260004,2260003,2260002,2260001,2260000},
					[7] = {2662012,2662011,2662010,2662009,2662008,2662007,2662006,2662005,2662004,2662003,2662002,2662001,2662000,2661012,2661011,2661010,2661009,2661008,2661007,2661006,2661005,2661004,2661003,2661002,2661001,2661000,2660012,2660011,2660010,2660009,2660008,2660007,2660006,2660005,2660004,2660003,2660002,2660001,2660000},
					[8] = {2760012,2760011,2760010,2760009,2760008,2760007,2760006,2760005,2760004,2760003,2760002,2760001,2760000},
					[9] = {2860012,2860011,2860010,2860009,2860008,2860007,2860006,2860005,2860004,2860003,2860002,2860001,2860000},
					[11] = {2462012,2462011,2462010,2462009,2462008,2462007,2462006,2462005,2462004,2462003,2462002,2462001,2462000,2461012,2461011,2461010,2461009,2461008,2461007,2461006,2461005,2461004,2461003,2461002,2461001,2461000,2460012,2460011,2460010,2460009,2460008,2460007,2460006,2460005,2460004,2460003,2460002,2460001,2460000}
				}
				local pClass = player:GetClass();
				if(pClass == 1)then
					i = math.random(1,24);
				elseif(pClass == 2)then
					i = math.random(1,24);
				elseif(pClass == 3)then
					i = math.random(1,12);
				elseif(pClass == 4)then
					i = math.random(1,12);
				elseif(pClass == 5)then
					i = math.random(1,24);
				elseif(pClass == 6)then
					i = math.random(1,24);
				elseif(pClass == 7)then
					i = math.random(1,38);
				elseif(pClass == 8)then
					i = math.random(1,12);
				elseif(pClass == 9)then
					i = math.random(1,12);
				elseif(pClass == 11)then
					i = math.random(1,38);
				end
				player:AddItem(Items[pClass][i], 1)
			else
				player:SendBroadcastMessage("Pas de chance... vous n'avez pas eu votre objet mythique cette semaine.");
			end
		else
			player:SendBroadcastMessage("Vous avez déjà tenté votre chance cette semaine...");
		end
		player:GossipComplete();
	elseif(intid == 2)then
		PvPLevel(event, player, object)
	end
end

RegisterCreatureGossipEvent(NpcPvPLevel, 1, PvPLevel)
RegisterCreatureGossipEvent(NpcPvPLevel, 2, PvPlevelUp)
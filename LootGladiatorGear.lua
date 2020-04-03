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

local function LootGladiateurGear(event, killer, killed)
	if(killer:InBattleground() == true or killer:InArena() == true)then
		local pClass = killer:GetClass();
		local pGuid = killer:GetGUIDLow();
		local vGuid = killed:GetGUIDLow();
		if(vGuid == pGuid)then
			return false;
		end
		local Items = {
			[1] = {232512, 232511, 232510, 232509, 232508, 232507, 232506, 232505, 232504, 232503, 232502, 232501, 232500},
			[2] = {342512, 342511, 342510, 342509, 342508, 342507, 342506, 342505, 342504, 342503, 342502, 342501, 342500, 332512, 332511, 332510, 332509, 332508, 332507, 332506, 332505, 332504, 332503, 332502, 332501, 332500},
			[3] = {732512, 732511, 732510, 732509, 732508, 732507, 732506, 732505, 732504, 732503, 732502, 732501, 732500},
			[4] = {532512, 532511, 532510, 532509, 532508, 532507, 532506, 532505, 532504, 532503, 532502, 532501, 532500},
			[5] = {1232512, 1232511, 1232510, 1232509, 1232508, 1232507, 1232506, 1232505, 1232504, 1232503, 1232502, 1232501, 1232500, 1132512, 1132511, 1132510, 1132509, 1132508, 1132507, 1132506, 1132505, 1132504, 1132503, 1132502, 1132501, 1132500},
			[6] = {432512, 432511, 432510, 432509, 432508, 432507, 432506, 432505, 432504, 432503, 432502, 432501, 432500},
			[7] = {852512, 852511, 852510, 852509, 852508, 852507, 852506, 852505, 852504, 852503, 852502, 852501, 852500, 842512, 842511, 842510, 842509, 842508, 842507, 842506, 842505, 842504, 842503, 842502, 842501, 842500, 832512, 832511, 832510, 832509, 832508, 832507, 832506, 832505, 832504, 832503, 832502, 832501, 832500},
			[8] = {932512, 932511, 932510, 932509, 932508, 932507, 932506, 932505, 932504, 932503, 932502, 932501, 932500},
			[9] = {1032512, 1032511, 1032510, 1032509, 1032508, 1032507, 1032506, 1032505, 1032504, 1032503, 1032502, 1032501, 1032500},
			[11] = {652512, 652511, 652510, 652509, 652508, 652507, 652506, 652505, 652504, 652503, 652502, 652501, 652500, 642512, 642511, 642510, 642509, 642508, 642507, 642506, 642505, 642504, 642503, 642502, 642501, 642500, 632512, 632511, 632510, 632509, 632508, 632507, 632506, 632505, 632504, 632503, 632502, 632501, 632500}
		}
		local pRand = math.random(1,100)	
		if(pRand >= 99)then
			local pLevel = GetPlayerPvPLevel(pGuid)
			if(pLevel >= 5)then
				if(pClass == 1)then
					i = math.random(1,12);
				elseif(pClass == 2)then
					i = math.random(1,25);
				elseif(pClass == 3)then
					i = math.random(1,12);
				elseif(pClass == 4)then
					i = math.random(1,12);
				elseif(pClass == 5)then
					i = math.random(1,25);
				elseif(pClass == 6)then
					i = math.random(1,12);
				elseif(pClass == 7)then
					i = math.random(1,38);
				elseif(pClass == 8)then
					i = math.random(1,12);
				elseif(pClass == 9)then
					i = math.random(1,12);
				elseif(pClass == 11)then
					i = math.random(1,38);
				end
				killer:AddItem(Items[pClass][i], 1)
			end
		end
	end
end

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

local function LootPvP6Gear(event, killer, killed)
	if(killer:InBattleground() == true or killer:InArena() == true)then
		local Chance = 95;
		local pClass = killer:GetClass();
		local pGuid = killer:GetGUIDLow();
		local vGuid = killed:GetGUIDLow();
		if(vGuid == pGuid)then
			return false;
		end
		local Items = {
			[1] = {202512, 202511, 202510, 202509, 202508, 202507, 202506, 202505, 202504, 202503, 202502, 202501, 202500},
			[2] = {312512, 312511, 312510, 312509, 312508, 312507, 312506, 312505, 312504, 312503, 312502, 312501, 312500, 302512, 302511, 302510, 302509, 302508, 302507, 302506, 302505, 302504, 302503, 302502, 302501, 302500},
			[3] = {702512, 702511, 702510, 702509, 702508, 702507, 702506, 702505, 702504, 702503, 702502, 702501, 702500},
			[4] = {502512, 502511, 502510, 502509, 502508, 502507, 502506, 502505, 502504, 502503, 502502, 502501, 502500},
			[5] = {1190012, 1190011, 1190010, 1190009, 1190008, 1190007, 1190006, 1190005, 1190004, 1190003, 1190002, 1190001, 1190000, 1090012, 1090011, 1090010, 1090009, 1090008, 1090007, 1090006, 1090005, 1090004, 1090003, 1090002, 1090001, 1090000, 1195012, 1195011, 1195010, 1195009, 1195008, 1195007, 1195006, 1195005, 1195004, 1195003, 1195002, 1195001, 1195000, 1095012, 1095011, 1095010, 1095009, 1095008, 1095007, 1095006, 1095005, 1095004, 1095003, 1095002, 1095001, 1095000, 1202512, 1202511, 1202510, 1202509, 1202508, 1202507, 1202506, 1202505, 1202504, 1202503, 1202502, 1202501, 1202500, 1102512, 1102511, 1102510, 1102509, 1102508, 1102507, 1102506, 1102505, 1102504, 1102503, 1102502, 1102501, 1102500},
			[6] = {402512, 402511, 402510, 402509, 402508, 402507, 402506, 402505, 402504, 402503, 402502, 402501, 402500},
			[7] = {810012, 810011, 810010, 810009, 810008, 810007, 810006, 810005, 810004, 810003, 810002, 810001, 810000, 822512, 822511, 822510, 822509, 822508, 822507, 822506, 822505, 822504, 822503, 822502, 822501, 822500, 812512, 812511, 812510, 812509, 812508, 812507, 812506, 812505, 812504, 812503, 812502, 812501, 812500, 802512, 802511, 802510, 802509, 802508, 802507, 802506, 802505, 802504, 802503, 802502, 802501, 802500},
			[8] = {890012, 890011, 890010, 890009, 890008, 890007, 890006, 890005, 890004, 890003, 890002, 890001, 890000},
			[9] = {990012, 990011, 990010, 990009, 990008, 990007, 990006, 990005, 990004, 990003, 990002, 990001, 990000},
			[11] = {622512, 622511, 622510, 622509, 622508, 622507, 622506, 622505, 622504, 622503, 622502, 622501, 622500, 612512, 612511, 612510, 612509, 612508, 612507, 612506, 612505, 612504, 612503, 612502, 612501, 612500, 602512, 602511, 602510, 602509, 602508, 602507, 602506, 602505, 602504, 602503, 602502, 602501, 602500}
		}
		local pRand = math.random(1,100)	
		if(pRand >= Chance)then
			if(pClass == 1)then
				i = math.random(1,12);
			elseif(pClass == 2)then
				i = math.random(1,25);
			elseif(pClass == 3)then
				i = math.random(1,12);
			elseif(pClass == 4)then
				i = math.random(1,12);
			elseif(pClass == 5)then
				i = math.random(1,25);
			elseif(pClass == 6)then
				i = math.random(1,12);
			elseif(pClass == 7)then
				i = math.random(1,38);
			elseif(pClass == 8)then
				i = math.random(1,12);
			elseif(pClass == 9)then
				i = math.random(1,12);
			elseif(pClass == 11)then
				i = math.random(1,38);
			end
			killer:AddItem(Items[pClass][i], 1)
		end
		local players = killer:GetPlayersInRange(20, 2);
		for _,v in pairs(players) do
			local rRand = math.random(1,100);
			if(rRand >= Chance+3)then
				if(pClass == 1)then
					r = math.random(1,12);
				elseif(pClass == 2)then
					r = math.random(1,25);
				elseif(pClass == 3)then
					r = math.random(1,12);
				elseif(pClass == 4)then
					r = math.random(1,12);
				elseif(pClass == 5)then
					r = math.random(1,25);
				elseif(pClass == 6)then
					r = math.random(1,12);
				elseif(pClass == 7)then
					r = math.random(1,38);
				elseif(pClass == 8)then
					r = math.random(1,12);
				elseif(pClass == 9)then
					r = math.random(1,12);
				elseif(pClass == 11)then
					r = math.random(1,38);
				end
				v:AddItem(Items[pClass][r], 1)
			end
		end
	end
end

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

local function LootPvP5Gear(event, killer, killed)
	if(killer:InBattleground() == true or killer:InArena() == true)then
		local Chance = 94;
		local pClass = killer:GetClass();
		local pGuid = killer:GetGUIDLow();
		local vGuid = killed:GetGUIDLow();
		if(vGuid == pGuid)then
			return false;
		end
		local Items = {
			[1] = {160012, 160011, 160010, 160009, 160008, 160007, 160006, 160005, 160004, 160003, 160002, 160001, 160000},
			[2] = {270012, 270011, 270010, 270009, 270008, 270007, 270006, 270005, 270004, 270003, 270002, 270001, 270000, 260012, 260011, 260010, 260009, 260008, 260007, 260006, 260005, 260004, 260003, 260002, 260001, 260000},
			[3] = {660012, 660011, 660010, 660009, 660008, 660007, 660006, 660005, 660004, 660003, 660002, 660001, 660000},
			[4] = {460012, 460011, 460010, 460009, 460008, 460007, 460006, 460005, 460004, 460003, 460002, 460001, 460000},
			[5] = {1160012, 1160011, 1160010, 1160009, 1160008, 1160007, 1160006, 1160005, 1160004, 1160003, 1160002, 1160001, 1160000, 1060012, 1060011, 1060010, 1060009, 1060008, 1060007, 1060006, 1060005, 1060004, 1060003, 1060002, 1060001, 1060000},
			[6] = {360012, 360011, 360010, 360009, 360008, 360007, 360006, 360005, 360004, 360003, 360002, 360001, 360000},
			[7] = {780012, 780011, 780010, 780009, 780008, 780007, 780006, 780005, 780004, 780003, 780002, 780001, 780000, 770012, 770011, 770010, 770009, 770008, 770007, 770006, 770005, 770004, 770003, 770002, 770001, 770000, 760012, 760011, 760010, 760009, 760008, 760007, 760006, 760005, 760004, 760003, 760002, 760001, 760000},
			[8] = {860012, 860011, 860010, 860009, 860008, 860007, 860006, 860005, 860004, 860003, 860002, 860001, 860000},
			[9] = {960012, 960011, 960010, 960009, 960008, 960007, 960006, 960005, 960004, 960003, 960002, 960001, 960000},
			[11] = {580012, 580011, 580010, 580009, 580008, 580007, 580006, 580005, 580004, 580003, 580002, 580001, 580000, 570012, 570011, 570010, 570009, 570008, 570007, 570006, 570005, 570004, 570003, 570002, 570001, 570000, 560012, 560011, 560010, 560009, 560008, 560007, 560006, 560005, 560004, 560003, 560002, 560001, 560000}
		}
		local pRand = math.random(1,100)	
		if(pRand >= Chance)then
			if(pClass == 1)then
				i = math.random(1,12);
			elseif(pClass == 2)then
				i = math.random(1,25);
			elseif(pClass == 3)then
				i = math.random(1,12);
			elseif(pClass == 4)then
				i = math.random(1,12);
			elseif(pClass == 5)then
				i = math.random(1,25);
			elseif(pClass == 6)then
				i = math.random(1,12);
			elseif(pClass == 7)then
				i = math.random(1,38);
			elseif(pClass == 8)then
				i = math.random(1,12);
			elseif(pClass == 9)then
				i = math.random(1,12);
			elseif(pClass == 11)then
				i = math.random(1,38);
			end
			killer:AddItem(Items[pClass][i], 1)
		end
		local players = killer:GetPlayersInRange(20, 2);
		for _,v in pairs(players) do
			local rRand = math.random(1,100);
			if(rRand >= Chance+3)then
				if(pClass == 1)then
					r = math.random(1,12);
				elseif(pClass == 2)then
					r = math.random(1,25);
				elseif(pClass == 3)then
					r = math.random(1,12);
				elseif(pClass == 4)then
					r = math.random(1,12);
				elseif(pClass == 5)then
					r = math.random(1,25);
				elseif(pClass == 6)then
					r = math.random(1,12);
				elseif(pClass == 7)then
					r = math.random(1,38);
				elseif(pClass == 8)then
					r = math.random(1,12);
				elseif(pClass == 9)then
					r = math.random(1,12);
				elseif(pClass == 11)then
					r = math.random(1,38);
				end
				v:AddItem(Items[pClass][r], 1)
			end
		end
	end
end

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

local function LootPvP4Gear(event, killer, killed)
	if(killer:InBattleground() == true or killer:InArena() == true)then
		local Chance = 85;
		local pGuid = killer:GetGUIDLow();
		local vGuid = killed:GetGUIDLow();
		if(vGuid == pGuid)then
			return false;
		end
		local Items = {
			[1] = {130012, 130011, 130010, 130009, 130008, 130007, 130006, 130005, 130004, 130003, 130002, 130001, 130000},
			[2] = {240012, 240011, 240010, 240009, 240008, 240007, 240006, 240005, 240004, 240003, 240002, 240001, 240000, 230012, 230011, 230010, 230009, 230008, 230007, 230006, 230005, 230004, 230003, 230002, 230001, 230000},
			[3] = {630012, 630011, 630010, 630009, 630008, 630007, 630006, 630005, 630004, 630003, 630002, 630001, 630000},
			[4] = {430012, 430011, 430010, 430009, 430008, 430007, 430006, 430005, 430004, 430003, 430002, 430001, 430000},
			[5] = {1130012, 1130011, 1130010, 1130009, 1130008, 1130007, 1130006, 1130005, 1130004, 1130003, 1130002, 1130001, 1130000, 1030012, 1030011, 1030010, 1030009, 1030008, 1030007, 1030006, 1030005, 1030004, 1030003, 1030002, 1030001, 1030000},
			[6] = {330012, 330011, 330010, 330009, 330008, 330007, 330006, 330005, 330004, 330003, 330002, 330001, 330000},
			[7] = {750012, 750011, 750010, 750009, 750008, 750007, 750006, 750005, 750004, 750003, 750002, 750001, 750000, 740012, 740011, 740010, 740009, 740008, 740007, 740006, 740005, 740004, 740003, 740002, 740001, 740000, 730012, 730011, 730010, 730009, 730008, 730007, 730006, 730005, 730004, 730003, 730002, 730001, 730000},
			[8] = {830012, 830011, 830010, 830009, 830008, 830007, 830006, 830005, 830004, 830003, 830002, 830001, 830000},
			[9] = {930012, 930011, 930010, 930009, 930008, 930007, 930006, 930005, 930004, 930003, 930002, 930001, 930000},
			[11] = {550012, 550011, 550010, 550009, 550008, 550007, 550006, 550005, 550004, 550003, 550002, 550001, 550000, 540012, 540011, 540010, 540009, 540008, 540007, 540006, 540005, 540004, 540003, 540002, 540001, 540000, 530012, 530011, 530010, 530009, 530008, 530007, 530006, 530005, 530004, 530003, 530002, 530001, 530000}
		}
		local pRand = math.random(1,100)	
		if(pRand >= Chance)then
			if(pClass == 1)then
				i = math.random(1,12);
			elseif(pClass == 2)then
				i = math.random(1,25);
			elseif(pClass == 3)then
				i = math.random(1,12);
			elseif(pClass == 4)then
				i = math.random(1,12);
			elseif(pClass == 5)then
				i = math.random(1,25);
			elseif(pClass == 6)then
				i = math.random(1,12);
			elseif(pClass == 7)then
				i = math.random(1,38);
			elseif(pClass == 8)then
				i = math.random(1,12);
			elseif(pClass == 9)then
				i = math.random(1,12);
			elseif(pClass == 11)then
				i = math.random(1,38);
			end
			killer:AddItem(Items[pClass][i], 1)
		end
		local players = killer:GetPlayersInRange(20, 2);
		for _,v in pairs(players) do
			local rRand = math.random(1,100);
			if(rRand >= Chance+3)then
				if(pClass == 1)then
					r = math.random(1,12);
				elseif(pClass == 2)then
					r = math.random(1,25);
				elseif(pClass == 3)then
					r = math.random(1,12);
				elseif(pClass == 4)then
					r = math.random(1,12);
				elseif(pClass == 5)then
					r = math.random(1,25);
				elseif(pClass == 6)then
					r = math.random(1,12);
				elseif(pClass == 7)then
					r = math.random(1,38);
				elseif(pClass == 8)then
					r = math.random(1,12);
				elseif(pClass == 9)then
					r = math.random(1,12);
				elseif(pClass == 11)then
					r = math.random(1,38);
				end
				v:AddItem(Items[pClass][r], 1)
			end
		end
	end
end

RegisterPlayerEvent( 6, LootGladiateurGear )
RegisterPlayerEvent( 6, LootPvP6Gear )
RegisterPlayerEvent( 6, LootPvP5Gear )
RegisterPlayerEvent( 6, LootPvP4Gear )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
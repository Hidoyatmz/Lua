local NpcSpellVendor = 101031
local TokenID = 3000010

local function OnGossipHello(event, player, object, unit)
	local pRace = player:GetRaceAsString(2)
	local pName = player:GetName();
	local class = player:GetClass();
	player:GossipClearMenu();
	local Query = WorldDBQuery("SELECT * FROM npc_titlevendor;")
	if(Query) then
		repeat
			local row = {
				entry 			= Query:GetUInt32(0),
				malename 		= Query:GetString(1),
				femalename 		= Query:GetString(2)
			}
			if(player:HasTitle(row.entry) == false) then
				local pName = player:GetName();
				local pGender = player:GetGender();
				if(pGender == 0)then
					player:GossipMenuAddItem(0, row.malename.." "..pName, 1, row.entry)
				else
					player:GossipMenuAddItem(0, row.femalename.." "..pName, 1, row.entry)
				end
			end
		until not Query:NextRow()
	end
	player:GossipSetText("Quel titre voulez-vous acheter ?\n\nChaque titre vous coutera 250 jetons titre." )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnClassSelect(event, player, object, sender, intid, code, menuid)
    if(player:HasItem(TokenID, 250, false))then
    	player:SetKnownTitle( intid );
    	object:SendUnitWhisper("Voila votre titre !", 0, player, true)
    	player:RemoveItem(TokenID, 250)
    	player:GossipComplete();
    else
    	object:SendUnitWhisper("Vous n'avez pas assez de jetons titre sur vous !", 0, player, true)
    	player:GossipComplete();
    end
end

RegisterCreatureGossipEvent(NpcSpellVendor, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcSpellVendor, 2, OnClassSelect)


local console = debug.getinfo (1, "S").short_src;
print("- "..console);
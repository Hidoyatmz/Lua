local commande = {};
local RogueStealth = 1787;
local RacialStealth = 20580;
local DruidStealth = 9913;


function commande.info (event, player, command)
	if (command == "info") then
		local pAccount = player:GetAccountName();
		local pName = player:GetName();
		local pGuid = player:GetGUIDLow();
		local pSpells = "0";
		Query2 = WorldDBQuery("SELECT spells FROM userspells WHERE guid = " .. pGuid .. ";");
		if(Query2) then
			if(Query2:GetUInt32(0) ~= 0) then
				pSpells = Query2:GetUInt32(0);
			end
		end
		--player:Emote(447);
		player:SendBroadcastMessage("|cffff00ff---- WoW Crusade Account Informations ----|r \n\n\n|cffff6060[COMPTE]|r |cFFFFE4C4" .. pAccount .. "|r\n\n|cFFA52A2A[PERSONNAGE]|r |cFFFFE4C4" .. pName .. "|r\n\n|cFF008000[SPELLS]|r |cFFFFE4C4" .. pSpells .. "|r\n\n\n|cffff00ff---- WoW Crusade Account Informations ----|r");
		return false;
	end
end

RegisterPlayerEvent(42, commande.info);

-- ListFile
local console = debug.getinfo (1, "S").short_src;
print("- "..console);
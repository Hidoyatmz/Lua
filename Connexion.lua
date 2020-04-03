-- Variables
local backPlayer = {};
local newPlayer = {};

function backPlayer.onConnect(event, player)
	-- Variables --
	local played = player:GetTotalPlayedTime();
	local gmRank = player:GetGMRank();
	local name = player:GetName();
	local guid = player:GetGUIDLow();

	-- Affichage du message --
	if (played >= 1) then
		player:SendBroadcastMessage("|cfff7dc78| |TInterface\\Calendar\\MeetingIcon:17:17:0:-4|t Nous vous souhaitons un bon retour parmis nous |cffAFEEEE"..name.."|r");
		if (gmRank >= 1) then
			player:SendBroadcastMessage("|cfff7dc78| |TInterface\\GossipFrame\\BinderGossipIcon:17:17:0:-4|t Niveau de votre compte :|cffAFEEEE Staff WoWCrusade (Rang : " .. gmRank ..")|r");
		else
			player:SendBroadcastMessage("|cfff7dc78| |TInterface\\GossipFrame\\BinderGossipIcon:17:17:0:-4|t Niveau de votre compte :|cffe5e5e5 Joueur|r");
		end
	end
end

function newPlayer.onFirstConnect(event, player)
	-- Variables
	local fille = player:GetGender();
	local name = player:GetName();
	local guid = player:GetGUIDLow();
	--
	if (fille == 1) then
		SendWorldMessage("|cffADFF2F| |TInterface\\BattlefieldFrame\\UI-Battlefield-Icon:17:17:0:-2|t La nouvelle joueuse |cffe5e5e5"..name.."|cffADFF2F vient de nous rejoindre !|r");
	else
		SendWorldMessage("|cffADFF2F| |TInterface\\BattlefieldFrame\\UI-Battlefield-Icon:17:17:0:-2|t Le nouveau joueur |cffe5e5e5"..name.."|cffADFF2F vient de nous rejoindre !|r");
	end
end

-- Événements
RegisterPlayerEvent(3, backPlayer.onConnect);
RegisterPlayerEvent(30, newPlayer.onFirstConnect);

-- ListFile
local console = debug.getinfo (1, "S").short_src;
print("- "..console);
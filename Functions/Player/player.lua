require "Functions/Player/variables";

function CanChangeDuelMode(player)
	if(player:IsInCombat() == true) then
		return false;
	elseif(player:HasAura(RogueStealth) or player:HasAura(RacialStealth) or player:HasAura(DruidStealth)) then
		return false;
	elseif(player:GetAreaId() ~= AreaZoneDuelID) then
		return false;
	else
		return true;
	end
end

function IsNotCombat(player)
	if(player:IsInCombat() == true) then
		return false;
	elseif(player:HasAura(RogueStealth) or player:HasAura(RacialStealth) or player:HasAura(DruidStealth)) then
		return false;
	else
		return true;
	end
end

function CanActiveDuelMode(player)
	if (player:GetPhaseMask() == 2) then
		return false;
	else
		return true;
	end
end

function CanRemoveDuelMode(player)
	if (player:GetPhaseMask() == 1) then
		return false;
	else
		return true;
	end
end

function ActiveDuelMode(eventid, delay, repeats, player)
    player:SendNotification("Votre mode duel a été activé.");
    player:SetPhaseMask(2);
end

function RemoveDuelMode(eventid, delay, repeats, player)
    player:SendNotification("Votre mode duel a été désactivé.");
    player:SetPhaseMask(1);
end

function TpZoneShop(eventid, delay, repeats, player)
	player:Teleport( 571, 2961, 69, 12, 3 );
end

function RemoveSpeed(eventid, delay, repeats, player)
	player:SetSpeed(1, 1);
	player:Dismount();
end

function GetPlayerPvPLevel(playerguid)
	local query = CharDBQuery("SELECT pvplevel FROM characters WHERE guid ="..playerguid);
	local pvplevel = query:GetUInt32(0);
	return pvplevel;
end

function GetPlayerPvELevel(playerguid)
	local query = CharDBQuery("SELECT pvelevel FROM characters WHERE guid ="..playerguid);
	local pvelevel = query:GetUInt32(0);
	return pvelevel;
end

function GetPlayerPvPXp(playerguid)
	local query = CharDBQuery("SELECT pvpxp FROM characters WHERE guid ="..playerguid);
	local pvpxp = query:GetUInt32(0);
	return pvpxp;
end

function GetPlayerPvEXp(playerguid)
	local query = CharDBQuery("SELECT pvexp FROM characters WHERE guid ="..playerguid);
	local pvexp = query:GetUInt32(0);
	return pvexp;
end

function GetPlayerNextXpPvP(playerguid)
	local query = CharDBQuery("SELECT pvpnextxp FROM characters WHERE guid ="..playerguid);
	local pvpnextxp = query:GetUInt32(0);
	return pvpnextxp;
end

function GetPlayerNextXpPvE(playerguid)
	local query = CharDBQuery("SELECT pvenextxp FROM characters WHERE guid ="..playerguid);
	local pvenextxp = query:GetUInt32(0);
	return pvenextxp;
end

function UpdatePlayerPvPLevel(playerguid, level)
	CharDBExecute("UPDATE characters SET pvplevel = pvplevel+"..level..", pvpxp = pvpxp-pvpnextxp, pvpnextxp = pvpnextxp*1.5 WHERE guid ="..playerguid);
end

function UpdatePlayerPvELevel(playerguid, level)
	CharDBExecute("UPDATE characters SET pvelevel = pvelevel+"..level..", pvexp = pvexp-pvenextxp, pvenextxp = pvenextxp*1.5 WHERE guid ="..playerguid);
end

function AddPvPXp(playerguid, xp)
	CharDBExecute("UPDATE characters SET pvpxp = pvpxp+"..xp.." WHERE guid = "..playerguid);
end

function AddPvEXp(playerguid, xp)
	CharDBExecute("UPDATE characters SET pvexp = pvexp+"..xp.." WHERE guid = "..playerguid);
end

function AddMMKill(playerguid)
	CharDBExecute("UPDATE characters SET weekMM = weekMM+1 WHERE guid = "..playerguid);
end

function GetMMKills(playerguid)
	local query = CharDBQuery("SELECT weekMM FROM characters WHERE guid = "..playerguid);
	local weekMM = query:GetUInt32(0);
	return weekMM;
end

function HasRollMM(playerguid)
	local query = CharDBQuery("SELECT hasMM FROM characters WHERE guid = "..playerguid);
	local hasMM = query:GetUInt32(0);
	if(hasMM == 1)then
		return true;
	else
		return false;
	end
end

function SethasMM(playerguid)
	CharDBExecute("UPDATE characters SET hasMM = 1 WHERE guid ="..playerguid);
end

function GetPlayerGuildLevel(pGuildID)
	local query = CharDBQuery("SELECT guildlevel, xp, requiredxp FROM guild WHERE guildid = "..pGuildID);
	local guildlevel = query:GetUInt32(0);
	return guildlevel;
end

function PlayerIsVIP(accountid)
	local query = AuthDBQuery("SELECT vip FROM account WHERE id ="..accountid);
	local vip = query:GetUInt32(0);
	if(vip == 1)then
		return true;
	else
		return false;
	end
end

function GetPlayerMaxSpell(playerguid)
	local query = CharDBQuery("SELECT maxspells FROM characters WHERE guid = "..playerguid);
	local maxspells = query:GetUInt32(0);
	return maxspells;
end

function IncreaseMaxSpells(playerguid)
	CharDBExecute("UPDATE characters SET maxspells = maxspells+1 WHERE guid = "..playerguid);
end
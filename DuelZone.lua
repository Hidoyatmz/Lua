local duelzone = {};
require "Functions/Player/player";

function duelzone.onmessage (event, player, command)
	if (command == "duelzone") then
		player:SendBroadcastMessage("Veuillez utiliser les valeurs 'on' ou 'off' afin d'activer ou désactiver votre mode duel.");
		return false;
	end
end

function duelzone.active (event, player, command)
	if (command == "duelzone on") then
		if(CanChangeDuelMode(player) == true and CanActiveDuelMode(player) == true) then
			player:SendNotification("Votre mode de duel sera activé dans 5 secondes.");
			player:RegisterEvent(ActiveDuelMode, 5000, 1);
		else
			player:SendNotification("Vous ne pouvez pas faire ceci actuellement.");
		end
		return false;
	end
end

function duelzone.remove(event, player, command)
	if (command == "duelzone off") then
		if(CanChangeDuelMode(player) == true and CanRemoveDuelMode(player) == true) then
			player:SendNotification("Votre mode de duel sera désactivé dans 5 secondes.");
			player:RegisterEvent(RemoveDuelMode, 5000, 1);
		else
			player:SendNotification("Vous ne pouvez pas faire ceci actuellement.");
		end
		return false;
	end
end

function duelzone.removespeed(event, player, command)
	if (command == "vagabonde fix") then
		if(CanChangeDuelMode(player) == true and CanChangeDuelMode(player) == true) then
			player:SendNotification("Votre vitesse reviendra à la normale dans 2 secondes.");
			player:RegisterEvent(RemoveSpeed, 2000, 1);
		else
			player:SendNotification("Vous ne pouvez pas faire ceci actuellement.");
		end
		return false;
	end
end

function duelzone.go(event, player, command)
	if (command == "shop") then
		if(IsNotCombat(player) == true) then
			player:SendNotification("Vous serez téléporté en zone shop dans 3 secondes.");
			player:RegisterEvent(TpZoneShop, 3000, 1);
		else
			player:SendNotification("Vous ne pouvez pas faire ceci actuellement.");
		end
		return false;
	end
end

RegisterPlayerEvent(42, duelzone.onmessage);
RegisterPlayerEvent(42, duelzone.active);
RegisterPlayerEvent(42, duelzone.remove);
RegisterPlayerEvent(42, duelzone.go);
RegisterPlayerEvent(42, duelzone.removespeed)
-- ListFile
local console = debug.getinfo (1, "S").short_src;
print("- "..console);
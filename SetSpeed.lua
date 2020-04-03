local setspeed = {};
require "Functions/Player/player";

function setspeed.active (event, player, command)
	if (command == "remove vagabonde") then
		if(CanChangeDuelMode(player) == true and CanActiveDuelMode(player) == true) then
			if(player:GetSpeed(1) == 21)then
				player:SetSpeed(1, 1)
				player:Dismount()
				player:SendAreaTriggerMessage("Votre vitesse à été modifié à 1.")
			else
				player:SendAreaTriggerMessage("Vous ne possédez pas de monture vagabonde sur vous...")
			end
		else
			player:SendAreaTriggerMessage("Vous ne pouvez pas mettre votre vitesse à 1 en combat.")
		end
		return false;
	end
end

RegisterPlayerEvent(42, setspeed.active);

-- ListFile
local console = debug.getinfo (1, "S").short_src;
print("- "..console);
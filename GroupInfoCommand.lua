local commande = {};

function commande.info (event, player, command)
	if (command == "ginfo") then
		mBonus = 1;
		local pName = player:GetName();
		local pGroup = player:GetGroup();

		if(pGroup == nil)then
			player:SendBroadcastMessage("Tu n'es pas dans un groupe enfaite...");
			return false;
		end

		local gCount = pGroup:GetMembersCount();
		local gMembers = pGroup:GetMembers();
		local gLeaderGuid = pGroup:GetLeaderGUID();
		local pLeader = GetPlayerByGUID( gLeaderGuid );
		local lName = pLeader:GetName();
		local gMaxMembers = 5;
		if(gCount <= gMaxMembers)then
			player:SendBroadcastMessage("Nous avons trouvé le groupe de " .. pName .. " entrer dans un raid mythique :")
			player:SendBroadcastMessage("Il y a " .. gCount .. " membres dans ce groupe.");

			for i=1,gCount do
				mBonus = mBonus + 1;
			end

			for _,v in pairs(gMembers) do
				player:SendBroadcastMessage("Membre: " .. v:GetName());
				if(v:GetName() ~= pName) then
					v:SendBroadcastMessage("D'après mes sources vous êtes dans le groupe de " .. pName);
				end
			end

			player:SendBroadcastMessage("Leader: ".. lName);
			player:SendBroadcastMessage("Bonus appliqué = +" .. mBonus .. "0% de vie et de dégats pour tous les mobs du raid");
		else
			local gRemove = gCount - gMaxMembers;
			player:SendBroadcastMessage("Non pas que je ne vous aime pas mais faire du Mythique avec un groupe de " .. gCount .. " membres n'est pas possible...\nVous devez virer " .. gRemove .. " peronnes.");
		end

		return false;
	end
end

RegisterPlayerEvent(42, commande.info);

-- ListFile
local console = debug.getinfo (1, "S").short_src;
print("- "..console);
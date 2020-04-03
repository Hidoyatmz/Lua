local commande = {};

function commande.info (event, player, command)
	local iscommand = string.sub(command, 0, 8);
	if (iscommand == "itemlink") then
		local iEntry = string.sub(command, 10);
		if(player:HasItem(iEntry))then
			local pItem = player:GetItemByEntry(iEntry);
			local pLink = pItem:GetItemLink(2);
			player:SendBroadcastMessage(pLink);
		else
			player:SendBroadcastMessage("Vous n'avez pas cet item sur vous...");
		end
		return false;
	end
end

RegisterPlayerEvent(42, commande.info);

-- ListFile
local console = debug.getinfo (1, "S").short_src;
print("- "..console);
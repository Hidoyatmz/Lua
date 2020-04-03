local MenuId = 123 -- Unique ID to recognice player gossip menu among others
local TokenID = 3000003

local function OnGossipHello(event, player, object, unit)
    player:GossipClearMenu() -- required for player gossip
    uRank = player:GetGMRank();
    uID = player:GetAccountId();

    Query = AuthDBQuery("SELECT eventquota FROM account WHERE id = " .. uID);
    if(Query) then
    	cota = Query:GetUInt32(0);
    	if(cota <= 0) then
    		player:SendNotification("Vous n'avez pas de jetons à donner.");
    		return false;
    	end
    else
    	player:SendNotification("Vous n'êtes pas autorisé à donner des récompenses aux events.");
    	return false;	
    end

    for _, v in pairs(GetPlayersInWorld()) do
    	pName = v:GetName();
    	local pGuid = v:GetGUIDLow();
    	local pRank = v:GetGMRank();
    	
    	if(pRank == 0) then
    		pName = "|cFF808000" .. pName .. "|r";
    		prefix = " (Joueur)";
    	else
    		pName = "|cFF000080" .. pName .. "|r";
    		prefix = " (Mj)";
    	end

    	player:GossipMenuAddItem(0, "Pseudo : " .. pName .. prefix, 1, pGuid, true, nil)
    end
    player:GossipSetText("A quel joueur souhaitez vous donner des jetons event ?\n\nVous avez " .. cota .." jetons encore à disposition.\n\nRappel: 'Code' désigne le nombre de jetons à donner. " )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
	uID = player:GetAccountId();
	local code = tonumber(code);
    if(code > cota) then
    	player:SendNotification("Vous n'avez pas assez de jetons à donner.");
    	player:GossipComplete();
    	return false;
    end
    Query2 = AuthDBExecute("UPDATE account SET eventquota = eventquota - " .. code .." WHERE id = " .. uID);
    player:SendBroadcastMessage("Vous avez donné " .. code .. " jetons event à " .. pName .. " !");
	player:GossipComplete();
	for _, v in pairs(GetPlayersInWorld()) do
    	pName = v:GetName();
    	local pGuid = v:GetGUIDLow();
    	if(pGuid == intid) then
    		v:AddItem(TokenID, code);
    	end
    end
end

local function OnPlayerCommand(event, player, command)
    if (command == "event reward") then
        OnGossipHello(event, player, player)
        return false
    end
end

RegisterPlayerEvent(42, OnPlayerCommand)
RegisterPlayerGossipEvent(MenuId, 2, OnGossipSelect)

-- ListFile
local console = debug.getinfo (1, "S").short_src;
print("- "..console);

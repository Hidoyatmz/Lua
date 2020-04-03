local function OnGmCreationChar(event, player)
    if (player:GetGMRank() >= 1) then
        player:AddItem(43651)
        player:AddItem(12064)
        player:AddItem(2586)
        player:AddItem(11508)
        player:AddItem(18582)
        player:AddItem(17)
        player:AddItem(192)
        player:SendBroadcastMessage("|cffff0000Vous faites partie de l'équipe de WoW Crusade, vous devez donc équiper les objets que vous venez de recevoir.|r")
    end
end

RegisterPlayerEvent(30, OnGmCreationChar)

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
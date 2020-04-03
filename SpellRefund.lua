local SpellRefund = {
	entry = 100013,
    maxObj = 5,
    tokenid = 3000002,
}

function SpellRefund.OnHello(event, player, unit)
    SpellRefund.GenerateMenu(1, player, unit);
end

function SpellRefund.OnSelect(event, player, unit, sender, intid, code)
    -- Intid 0 is used solely for menu pages and 1 for pet selection.
    if(intid == 0) then
        SpellRefund.GenerateMenu(sender, player, unit);
    else
        local pGuid = player:GetGUIDLow();
    	player:SendBroadcastMessage(sender);
    	player:SendBroadcastMessage(intid);
    	player:RemoveSpell(intid);
    	player:AddItem(SpellRefund.tokenid, sender);
        Query = WorldDBExecute("UPDATE userspells SET spells = spells-1 WHERE guid = "..pGuid);
    	player:GossipComplete();
    end
end

function SpellRefund.GenerateMenu(id, player, unit)
    local low = ((SpellRefund.maxObj*id)-SpellRefund.maxObj+1)
    local high = SpellRefund.maxObj*id
    local pClass = player:GetClass();
    SpellRefund.LoadCache(player)
    for i = low, high do
        local t = SpellRefund["Cache"][i]
        if(t and t["classid"] ~= pClass and player:HasSpell(t["spellid"]))then
       		player:GossipMenuAddItem(2, "|TInterface\\icons\\" .. t["icon"] .. ":40:40:-22:0|t "..t["spellname"], t["refund"], t["unlearn"], false, "Etes vous sur de vouloir vendre "..t["spellname"].." pour "..t["refund"].." jetons spells ?");
       	end
    end
    
    if(id ~= 1) then
        player:GossipMenuAddItem(4, "<-- Précedant", id-1, 0)
    end
    
    if(SpellRefund["Cache"][high+1]) then
        player:GossipMenuAddItem(4, "Suivant -->", id+1, 0)
    end
    
    player:GossipSendMenu(1, unit)
end

function SpellRefund.LoadCache(player)
    SpellRefund["Cache"] = {}
    local i = 1;
    local Query;
    local pClass = player:GetClass();
    Query = WorldDBQuery("SELECT refund, spellname, unlearn, classid, spellid, icon FROM spellvendor WHERE classid != "..pClass..";")

    if(Query) then
        repeat
        	if(player:HasSpell(Query:GetUInt32(4)))then
	            SpellRefund["Cache"][i] = {
	                refund = Query:GetUInt32(0),
	                spellname = Query:GetString(1),
	                unlearn = Query:GetUInt32(2),
	                classid = Query:GetUInt32(3),
	                spellid = Query:GetUInt32(4),
	                icon = Query:GetString(5)
	            };
	            i = i+1
	        end
        until not Query:NextRow()
        print("[Spell Vendor]: Cache initialized. Loaded "..Query:GetRowCount().." spells.")
    else
        print("[Spell Vendor]: Cache initialized. No results found.")
    end
end

RegisterCreatureGossipEvent(SpellRefund.entry, 1, SpellRefund.OnHello)
RegisterCreatureGossipEvent(SpellRefund.entry, 2, SpellRefund.OnSelect)

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
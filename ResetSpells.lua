local function OnPlayerLogin(event, player)
	local pClass = player:GetClass();
	local pGuid = player:GetGUIDLow();
	Query = WorldDBQuery("SELECT prix, spellname, unlearn, classid, spellid, icon FROM spellvendor WHERE classid != "..pClass..";")
	Check = CharDBQuery("SELECT refunded FROM characters WHERE guid = "..pGuid);
	if(Check)then
		local refunded = Check:GetUInt32(0);
		if(refunded == 0)then
			CharDBExecute("UPDATE characters SET refunded = 1 WHERE guid = "..pGuid);
			if(Query) then
		    	repeat
		    		local refund = Query:GetUInt32(0);
		    		local spellname = Query:GetString(1);
		    		local unlearn = Query:GetUInt32(2);
		    		local classid = Query:GetUInt32(3);
		    		local spellid = Query:GetUInt32(4);
		    		if(player:HasSpell(spellid))then
		    			player:SendBroadcastMessage(spellname);
		    			player:RemoveSpell(unlearn);
		    			player:AddItem(3000002, refund)
		    		end
		    	until not Query:NextRow()
		    end
		end
	end
end

RegisterPlayerEvent( 3, OnPlayerLogin )
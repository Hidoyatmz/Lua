local function AntiDonatorBuff(event, player, spell, skipCheck)
	local sEntry = spell:GetEntry();
	local pMap = player:GetMapId();
	if(sEntry == 80873 or sEntry == 80875)then
		if(player:InArena() == true or player:InBattleground() == true)then
			player:SendAreaTriggerMessage( "Tu ne peux pas avoir le buff donateur en PvP !" );
			spell:Cancel();
		end
	elseif(sEntry == 100001 or sEntry == 100003 or sEntry == 100009 or sEntry == 100011 or sEntry == 100013 or sEntry == 100015 or sEntry == 100021 or sEntry == 100023 or sEntry == 100025 or sEntry == 100032 or sEntry == 100042 or sEntry == 100044 or sEntry == 100046 or sEntry == 100050 or sEntry == 100052 or sEntry == 100056 or sEntry == 100058 or sEntry == 100060)then
		if(pMap == 571 or pMap == 530) then
			local pToCast = sEntry+1;
			player:AddAura(pToCast, player);
			player:RemoveAura(sEntry);
		end
	end
end

RegisterPlayerEvent( 5, AntiDonatorBuff )
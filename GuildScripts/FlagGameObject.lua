local Flag = 999999;

local function OnUseFlag(event, player, object)
	local pGuildId = player:GetGuildId()
	local pGuildName = player:GetGuildName()
	if(pGuildId ~= nil and pGuildName ~= nil)then
		local guid = pGuildId;
		local name = pGuildName;
		local QueryCheck = WorldDBQuery("SELECT * FROM guild_control WHERE control = 1 AND guid = "..pGuildId);
		if(QueryCheck)then
			player:SendAreaTriggerMessage("Votre guilde controle déjà Atreval.")
		else
			local time = os.time();
			local RemoveGuildControl = WorldDBQuery("UPDATE guild_control SET control = 0;");
			local InsertGuildControl = WorldDBQuery("INSERT INTO guild_control(guid, name, control, time) VALUES("..guid..", '"..name.."', 1, "..time..");");
			local players = GetPlayersInWorld();
			for _,player in pairs(players) do
				player:SendAreaTriggerMessage( "La guilde |cFF800080"..pGuildName.."|r controle maintenant la zone d'Atreval !\nQuelle guilde sera capable de les dégager ?" );
				player:PlayDirectSound( 8212 )
			end
		end
	end
end

RegisterGameObjectGossipEvent( Flag, 1, OnUseFlag )
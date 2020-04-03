local SPELL_DAMPENING = 80872;

function AddDampening(eventid, delay, repeats, player)
	player:AddAura(SPELL_DAMPENING, player)
end

function AddFDampening(eventid, delay, repeats, player)
	player:AddAura(SPELL_DAMPENING, player)
	player:RegisterEvent(AddDampening, 5000, 0)
end

local function OnMapChange(event, player)
	if(player:InArena() == true)then
		player:RegisterEvent(AddFDampening, 60000, 1)
	end

	if(player:InArena() == true or player:InBattleground() == true)then
		player:RemoveAura(80873);
		player:RemoveAura(80875);
	end

	local pMap = player:GetMapId();
	if(pMap == 35)then
		local pGuildID = player:GetGuildId();
		local guildlevel = GetPlayerGuildLevel(pGuildID);
		if(guildlevel < 10)then
			player:Teleport(571, 2961, 69, 12, 3);
		end
	end
end

RegisterPlayerEvent( 28, OnMapChange, 0)

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
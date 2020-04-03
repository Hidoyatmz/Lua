local commande = {};
require 'Storage/BgBonusStorage';

function commande.info (event, player, command)
	if (command == "storage") then
		local pGuid = player:GetGUIDLow();
		local bonus = usercarac[pGuid];
		if(bonus == nil)then
			usercarac = {};
			i = 0;
			f = io.input ("/home/crusade/dev/bin/lua_scripts/UF/Storage/BgBonusStorage.lua", 'r')
			for line in f:lines () do
			  	table.insert(usercarac, line)
			  	i = i + 1;
			end
			io.close(f)
			indexline = i - 1;
		    usercarac[i] = '	['..pGuid..'] = "AP",\n}'

		    file = io.open("/home/crusade/dev/bin/lua_scripts/UF/Storage/BgBonusStorage.lua", 'w')
		    for index, value in ipairs(usercarac) do
		        file:write(value..'\n')
		    end
		    file:flush()
		    file:close()
		end
	end
end

RegisterPlayerEvent(42, commande.info);

-- ListFile
local console = debug.getinfo (1, "S").short_src;
print("- "..console);
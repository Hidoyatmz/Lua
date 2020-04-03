local function ChatLogLocal(event, player, msg, Type, lang)
	local pMessage = msg;
	local pMessage = pMessage:gsub("%'", " ");
	local pName = player:GetName();
	local pDate = os.date("[%H:%M:%S]");
	local iscommand = string.sub(msg, 0, 2);
	if(pMessage == "Away" or pMessage == "Absent")then
		return false;
	elseif(pMessage == "")then
		return false;
	end
	if(iscommand ~= "/c")then
		local Query = WorldDBExecute("INSERT INTO crusade_chat(date, username, message, canal) VALUES('"..pDate.."','" ..pName.."', '"..pMessage.."', 'LOCAL');");
	end
end

local function ChatLogWhisp(event, player, msg, Type, lang, receiver)
	local pMessage = msg;
	local pMessage = pMessage:gsub("%'", " ");
	local pName = player:GetName();
	local rName = receiver:GetName();
	local pDate = os.date("[%H:%M:%S]");
	local iscommand = string.sub(msg, 0, 2);
	if(iscommand ~= "/c")then
		local Query = WorldDBExecute("INSERT INTO crusade_chat(date, username, message, canal, receiver) VALUES('"..pDate.."','" ..pName.."', '"..pMessage.."', 'WHISP', '"..rName.."');");
	end
end

local function ChatLogGuild(event, player, msg, Type, lang, guild)
	local pMessage = msg;
	local pMessage = pMessage:gsub("%'", " ");
	local pName = player:GetName();
	local gName = guild:GetName();
	local pDate = os.date("[%H:%M:%S]");
	local iscommand = string.sub(msg, 0, 2);
	if(iscommand ~= "/c")then
		local Query = WorldDBExecute("INSERT INTO crusade_chat(date, username, message, canal) VALUES('"..pDate.."','".."("..gName..") "..pName.."', '"..pMessage.."', 'GUILD');");
	end
end

local function ChatLogGroup(event, player, msg, Type, lang, group)
	local pMessage = msg;
	local pMessage = pMessage:gsub("%'", " ");
	local pName = player:GetName();
	local gLeaderGuid = group:GetLeaderGUID();
	local pLeader = GetPlayerByGUID( gLeaderGuid );
	local lName = pLeader:GetName();
	local pDate = os.date("[%H:%M:%S]");
	local iscommand = string.sub(msg, 0, 2);
	if(iscommand ~= "/c")then
		local Query = WorldDBExecute("INSERT INTO crusade_chat(date, username, message, canal) VALUES('"..pDate.."','".."("..lName..") "..pName.."', '"..pMessage.."', 'GROUP');");
	end
end

RegisterPlayerEvent( 18, ChatLogLocal )
RegisterPlayerEvent( 19, ChatLogWhisp )
RegisterPlayerEvent( 20, ChatLogGroup )
RegisterPlayerEvent( 21, ChatLogGuild )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
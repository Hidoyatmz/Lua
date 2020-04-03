local Caller = 900000;

local function OnCallTram(event, go, player)
	player:Teleport(603, 2342.4426, 2576.5527, 419.2821, 6.2010);
end

RegisterGameObjectEvent( Caller, 14, OnCallTram )

local Caller2 = 900001;

local function OnCallTram2(event, go, player)
	player:Teleport(603, 2278.5002, 287.5973, 419.2866, 3.1104);
end

RegisterGameObjectEvent( Caller2, 14, OnCallTram2 )
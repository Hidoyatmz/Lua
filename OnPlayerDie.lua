local function OnPlayerDie(event, killer, killed)
	local pMap = killed:GetMapId();
	local pName = killed:GetName();
	if(pMap == 543)then
		local pClass = killed:GetClassAsString( 1 );
		killed:RemoveAura(27827);
		killed:ResurrectPlayer(70);
		killed:Teleport(543, -1338.939331, 1658.020630, 68.773422, 0.456643);
	elseif(pMap == 209)then
		killed:RemoveAura(27827);
		killed:Teleport(209, 1251.329956, 840.060974, 8.888320, 4.184780);
		killed:ResurrectPlayer(70);
	elseif(pMap == 533)then
		killed:RemoveAura(27827);
		killed:Teleport(533, 2954.319336, -3434.517334, 299.550232, 0.032875);
		killed:ResurrectPlayer(70);
	elseif(pMap == 603)then
		killed:RemoveAura(27827);
		killed:Teleport(603, -859.476257, -149.153778, 458.894135, 6.280000);
		killed:ResurrectPlayer(70);
	end
end

RegisterPlayerEvent( 8, OnPlayerDie )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
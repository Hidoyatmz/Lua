local JetonT1 = 3000004
local JetonT2 = 3000005
local JetonT3 = 3000006
local JetonT4 = 3000007
local JetonMM = 3000008

local function HasJeton(event, player)
	local pMap = player:GetMapId()
	if(pMap == 543)then
		if(player:HasItem(JetonT1, 1) or player:IsGM() == true)then
			player:RemoveItem( JetonT1, 1 )
			player:SendBroadcastMessage( "Tu as perdu un jeton d'accès pour être entré dans l'instance." );
		else
			player:SendBroadcastMessage( "Tu n'as pas le jeton d'accès..." );
		end
	elseif(pMap == 209)then
		if(player:HasItem(JetonT2, 1) or player:IsGM() == true)then
			player:RemoveItem( JetonT2, 1 )
			player:SendBroadcastMessage( "Tu as perdu un jeton d'accès pour être entré dans l'instance." );
			local creatures = player:GetCreaturesInRange( 2000000 )
			for _,v in pairs(creatures) do
				v:AddAura(80867, v)
				v:AddAura(80870, v)
				v:AddAura(80868, v)
			end
		else
			player:SendBroadcastMessage( "Tu n'as pas le jeton d'accès..." );
		end
	elseif(pMap == 533)then
		if(player:HasItem(JetonT3, 1) or player:IsGM() == true)then
			player:RemoveItem( JetonT3, 1 )
			player:SendBroadcastMessage( "Tu as perdu un jeton d'accès pour être entré dans l'instance." );
			local creatures = player:GetCreaturesInRange( 2000000 )
			for _,v in pairs(creatures) do
				v:AddAura(80867, v)
				v:AddAura(80868, v)
				v:AddAura(80866, v)
			end
		else
			player:SendBroadcastMessage( "Tu n'as pas le jeton d'accès..." );
			player:Teleport(571, 2938.6572, 73.6227, 6.9898, 1.5813);
		end
	elseif(pMap == 603)then	
		if(player:HasItem(JetonT4, 1) or player:IsGM() == true)then
			player:RemoveItem( JetonT4, 1 )
			player:SendBroadcastMessage( "Tu as perdu un jeton d'accès pour être entré dans l'instance." );
		else
			player:SendBroadcastMessage( "Tu n'as pas le jeton d'accès..." );
			player:Teleport(571, 2938.6572, 73.6227, 6.9898, 1.5813);
		end
	elseif(pMap == 389)then
		if(player:HasItem(JetonMM, 1) or player:IsGM() == true)then
			player:RemoveItem( JetonMM, 1 )
			player:SendBroadcastMessage( "Tu as perdu un jeton d'accès pour être entré dans l'instance." );
		else
			player:SendBroadcastMessage( "Tu n'as pas le jeton d'accès..." );
		end
	end
end

local function T7(event, player)
	local pMap = player:GetMapId()
	if(pMap == 249)then
		local i = 0;
		local AverageItemLevel = player:GetAverageItemLevel();
		ItemLevelTotal = 0;
		local pGroup = player:GetGroup();
		if(pGroup)then
			local gMembers = pGroup:GetMembers();
			for k,v in pairs(gMembers) do
				if(v:GetAverageItemLevel() >= 600)then
					pIlevelAverage = v:GetAverageItemLevel();
				else
					pIlevelAverage = 600;
				end
				ItemLevelTotal = ItemLevelTotal + pIlevelAverage;
			end
			local gMembersCount = pGroup:GetMembersCount();
			local ItemLevelGroupAverage = ItemLevelTotal / gMembersCount;
			player:SendBroadcastMessage(ItemLevelGroupAverage);
			local Stack = (AverageItemLevel-600)/100;
			local creatures = player:GetCreaturesInRange( 20000000 )
				for _,v in pairs(creatures) do
					local cMaxHealth = v:GetMaxHealth();
					v:RemoveAura(200024);
					v:RemoveAura(200025);
					v:RemoveAura(200026);
					if(cMaxHealth <= 2000000000)then
						for i=1,Stack do
							v:AddAura(200024, v);
							v:AddAura(200025, v);
							v:AddAura(200026, v);
						end
					else
						for i=1,Stack do
							v:AddAura(200024, v);
							v:AddAura(200024, v);
							v:AddAura(200026, v);
						end
					end
					for k=1,gMembersCount do
						v:AddAura(200024, v);
						v:AddAura(200025, v);
						v:AddAura(200026, v);
					end
				end
		else
			if(AverageItemLevel >= 600)then
				AverageItemLevel = AverageItemLevel
			else
				AverageItemLevel = 600;
			end
			local Stack = (AverageItemLevel-600)/100;
			local creatures = player:GetCreaturesInRange( 20000000 )
				for _,v in pairs(creatures) do
					local cMaxHealth = v:GetMaxHealth();
					v:RemoveAura(200024);
					v:RemoveAura(200025);
					v:RemoveAura(200026);
					if(cMaxHealth <= 2000000000)then
						for i=1,Stack do
							v:AddAura(200024, v);
							v:AddAura(200025, v);
							v:AddAura(200026, v);
						end
					else
						for i=1,Stack do
							v:AddAura(200024, v);
							v:AddAura(200024, v);
							v:AddAura(200026, v);
						end
					end
					v:AddAura(200024, v);
					v:AddAura(200025, v);
					v:AddAura(200026, v);
				end
		end	
	end
end
RegisterPlayerEvent( 28, T7 )
RegisterPlayerEvent( 33, T7 )
RegisterPlayerEvent( 28, HasJeton )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
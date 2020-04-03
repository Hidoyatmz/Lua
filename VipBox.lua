local commande = {};
local RogueStealth = 1787;
local RacialStealth = 20580;
local DruidStealth = 9913;

function commande.vipbox (event, player, command)
	if (command == "vipbox") then
		local pAccount = player:GetAccountName();
		local pName = player:GetName();
		local pGuid = player:GetGUIDLow();
		local pAccId = player:GetAccountId();
		if( PlayerIsVIP(pAccId) == false)then
			return false;
		end
		Query1 = AuthDBQuery("SELECT vip FROM account WHERE id = " .. pAccId .. ";");
		if(Query1) then
			if(Query1:GetUInt32(0) ~= 0) then
				isVIP = Query1:GetUInt32(0);
			end
		end

		if(isVIP == 1)then
			Query2 = CharDBQuery("SELECT vipbox FROM characters WHERE guid = " .. pGuid .. ";");
			if(Query2) then
				if(Query2:GetUInt32(0) == 0) then
					local Query3 = CharDBExecute("UPDATE characters SET vipbox = 1 WHERE guid = " .. pGuid .. ";");
					local QueryItem = WorldDBQuery("SELECT entry FROM item_template WHERE entry BETWEEN 3000000 AND 7000306 OR entry BETWEEN 90000 AND 94004 ORDER BY RAND() LIMIT 1;");
					local iadd = QueryItem:GetUInt32(0);
					player:AddItem(iadd, 1);
					player:SendBroadcastMessage("Vous avez ouvert vote box.");
				else
					player:SendBroadcastMessage("Vous avez déjà ouvert votre vip box aujourd'hui, attendez 22h00 pour la ré-ouvrir.");
				end
			end
		else
			player:SendBroadcastMessage("Il vous faut posséder un compte VIP afin d'éxecuter cette commande.");
			return false;
		end
		return false;
	end
end

function commande.premiumbox (event, player, command)
	if (command == "premiumbox") then
		local pAccount = player:GetAccountName();
		local pName = player:GetName();
		local pGuid = player:GetGUIDLow();
		local pAccId = player:GetAccountId();
		if( PlayerIsVIP(pAccId) == false)then
			return false;
		end
		Query1 = AuthDBQuery("SELECT premium FROM account WHERE id = " .. pAccId .. ";");
		if(Query1) then
			if(Query1:GetUInt32(0) ~= 0) then
				isPremium = Query1:GetUInt32(0);
			end
		end

		if(isPremium == 1)then
			Query2 = CharDBQuery("SELECT premiumbox FROM characters WHERE guid = " .. pGuid .. ";");
			if(Query2) then
				if(Query2:GetUInt32(0) == 0) then
					local Query3 = CharDBExecute("UPDATE characters SET premiumbox = 1 WHERE guid = " .. pGuid .. ";");
					local QueryItem = WorldDBQuery("SELECT entry FROM item_template WHERE entry BETWEEN 3000000 AND 7000306 OR entry BETWEEN 90000 AND 94004 ORDER BY RAND() LIMIT 1;");
					local iadd = QueryItem:GetUInt32(0);
					player:AddItem(iadd, 1);
					player:SendBroadcastMessage("Vous avez ouvert vote box.");
				else
					player:SendBroadcastMessage("Vous avez déjà ouvert votre premium box cette semaine, attendez lundi 22h00 pour la ré-ouvrir.");
				end
			end
		else
			player:SendBroadcastMessage("Il vous faut posséder un compte premium afin d'éxecuter cette commande.");
			return false;
		end
		return false;
	end
end

RegisterPlayerEvent(42, commande.vipbox);
RegisterPlayerEvent(42, commande.premiumbox);

-- ListFile
local console = debug.getinfo (1, "S").short_src;
print("- "..console);
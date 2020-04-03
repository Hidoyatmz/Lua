local NPC = 101030
local JetonDona = 3000009
local ArmePrix = 100
local ArmurePrix = 50
local AIO = AIO or require("AIO")
local MyHandlers = AIO.AddHandlers("TransmogVendor", {})

local function SendPlayerInformations(msg, player)
    msg:Add("TestTransmoClient", "SetupItem", iEntry):Send(player)
end

local function UpdatePlayerInformations(eventid, delay, repeats, player)
    SendPlayerInformations(AIO.Msg(), player)
end

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();

	player:GossipMenuAddItem(0, "|TInterface\\icons\\inv_sword_1h_aggramar_d_01:40:40:-22:0|t Acheter une arme", 1, 1, true, "Dans la prochaine fenêtre entrez l'ID de l'objet en question.\nChaque arme vous coutera 100 jetons transmog.")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\INV_Helmet_Leather_ChallengeRogue_D_01:40:40:-22:0|t Acheter pièce d'armure", 1, 2, true, "Dans la prochaine fenêtre entrez l'ID de l'objet en question.\nChaque pièce d'armure vous coutera 50 jetons transmog.")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\INV_Helmet_Mail_ChallengeHunter_D_01:40:40:-22:0|t Essayer un item de la liste", 1, 3, true, "Dans la prochaine fenêtre entrez l'ID de l'objet en question.\nLes essais sont gratuit.")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Achievement_BG_returnXflags_def_WSG:40:40:-22:0|t Partir", 1, 4)
	player:GossipSetText("Bonsoir " .. pName .. ", souhaitez vous acheter une transmogrification ?\n\nRetrouvez la liste sur :\n|cFFA52A2Ahttps://wow-crusade.com/items|r" )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code, msg)
	local name = player:GetName();
	local accountid = player:GetAccountId();

	if (intid == 1) then
		local iEntry = tonumber(code);
		if(iEntry >= 6000000 and iEntry <= 6001153)then
			if(player:HasItem(iEntry, 1, true) == false)then
				if(player:HasItem(JetonDona, ArmePrix, false))then
					player:RemoveItem(JetonDona, ArmePrix);
					player:AddItem(iEntry, 1);
				else
					object:SendUnitWhisper("Vous n'avez pas assez de jetons donateur sur vous...", 0, player, true)
				end
			else
				object:SendUnitWhisper("Vous avez déjà cette transmogrification sur vous ou dans votre banque !", 0, player, true)
			end
		else
			object:SendUnitWhisper("Vous avez entré une mauvaise ID !", 0, player, true)
		end
		player:GossipComplete();
	elseif (intid == 2)then
		local iEntry = tonumber(code);
		if(iEntry >= 7000000 and iEntry <= 7000288)then
			if(player:HasItem(iEntry, 1, true) == false)then
				if(player:HasItem(JetonDona, ArmurePrix, false))then
					player:RemoveItem(JetonDona, ArmurePrix);
					player:AddItem(iEntry, 1);
				else
					object:SendUnitWhisper("Vous n'avez pas assez de jetons donateur sur vous...", 0, player, true)
				end
			else
				object:SendUnitWhisper("Vous avez déjà cette transmogrification sur vous ou dans votre banque !", 0, player, true)
			end
		else
			object:SendUnitWhisper("Vous avez entré une mauvaise ID !", 0, player, true)
		end
		player:GossipComplete();
	elseif (intid == 3)then
		iEntry = tonumber(code);
		if(iEntry >= 6000000 and iEntry <= 7000288)then
			AIO.Handle(player, "TestTransmoClient", "ShowframeTransmo")
			player:RegisterEvent(UpdatePlayerInformations, 100, 1)
		else
			object:SendUnitWhisper("Vous avez entré une mauvaise ID !", 0, player, true)
		end
		player:GossipComplete();
	elseif (intid == 4)then
		player:GossipComplete();
	end
end
	
RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
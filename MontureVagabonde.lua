local NPC = 100019
local Panthere = {
	[1] = "6444",
	[2] = "29755",
	[3] = "6080"
}

local Raptor = {
	[1] = "6472",
	[2] = "6471",
	[3] = "6469",
}

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName()
	player:GossipMenuAddItem(0, "|TInterface\\icons\\ability_mount_blackpanther:40:40:-22:0|t Je voudrais une panthère", 1, 1)
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Mount_Raptor:40:40:-22:0|t Je voudrais un raptor", 1, 2)
	player:GossipSetText("Bonsoir " .. pName .. ", souhaitez vous que je vous prête une de mes montures pour vous déplacer en zone shop ?" )
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
	if(intid == 1)then
		local number = math.random(1,3)
		local Mount = Panthere[number];
		object:SendUnitWhisper("Voila une panthère pour vous !", 0, player, true)
		player:Mount( Mount )
		player:GossipComplete()
		player:SetSpeed(1, 3)
	elseif(intid ==2)then
		object:SendUnitWhisper("Voila un raptor pour vous !", 0, player, true)
		player:GossipComplete()
		local number = math.random(1,3)
		local Mount = Raptor[number];
		player:Mount( Mount )
		player:GossipComplete()
		player:SetSpeed(1, 3)
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
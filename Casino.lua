local NPC = 101068
local JetonDona = 3000000

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
		player:GossipClearMenu();
		player:GossipMenuAddItem(0, "Parier 5 jetons donations", 1, 1, false, "Une fois que vous aurez cliqué sur 'Accepter', aucun remboursement ne sera possible.\n\nJe vais vous retirer 5 jetons puis tirer au sort un nombre entre 0 et 10 et vous donner ce nombre de jetons, vous pouvez gagner des jetons comme en perdre.");
		player:GossipMenuAddItem(0, "Partir...", 1, 999);
		player:GossipSetText("Bonjour, vous souhaitez tenter votre chance ?");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code)
	local pName = player:GetName();
	if(intid == 1)then
		if(player:HasItem(JetonDona, 5))then
			player:RemoveItem(JetonDona, 5);
			local number = math.random(0,100);
			if(number >= 60)then
				local jetons = math.random(5,10);
				local gains = jetons-5;
				player:AddItem(JetonDona, jetons);
				player:SendBroadcastMessage("Vous tiré le nombre: "..jetons..". Vous avez donc gagné "..gains.." jetons donations.");
				if(jetons == 10)then
					SendWorldMessage("[|cff1ABC9CWoW-Crusade|r] "..pName.." vient de gagner "..gains.." jetons donations au casino !" );
				end
			else
				local jetons = math.random(0,4);
				local gains = jetons-5;
				player:AddItem(JetonDona, jetons);
				player:SendBroadcastMessage("Vous tiré le nombre: "..jetons..". Vous avez donc gagné "..gains.." jetons donations.");
			end
		end
		player:GossipComplete();
	elseif(intid == 999)then
		player:GossipComplete();
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
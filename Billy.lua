local NPC = 247

local WORLD_EVENT_ON_UPDATE = 13
local bPlayerInSubArea = false

local arrSubArea = {
  {x=-1112.731323, y=1538.861816},
  {x=-1116.484313, y=1525.225464},
  {x=-1125.999390, y=1529.174805},
  {x=-1123.379761, y=1534.767090}
}

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
	local pGuid = player:GetGUIDLow();
	local pQStatus = player:GetQuestStatus(1000000)
	local pPhase = player:GetPhaseMask();
	if(pPhase == 3)then
		player:GossipSetText("Ramène moi à maman !" )
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
		return false;
	end
	if (pQStatus == 0) then
		player:GossipMenuAddItem(0, "Au revoir...", 1, 2)
		player:GossipSetText("Ma maman m'a dit ne pas parler aux inconnus..." )
	elseif(pQStatus == 3)then
		player:GossipMenuAddItem(0, "Ta maman te cherche !", 1, 1)
		player:GossipMenuAddItem(0, "Au revoir...", 1, 2)
		player:GossipSetText("Ma maman m'a dit ne pas parler aux inconnus..." )
	else
		player:GossipSetText("Oh ! Mon sauveur <3" )
	end
	player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
end

local function OnGossipSelect(event, player, object, sender, intid, code, menuid)
	local pGuid = player:GetGUIDLow();
	if(intid == 1)then
		object:SendUnitWhisper("Ahh euhh... d'accord je vous suit...", 0, player, true)
		local posX = player:GetX();
		local posY = player:GetY();
		local posZ = player:GetZ();
		local posO = player:GetO();
		player:SetPhaseMask(3)
		local billy = player:SpawnCreature(247, posX, posY, posZ, posO, 3, 300000);
		billy:MoveFollow(player);
		player:KilledMonsterCredit(124)
		player:GossipComplete()
	elseif(intid ==2)then
		player:GossipComplete()
	end
end

local function onWorldUpdate(event, diff)
    for i, player in ipairs(GetPlayersInWorld()) do
    	Billy = "nil";
        arrPlayerLocation = {x=player:GetX(),y=player:GetY()}
        bPlayerInside = insidePolygon(arrSubArea,arrPlayerLocation)
        local pQStatus = player:GetQuestStatus(1000000)
        local pArea = player:GetAreaId();
        if(pQStatus == 3 and pArea == 2397) then
        	local isBillyHere = player:GetCreaturesInRange(10, 247, 2, 1);
        	for _,v in pairs(isBillyHere) do
        		Billy = v:GetName();
        		v:DespawnOrUnsummon(2000)
        	end
        	if (bPlayerInside==true and Billy == "Billy Maclure" ) then
                player:SetPhaseMask(1)
	            player:KilledMonsterCredit(325)
	        end
        end
        bPlayerInSubArea=bPlayerInside
    end
end
RegisterServerEvent(WORLD_EVENT_ON_UPDATE, onWorldUpdate)


RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
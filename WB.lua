-- CREATURES
local NPC_VELKOR 				  = 2000000;
local NPC_SUMMONED 				  = 15262;
local NPC_INTERPHASE 			  = 23469;

-- SPELLS
local SPELL_TRONE_ASPECT 		  = 69127;
local SPELL_TWISTED_REFLECTION    = 21063;
local SPELL_SHADOW_VOLLEY         = 32963;
-- PHASE 2
local SPELL_SHIELD 				  = 40733;
local SPELL_REGEN 		          = 23493;

-- PHASE 3
local SPELL_FEL_STREAK_VISUAL 	  = 66493;
local SPELL_LEGION_FLAME 		  = 66197;
local SPELL_FEL_LIGHTNING	      = 66528;
local SPELL_INCINERATE_FLESH 	  = 66237;
local SPELL_FEL_FIREBALL 		  = 66532;

--PHASE 4
local SPELL_FREEZE_SLASH          = 66012;
local SPELL_PENETRATING_COLD      = 66013;
local SPELL_LIGHT_TOUCH           = 67297;
local SPELL_PARALYTIC_TOXIN       = 66823;
local SPELL_BURNING_BITE          = 66879;
local SPELL_FIRE_SPIT             = 66796;
local SPELL_BURNING_SPRAY         = 66902;
local SPELL_WHIRL                 = 67345;
local SPELL_STAGGERED_DAZE        = 66758;

-- ITEMS
local WEAPON_TRANCHOIRRIGHT 	  = 30311;
local WEAPON_AZZINOTHRIGHT 		  = 32837;
-- GAME OBJECT
local PORTAL_PURPLE 		  	  = 184179;

-- Variables
local Velkor = {}
Time = 1
Bonus = 0

function SecondsToClock(seconds)
  local seconds = tonumber(seconds)

  if seconds <= 0 then
    return "00:00:00";
  else
    hours = string.format("%02.f", math.floor(seconds/3600));
    mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
    secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
    return hours.."h "..mins.."m "..secs.."s"
  end
end

function Timer()
	Time = Time + 1
end

-- PHASE 4
function Velkor.FREESLASH(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_FREEZE_SLASH, true)
end
function Velkor.PENETRATINGCOLD(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_PENETRATING_COLD, true)
end
function Velkor.LIGHTTOUCH(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_LIGHT_TOUCH, true)
end
function Velkor.PARALYTIC(event, delay, pCall, creature)
	local players = creature:GetPlayersInRange( 5000, 1, 1 )
	for _,v in pairs(players) do
		local test = math.random(0,100);
		if(test >= 60)then
			creature:CastSpell(v, SPELL_PARALYTIC_TOXIN, true)
		end
	end
end
function Velkor.BURNINBITE(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_BURNING_BITE, true)
end
function Velkor.FIRESPIT(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_FIRE_SPIT, true)
end
function Velkor.SPRAY(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_BURNING_SPRAY, true)
end
function Velkor.WHIRL(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_WHIRL, true)
end
function Velkor.STAGGERED(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_STAGGERED_DAZE, true)
end

-- PHASE 3
function Velkor.FELSTREAK(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_FEL_STREAK_VISUAL, true)
end
function Velkor.LEGIONFLAME(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_LEGION_FLAME, true)
end
function Velkor.FELLIGHTNING(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_FEL_LIGHTNING, true)
end
function Velkor.INCINERATE(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_INCINERATE_FLESH, true)
end
function Velkor.FIREBALL(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_FEL_FIREBALL, true)
end

function Velkor.TWISTED(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_TWISTED_REFLECTION, true)
end

function Velkor.VOLLEY(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), SPELL_SHADOW_VOLLEY, true)
end

function Velkor.TroneAspect(event, delay, pCall, creature)
	local players = creature:GetPlayersInRange( 5000, 1, 1 )
	for _,v in pairs(players) do
		creature:AddAura(SPELL_TRONE_ASPECT, v);
	end
end

function Velkor.onSpawn(event, creature, target)
	creature:RemoveEvents()
	creature:EmoteState( 428 )
	creature:SetScale(0.7)
	creature:SetHealth( 2000000000 );
	creature:SetMaxHealth( 2000000000 )
end

function spawnCreaturesPhase2(eventid, delay, repeats, creature)
	local c1 = creature:SpawnCreature( NPC_SUMMONED, -8565.8565, 1956.883789, 71.046104, 1.150472, 4, 50000 )
	local c2 = creature:SpawnCreature( NPC_SUMMONED, -8593.100586, 2025.780029, 71.046104, 5.862851, 4, 50000 )
	local c3 = creature:SpawnCreature( NPC_SUMMONED, -8623.068336, 1975.771606, 71.046104, 0.325797, 4, 50000 )
	c1:MoveTo(1, -8551.715820, 2003.191284, 71.043671, 0.342917, true);
	c2:MoveTo(1, -8551.715820, 2003.191284, 71.043671, 0.342917, true);
	c3:MoveTo(1, -8551.715820, 2003.191284, 71.043671, 0.342917, true);
end

function spawnInterPhase(eventid, delay, repeats, creature)
	local i1 = creature:SpawnCreature( NPC_INTERPHASE, -8565.8565, 1956.883789, 71.046104, 1.150472, 4, 10000 )
	local i2 = creature:SpawnCreature( NPC_INTERPHASE, -8593.100586, 2025.780029, 71.046104, 5.862851, 4, 10000 )
	local i3 = creature:SpawnCreature( NPC_INTERPHASE, -8623.068336, 1975.771606, 71.046104, 0.325797, 4, 10000 )
	i1:MoveRandom(150)
	i2:MoveRandom(150)
	i3:MoveRandom(150)

	local dogremove = creature:GetGameObjectsInRange(5000, PORTAL_PURPLE);
	for _,v in pairs(dogremove) do
		v:Despawn();
	end
end

function spawnPortalPhase2(eventid, delay, repeats, creature)
	creature:SummonGameObject( PORTAL_PURPLE, -8565.8565, 1956.883789, 71.046104, 1.150472 )
	creature:SummonGameObject( PORTAL_PURPLE, -8593.100586, 2025.780029, 71.046104, 5.862851 )
	creature:SummonGameObject( PORTAL_PURPLE, -8623.068336, 1975.771606, 71.046104, 0.325797 )
end

function moveChase(eventid, delay, repeats, creature)
	creature:MoveChase(creature:GetVictim());
	creature:RemoveAura(SPELL_SHIELD);
end

function getSummonedAround(eventid, delay, repeats, creature)
	local dobonus = creature:GetCreaturesInRange( 5000, NPC_SUMMONED, 0, 1 );
	for k,v in pairs(dobonus) do
		Bonus = Bonus + 1
		v:DespawnOrUnsummon( 0 )
	end
	if(Bonus > 5)then
		Bonus = 5
	end
	for i=1,Bonus do
		creature:AddAura(39092, creature)
	end
end

function Velkor.phase4(eventID, delay, pCall, creature)
	if creature:HealthBelowPct(25) == true then
		creature:RemoveEvents()
		local players = creature:GetPlayersInRange( 5000, 1, 1 )
		for _,v in pairs(players) do
			creature:SendUnitWhisper("Velkor passe en phase 4 !", 0, v, true)
		end
		creature:RegisterEvent(Timer, 1000, 0)
		creature:SetHealth( 2000000000 );
		creature:SetMaxHealth( 2000000000 )
		creature:RegisterEvent(Velkor.WHIRL, 45000, 0)
		creature:RegisterEvent(Velkor.SPRAY, 25000, 0)
		creature:RegisterEvent(Velkor.FIRESPIT, 8000, 0)
		creature:RegisterEvent(Velkor.PENETRATINGCOLD, 2000, 1)
		creature:RegisterEvent(Velkor.PENETRATINGCOLD, 20000, 0)
		creature:RegisterEvent(Velkor.LIGHTTOUCH, 2000, 1)
		creature:RegisterEvent(Velkor.LIGHTTOUCH, 20000, 0)
		creature:RegisterEvent(Velkor.PARALYTIC, 30000, 0)
		creature:RegisterEvent(Velkor.BURNINBITE, 50000, 0)
		creature:RegisterEvent(Velkor.TroneAspect, 1000, 0)
	end
end

function Velkor.phase3(eventID, delay, pCall, creature)
	if creature:HealthBelowPct(50) == true then
		creature:RemoveEvents()
		local players = creature:GetPlayersInRange( 5000, 1, 1 )
		for _,v in pairs(players) do
			creature:SendUnitWhisper("Velkor passe en phase 3 !", 0, v, true)
		end
		creature:RegisterEvent(Timer, 1000, 0)
		creature:SetHealth( 2000000000 );
		creature:SetMaxHealth( 2000000000 )
		creature:RegisterEvent(Velkor.FIREBALL, 6000, 0)
		creature:RegisterEvent(Velkor.FELLIGHTNING, 7000, 0)
		creature:RegisterEvent(Velkor.INCINERATE, 17000, 0)
		creature:RegisterEvent(Velkor.LEGIONFLAME, 18000, 0)
		creature:RegisterEvent(Velkor.phase4, 500, 0)
		creature:RegisterEvent(Velkor.TroneAspect, 1000, 0)
	end
end

function Velkor.phase2(eventID, delay, pCall, creature)
	if creature:HealthBelowPct(70) == true then
		creature:RemoveEvents()
		local players = creature:GetPlayersInRange( 5000, 1, 1 )
		for _,v in pairs(players) do
			creature:SendUnitWhisper("Velkor passe en phase 2 !\nTuez ses sbires avant qu'il n'aspire leur puissance.", 0, v, true)
		end
		creature:RegisterEvent(Timer, 1000, 0)
		creature:SetScale(1.1)
		creature:CastSpell(creature, SPELL_SHIELD);
		creature:SetSpeed( 1, 1 )
		creature:SetHealth( 2000000000 );
		creature:SetMaxHealth( 2000000000 )
		creature:MoveTo(1, -8535.220703, 2016.464111, 71.046104, true);
		creature:RegisterEvent(spawnPortalPhase2, 1000, 1)
		creature:RegisterEvent(Velkor.phase3, 500, 0)
		creature:RegisterEvent(spawnCreaturesPhase2, 3000, 1)
		creature:RegisterEvent(spawnCreaturesPhase2, 12000, 2)
		creature:RegisterEvent(spawnInterPhase, 45000, 1)
		creature:RegisterEvent(moveChase, 60000, 1)
		creature:RegisterEvent(getSummonedAround, 42000, 1)
		creature:RegisterEvent(Velkor.TroneAspect, 1000, 0)
	end
end

function Velkor.onCombat(event, creature, target)
	Time = 0
	creature:RemoveEvents()
	creature:SetScale(1)
	creature:SetRooted( false )
	creature:SetHealth( 2000000000 );
	creature:SetMaxHealth( 2000000000 )
	creature:RegisterEvent( Timer, 1000, 0) 
	creature:RegisterEvent(Velkor.phase2, 13000, 0)
	creature:RegisterEvent(Velkor.VOLLEY, 3500, 0)
	creature:RegisterEvent(Velkor.FIRESPIT, 9000, 0)
	creature:RegisterEvent(Velkor.FIREBALL, 7500, 0)
	creature:RegisterEvent(Velkor.TWISTED, 15000, 0)
	creature:RegisterEvent(Velkor.TroneAspect, 1000, 0)
end

function Velkor.onLCombat(event, creature, target)
	Time = 0
	creature:RemoveEvents()
	creature:SetRooted( false )
	creature:SetHealth( 2000000000 );
	creature:SetMaxHealth( 2000000000 )
	creature:EmoteState( 428 )
	creature:SetScale(0.7)
end

function Velkor.onDie(event, creature, killer)
	creature:RemoveEvents()
	creature:SendUnitSay( "Vous avez mis : " .. SecondsToClock(Time) .. " pour me tuer", 0)
end

local function RegenOnKillInterphaseMob(event, killer, killed)
	local cGuid = killed:GetGUID();
	local cEntry = GetGUIDEntry(cGuid);
	if(cEntry ==  NPC_INTERPHASE)then
		killer:AddAura(SPELL_REGEN, killer)
	end
end

RegisterCreatureEvent(NPC_VELKOR, 5, Velkor.onSpawn)
RegisterCreatureEvent(NPC_VELKOR, 1, Velkor.onCombat)
RegisterCreatureEvent(NPC_VELKOR, 2, Velkor.onLCombat)
RegisterCreatureEvent(NPC_VELKOR, 4, Velkor.onDie)
RegisterPlayerEvent( 7, RegenOnKillInterphaseMob, 0 )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
RunicDancingWeapon = 27893;

function OnRunicDancingWeaponSummoned(event, creature, summoner)
	local cName = creature:GetName();
	local sName = summoner:GetName();
	creaturetoattack = summoner:GetVictim();

	function Chains( event, delay, pCall, creature, creaturetoattack )
		creature:CastSpell(creaturetoattack, 45524, true);
	end

	function IcyTouch( event, delay, pCall, creature, creaturetoattack )
		creature:CastSpell(creaturetoattack, 49909, true);
	end

	function PlagueStrike( event, delay, pCall, creature, creaturetoattack )
		creature:CastSpell(creaturetoattack, 49921, true);
	end

	function DeathCoil( event, delay, pCall, creature, creaturetoattack )
		creature:CastSpell(creaturetoattack, 47632, true);
	end

	creature:AttackStart( creaturetoattack);

	creature:RegisterEvent(Chains, {1000, 10000}, 1);
	creature:RegisterEvent(IcyTouch, {1000, 10000}, 2);
	creature:RegisterEvent(PlagueStrike, {1000, 10000}, 2);
	creature:RegisterEvent(DeathCoil, {1000, 5000}, 2);
end

RegisterCreatureEvent( RunicDancingWeapon, 22, OnRunicDancingWeaponSummoned )

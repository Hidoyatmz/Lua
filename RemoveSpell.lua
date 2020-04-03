local function RemoveSpell(event, player)
	local pClass = player:GetClassAsString(2);
	if(player:HasSpell(16880) and pClass ~= "Druide")then
		player:AddItem(3000002, 30);
		player:RemoveSpell(16880)
	elseif(player:HasSpell(29077) and pClass ~= "Mage")then
		player:AddItem(3000002, 30);
		player:RemoveSpell(29077)
	elseif(player:HasSpell(1456) and pClass ~= "Démoniste")then
		player:AddItem(3000002, 20);
		player:RemoveSpell(1456)
	elseif(player:HasSpell(30823) and pClass ~= "Chaman")then
		player:AddItem(3000002, 35);
		player:RemoveSpell(30823)
	elseif(player:HasSpell(31842) and pClass ~= "Paladin")then
		player:AddItem(3000002, 30);
		player:RemoveSpell(31842)
	end
end

RegisterPlayerEvent( 3, RemoveSpell )
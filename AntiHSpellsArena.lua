local function OnPlayerCastSpellInArena(event, player)
  if(player:InArena())then
    local pGuid = player:GetGUIDLow();
    local hspells = 0;
    local QueryHSpells = WorldDBQuery("SELECT spellid, classid, unlearn FROM spellvendor");
    if(QueryHSpells) then
        repeat
          local row = {
            spellid   = QueryHSpells:GetUInt32(0),
            classid    = QueryHSpells:GetUInt32(1),
            unlearn    = QueryHSpells:GetUInt32(2),
          }
          if(player:HasSpell(row.spellid) and player:GetClass() ~= row.classid)then
            player:RemoveSpell(row.unlearn);
            WorldDBExecute("INSERT INTO user_spells_bank(guid, spell) VALUES("..pGuid..", "..row.spellid..")");
          end
        until not QueryHSpells:NextRow()
    end
  end
end

local function OnPlayerCastSpellInArenaGetBack(event, player)
  local pGuid = player:GetGUIDLow();
  local hspells = 0;
  local QueryBSpells = WorldDBQuery("SELECT spell FROM user_spells_bank WHERE guid = "..pGuid);
  if(QueryBSpells) then
      repeat
        local spellid = QueryBSpells:GetUInt32(0);
        player:LearnSpell(spellid);
        WorldDBExecute("DELETE FROM user_spells_bank WHERE guid = "..pGuid.." AND spell = "..spellid);
      until not QueryBSpells:NextRow();
  end
end

RegisterPlayerEvent( 28, OnPlayerCastSpellInArena )
RegisterPlayerEvent( 28, OnPlayerCastSpellInArenaGetBack )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
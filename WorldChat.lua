local Command = "/c"

function ChatSystem(event, player, msg, _, _)
		local name = player:GetName();
    class = player:GetClass();
    local pMessage = msg:gsub("%'", " ");
    local iscommand = string.sub(msg, 0, 2);
    local pMessage = string.sub(pMessage, 4);
    local pName = player:GetName();
    local pDate = os.date("%H:%M:%S");

    coloredname = {
      [1] = "|TInterface\\icons\\Ability_Warrior_OffensiveStance.png:22|t |cFFF4A460" .. name .. ":|r",
      [2] = "|TInterface\\icons\\Ability_Paladin_SheathofLight.png:22|t |cFFFFC0CB" .. name .. ":|r",
      [3] = "|TInterface\\icons\\Ability_Hunter_ZenArchery.png:22|t |cff00ff00" .. name .. ":|r",
      [4] = "|TInterface\\icons\\Ability_Rogue_Waylay.png:22|t |cFFFFFF00" .. name .. ":|r",
      [5] = "|TInterface\\icons\\Spell_Shadow_Shadowform.png:22|t |cffffffff" .. name .. ":|r",
      [6] = "|TInterface\\icons\\Spell_Deathknight_BloodPresence.png:22|t |cffff0000" .. name .. ":|r",
      [7] = "|TInterface\\icons\\Spell_Shaman_StaticShock.png:22|t |cff0000ff" .. name .. ":|r",
      [8] = "|TInterface\\icons\\Ability_Mage_ShatterShield.png:22|t |cFF5F9EA0" .. name .. ":|r",
      [9] = "|TInterface\\icons\\Ability_Warlock_FireandBrimstone.png:22|t |cFF800080" .. name .. ":|r",
      [11] = "|TInterface\\icons\\Ability_Druid_TigersRoar.png:22|t |cFFFFA500" .. name .. ":|r"
    }

    if (msg:find(Command.." ") == 1) then
      for _, v in pairs(GetPlayersInWorld()) do
        if (player:IsAlliance() == false) then
          if (player:IsGM() == false) then
            v:SendBroadcastMessage("|cFFCC0066[World - "..pDate.."]|r |TInterface\\icons\\Inv_Misc_Tournaments_banner_Orc.png:22|t".. coloredname[class] .." |cFFFFEFD5"..msg:gsub(Command.." ", ""))
          else
            v:SendBroadcastMessage("|cFFCC0066[World - "..pDate.."]|r |cFFD2B48C[STAFF]|r |TInterface\\icons\\Inv_Misc_Tournaments_banner_Orc.png:22|t".. coloredname[class] .." |cFFFFEFD5"..msg:gsub(Command.." ", ""))
          end
        else
          if (player:IsGM() == false) then
            v:SendBroadcastMessage("|cFFCC0066[World - "..pDate.."]|r |TInterface\\icons\\Inv_Misc_Tournaments_banner_Human.png:22|t".. coloredname[class] .." |cFFFFEFD5"..msg:gsub(Command.." ", ""))
          else
            v:SendBroadcastMessage("|cFFCC0066[World - "..pDate.."]|r |cFFD2B48C[STAFF]|r |TInterface\\icons\\Inv_Misc_Tournaments_banner_Human.png:22|t".. coloredname[class] .." |cFFFFEFD5"..msg:gsub(Command.." ", ""))
          end
        end
      end
    return false
    end
end
 
RegisterPlayerEvent( 18, ChatSystem )
RegisterPlayerEvent( 19, ChatSystem )
RegisterPlayerEvent( 20, ChatSystem )
RegisterPlayerEvent( 21, ChatSystem )
RegisterPlayerEvent( 22, ChatSystem )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
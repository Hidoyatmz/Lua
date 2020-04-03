local timer = 60

local announces = {
  [1] = "Si vous rencontrez un bug en jeu vous DEVEZ le signaler sur discord dans la section 'bug-report'.",
  [2] = "Groupez vous avec vos amis, le jeu à plusieurs est plus fun!",
  [3] = "Le vote, une histoire d'amour entre les joueurs et le serveur, vous pouvez voter pour nous (1 vote = 2 jetons spells)",
  [4] = "N'oubliez pas de voter toutes les 3 heures! C'est bien pour nous, et il parait que ça rajeunis les joueurs. (c'est le grand iThorgrim qui l'a dit)",
  [5] = "WoW-Crusade vous remercis de jouer chez nous, n'oubliez jamais que le monde attire le monde.",
  [6] = "Un problème ? Une question ? N'hésitez pas à soliciter l'aide des autres joueurs en utilisant le canal world avec /c + votre message.",
  [7] = "Pour être tenu informé des mises à jours / maintenance du serveur veuillez rejoindre le discord : https://discord.gg/wrp2Ghw"
}

local function announce(eventId, delay, repeats)
  local announceIndex = math.random(1, #announces)
  local currAnnounce = announces[announceIndex]
  --
  SendWorldMessage("[|cff1ABC9CWoW-Crusade|r] "..currAnnounce)
end

local function announcer(event)
  CreateLuaEvent(announce, timer * 1000, 0)
end
RegisterServerEvent(33, announcer)

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
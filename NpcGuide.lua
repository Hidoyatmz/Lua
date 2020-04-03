local NPC = 101034

local function OnGossipHello(event, player, object, unit)
	local pName = player:GetName();
	local pLevel = player:GetLevel();
		player:GossipMenuAddItem(0, "Suivre le guide", 1, 10)
		player:GossipSetText("Bonjour et bienvenue sur WoW Crusade "..pName.." !\n\n Si tu es nouveau sur le serveur, alors je te conseille très fortement de lire ces quelques prochaines page qui te dévoileront tous les secrets pour jouer dans de bonne condition sur le serveur.\n\n Si tu n'es pas un nouveau joueur, alors je te conseille de passer ces explications et faire ton choix, passer niveau 80, ou découvrir la zone de départ et accéder a quelques bonus dans un parcous rapide dans l'univers des pirates de crusade ?" );
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	end

local function OnGossipSelect(event, player, object, sender, intid, code)
	local name = player:GetName();
	local accountid = player:GetAccountId();

	if(intid == 10)then
		player:GossipMenuAddItem(0, "Dites m'en plus !", 1, 12)
		player:GossipSetText("Le serveur est de type ultra-fun, ce qui explique que vos statistiques seront très élevées mais cela a pour but de vous faire découvrir une nouvelle facette de cette extension dans des combats bien plus rythmés et de nouvelles mécaniques !\n\nC'est un style différent et particulier, peut paraitre compliqué au début mais je suis certain que vous y prendrez très vite goût !");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 12)then
		player:GossipMenuAddItem(0, "Mais encore ?", 1, 13)
		player:GossipSetText("Sur le serveur, nous avons décidé de vous offrir le choix de commencer niveau 80 directement (oui le pexing c'est ennuyant) ou de commencer niveau 1 (pour les plus courageux) et découvrir l'univers des pirates de crusade dans une suite de quelques quêtes.\n\nCes quêtes vous offriront des fragments de jetons spells qui vous servirons à acheter les sorts d'autres classes (exemple : un paladin qui peut utiliser le vol du sort des mages pour voler les améliorations temporaire des autres joueurs !)");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 13)then
		player:GossipMenuAddItem(0, "Et quoi d'autres ?", 1, 14)
		player:GossipSetText("Nous avons repensé le moyen de faire les donjons & les raids, afin d'accéder à un donjon ou un raid, vous devez en posséder sa clef, chaque jour à 22h00, vous pouvez gagner une clef gratuite au près du NPC en question ou vous pouvez aussi les gagner en tuant les yetis de la zone clef accessible au teleporteur !\n\nN'ayez pas d'inquiétude ! Les yétis ont pas mal de clefs sur eux et vous n'aurez pas de mal à vous faire un petit stock de coté.");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 14)then
		player:GossipMenuAddItem(0, "Et qu'est-ce que je dois faire sur le serveur ?", 1, 15)
		player:GossipSetText("Nous voulons vous offrir une aventure agréable sur le serveur, c'est pourquoi la zone accessible avec la commande .shop ou depuus le téléporter (zone shop) est pensé pour vous !\n\nEn effet, elle est grande mais n'ayez crainte, les gardes vous propose de vous téléporter dans les zones importante de celle-ci et gratuitement !\n\nSinon vous pouvez utiliser les montures vagabondes vous permettant de vous déplacer plus rapidement à travers la zone.");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 15)then
		player:GossipMenuAddItem(0, "Très bien, merci !", 1, 11)
		player:GossipSetText("Eh bien c'est simple ! Une fois que vous êtes arrivé en zone shop, vous allez directement au vendeur de départ (n'oubliez pas d'utiliser le garde pour vous y téléporter), équipez vous et partez au combat.\n\nVous pouvez aller en JcJ (Joueur contre Joueur) vous battre, il y a pour cela les champs de bataille ou les arènes.\n\nOu vous allez en JcE (Joueur contre environnement), ce sont des instances avec des créatures à tuer qui vous donnes de l'équipement, pour se faire, une fois niveau 80 accéder au téléporteur puis aller dans la catégorie 'Donjons & Raids'.");
		player:GossipSendMenu(0x7FFFFFFF, object, MenuId)
	elseif(intid == 11)then
		player:GossipComplete();
	end
end

RegisterCreatureGossipEvent( NPC, 1, OnGossipHello )
RegisterCreatureGossipEvent( NPC, 2, OnGossipSelect )

local console = debug.getinfo (1, "S").short_src;
print("- "..console);
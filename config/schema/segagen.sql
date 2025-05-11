-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql
-- Généré le : dim. 11 mai 2025 à 19:30
-- Version du serveur : 9.2.0
-- Version de PHP : 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `segagen`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id` int NOT NULL,
  `image_id` int DEFAULT NULL,
  `title` varchar(160) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text,
  `user_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `published_date` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT 'draft',
  `visibility` varchar(45) DEFAULT 'public',
  `reading_time` int DEFAULT '0',
  `seo_title` varchar(160) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `image_id`, `title`, `slug`, `content`, `user_id`, `type_id`, `published_date`, `status`, `visibility`, `reading_time`, `seo_title`, `seo_description`, `seo_keywords`, `modified`, `created`) VALUES
(1, 73, 'Streets of Rage', 'streets-of-rage', '**Développé en interne chez SEGA dans le but de concurrencer le mythique Final Fight sur Super Nintendo, Streets of Rage a bénéficié d\'une réalisation technique frôlant la perfection, le propulsant sans conteste au rang des plus grands jeux de la Mega Drive. Son succès grandement mérité incitera SEGA à réaliser quelques portages à destination de ses autres consoles et de l’arcade. Aujourd\'hui encore, impossible de ne pas évoquer Streets of Rage quand on parle de beat them up tant le titre a marqué profondément les esprits, mais est-il toujours aussi plaisant à jouer après toutes ces années passées ?**\r\n\r\nÀ la fin des années 80, le beat them up était en pleine démocratisation comme en témoigne la ribambelle de jeux sortis à cette époque sur bornes d’arcade et consoles de salon : Black Belt (SEGA, 1986), Renegade (Technos, 1986), Double Dragon (Technos, 1987), Vigilante (Irem, 1988), Altered Beast (SEGA, 1988), Street Gangs (Technos, 1989), Golden Axe (SEGA, 1989), Crime Fighters (Konami, 1989), Teenage Mutant Ninja Turtles (Konami, 1989) ou bien encore Alien Storm (SEGA, 1990).\r\n\r\nCes jeux ont contribué à l’essor du genre de par leur qualité intrinsèque et l’ingéniosité de leurs concepteurs, mais ce n’est rien en comparaison du travail accompli avec le prestigieux Final Fight de Capcom apparu pour la première fois en 1989 sur un tout nouveau système d’arcade, le CPS1 (Capcom System 1). Grâce à son système de combat et ses graphismes révolutionnaires pour l’époque, Final Fight s’est imposé naturellement comme le nouveau roi du beat them up après avoir écrasé tous ses opposants.\r\n\r\nUne légende était née, mais au grand dam de SEGA, c’est la Super Nintendo que Capcom a retenue afin d\'adapter Final Fight sur console. La situation fut très embarrassante pour les dirigeants de SEGA qui souhaitaient améliorer l’attractivité de la Mega Drive. Pour cela, il était crucial pour la firme de développer un « killer game » qui deviendrait le nouveau standard en la matière. C’est alors que dans le plus grand des secrets, le projet se voit confié au studio AM7 sous la direction de Noriyoshi Ohba également réputé pour avoir travaillé sur The Revenge of Shinobi et Shinobi III.\r\n\r\n{{< image id=\"106\" >}}\r\n\r\n\r\n## Sous un fond de ville meurtrie...\r\n\r\nClairement, Noriyoshi Ohba ne nous a guère sorti sa plus belle plume pour imaginer le scénario de Streets of Rage, mais l\'intrigue se veut suffisamment prenante pour nous inciter à prendre part à l\'action aux côtés d’Adam Hunter, Axel Stone et Blaze Fielding. C’est au péril de leur vie que ces trois experts en arts martiaux ont juré d’anéantir le syndicat du crime qui sévit en toute impunité dans leur ville aux allures d’un New York meurtrie. La séquence d\'introduction nous plonge inlassablement dans une ambiance si particulière où l’histoire est rapidement résumée avant de laisser place à l’écran titre. C’est tout simplement bluffant !\r\n\r\nUne petite pression sur la touche « start » nous emmène dans le menu principal où il est possible de lancer une nouvelle partie en solo ou en coopération lorsqu’une seconde manette est connectée. Quelques options sont disponibles afin de régler la difficulté échelonnée sur quatre niveaux (facile, normal, difficile et très difficile), de choisir la configuration des contrôles parmi les trois profils sélectionnables ou bien d\'écouter la totalité des bruitages et autre musique du jeu.\r\n\r\n{{< images >}}\r\n{{< image id=\"105\" >}}\r\n{{< image id=\"109\" >}}\r\n{{< /images >}}\r\n\r\n\r\nContrairement à Final Fight, les combattants sont ici évalués individuellement selon trois critères : la puissance, le saut et la vitesse. La lettre \"A\" désigne le point fort d’un personnage tandis que la lettre \"B\" correspond à son point faible. Aux premiers abords, ces critères ne semblent pas directement influencer sur le gameplay, mais en augmentant le niveau de difficulté, le joueur doit impérativement adapter son style de jeu en fonction des compétences du personnage choisi afin de maximiser ses chances de réussites. Par exemple, Adam est un combattant puissant qui peut frapper sur une longue distance en effectuant un coup de pied sauté latéral, mais sa faible vitesse de déplacement nécessite d’anticiper les attaques qui ne peuvent être évitées. À contrario, Axel est un combattant puissant et rapide, mais sa faible détente verticale l’empêche de se défendre efficacement lorsque trop d’ennemis l’entourent.\r\n\r\n## Une immersion totale\r\n\r\nLe premier niveau débute dans les ruelles malfamées de la ville au rythme effréné d\'une musique électronique plongeant immédiatement le joueur dans une immersion totale. Il est vrai que Streets of Rage reprend les ingrédients qui ont fait le succès de Final Fight, mais le titre se distingue par une progression plus dynamique et un système de combat remanié. Dans l’optique d’ajouter un peu d’originalité, le studio AM7 a eu l’idée d’insérer une voiture de police qui, une fois appelée en renfort, se charge d’éliminer à coup de napalm toute la racaille se trouvant dans la zone. La cinématique diffère légèrement pour le second joueur qui verra, à la place du napalm, un lance-grenade tout aussi efficace.\r\n\r\nQuel que soit le niveau de difficulté choisi, l\'attaque spéciale est limitée à une seule utilisation par round, mais elle peut être renouvelée en perdant une vie ou en récupérant l\'un des rares items représentant une petite voiture de police. Bien que la cinématique soit très réussie en plus d’impressionner à l’écran, on constate avec du recul que cette dernière casse un peu le rythme de l’action, puisqu\'une fois active, le temps se fige durant quelques secondes et empêche tout déplacement.\r\n\r\n{{< image id=\"99\" >}}\r\n\r\n{{< images >}}\r\n{{< image id=\"107\" >}}\r\n{{< image id=\"98\" >}}\r\n{{< image id=\"108\" >}}\r\n{{< /images >}}\r\n\r\n\r\nHormis les enchaînements traditionnels, le système de combat nous offre le luxe d\'effectuer une attaque en arrière, un déchaînement ou différentes prises telles que la projection, la chute sur le dos ou la voltige. Certains ennemis peuvent aussi nous projeter dans les airs, mais en pressant simultanément la combinaison de touches « haut » et « saut », il est possible de maîtriser la chute afin de ne pas perdre d’énergie.\r\n\r\nLe studio AM7 nous livre un système de combat déjà très complet, mais les concepteurs sont allés plus loin dans leur démarche en ajoutant la possibilité de donner plusieurs doubles coups de pied ou d’exécuter une projection par la nuque lorsqu\'un ennemi nous agrippe par-derrière. En mode deux joueurs, cette action peut donner une super attaque à condition d\'être bien synchro avec son partenaire. Enfin, sachez qu’il faut veiller à bien respecter un espace de sécurité entre les deux joueurs, car il est possible de blesser accidentellement son coéquipier en tentant de frapper un adversaire aux alentours.\r\n\r\n## En route pour débusquer la racaille !\r\n\r\nEn tout, le jeu totalise huit étapes qui nous emmènent visiter différents endroits de la ville en passant par des ruelles, un centre-ville, une plage, un pont, un bateau, une usine, un ascenseur de service et en guise de final, le quartier général des méchants. Sur le chemin, certains éléments du décor peuvent être détruits afin de récupérer un précieux item permettant de récupérer une quantité d\'énergie partielle ou complète, d’améliorer son score, ou bien alors de gagner une vie supplémentaire.\r\n\r\nIl est aussi possible de ramasser quelques armes improvisées comme une bouteille en verre, une batte de base-ball, une barre de plomb, un couteau papillon, ou une poivrière destinée à aveugler temporairement un ennemi. Cependant, au moment d\'attaquer un ennemi, notre personnage à cette fâcheuse habitude de ramasser en priorité un objet se trouvant près de lui étant donné qu’un seul bouton est affecté à ces deux actions. Forcément, l\'ennemi en face se fait une joie de frapper à tous azimuts tant que l\'objet nous empêche de riposter. Je pense qu’il aurait été judicieux d\'utiliser une combinaison de touches destinée à récupérer un objet afin d\'éviter ce genre de situation agaçante, mais peut-être qu’il s’agit d’un choix délibéré afin de ne pas rendre les contrôles trop compliqués.\r\n\r\n{{< image id=\"103\" >}}\r\n\r\nLa mémoire ROM des premières cartouches Mega Drive ne faisant que 4 mégabytes, les concepteurs ont été contraints de se limiter à cinq types d’ennemis et d’y appliquer trois palettes de couleurs distinctes afin de créer une illusion de diversité. Ainsi, l’action nous envoie tabasser toute une meute de punks enragés accompagnés de criminels, chefs de clubs, adeptes de kung-fu et autres jongleurs déjantés. Attention à ne pas les sous-estimer, car chaque type d’ennemi possède son propre style de combat et certains d’entre eux sont capables d’utiliser des armes pouvant occasionner de sérieux dégâts !\r\n\r\nAujourd’hui encore, il est très étonnant de voir tous ces ennemis chercher le bon angle d’attaque et d’évaluer les risques potentiels avant de passer à l’action. Ceci pousse le joueur à rester très vigilant durant sa progression afin de préserver sa barre d’énergie en vue de tenir tête à l’un des six boss présents.\r\n\r\nC’est peu, mais en contrepartie, chacun d’entre eux s’offre un sprite de grande taille dont la réalisation s’avère très soignée, excepté pour le cinquième niveau où il est question de se mesurer à deux simples clones de Blaze. Une fois trouvée la technique imparable pour esquiver leur coup dévastateur, les combats se déroulent sans accrocs, mais les choses se compliquent lorsque l’un de ces gros méchants appelle en renfort quelques loubards cherchant à nous ralentir. Plus difficile encore, la dernière étape nous invite à affronter tous les boss précédemment vaincus avant d’accéder à une grande pièce où se trouve le fameux « Mr. X », un adversaire redoutable armé d’une arme automatique en plus d’être accompagné de ses meilleurs hommes de main.\r\n\r\n{{< images >}}\r\n{{< image id=\"101\" >}}\r\n{{< image id=\"104\" >}}\r\n{{< /images >}}\r\n\r\n\r\nIl s’agit d’un sacré challenge et pourtant, Streets of Rage s’adapte très bien aux novices qui pourront faire leurs premiers pas en douceur grâce au mode facile qui dispose d’une difficulté plutôt bien équilibrée. Les joueurs les plus expérimentés ne sont pas en reste puisqu’en jouant dans les modes de jeu les plus difficiles, le jeu devient radicalement plus ardu où la moindre erreur peut s’avérer fatale.\r\n\r\nEn mode coopération, il faudra veiller à bien s’entraider, car une fois privé de son partenaire, il devient presque impossible de continuer la partie puisque le jeu multiplie par deux le nombre de boss et d’ennemis à affronter. Il faut aussi surveiller le compteur de temps qui s’écoule, car le joueur dispose d’une cinquantaine de secondes pour passer à la zone de combat suivante. Dans le cas où le temps limité se serait entièrement écoulé, le jeu nous soutire une vie, mais fort heureusement, cela se produit rarement à moins de lambiner en cours de chemin.\r\n\r\n## Beau, technique et difficile\r\n\r\nArcade oblige, le jeu se termine assez rapidement puisqu’il faut compter environ trois quarts d’heure avant d’achever le boss de fin. C’est plutôt honorable pour ce type de jeu qui nous invite à retenter régulièrement l’expérience dans le but d\'améliorer son score ou bien de mettre à rude épreuve sa dextérité en jouant dans les modes de difficulté les plus élevés. De plus, le mode deux joueurs reste une très bonne occasion de ressortir la cartouche afin de passer un moment convivial entre amis et qui, en prime, permet de découvrir deux fins différentes.\r\n\r\nPour l’époque, Streets of Rage hérite d’un rendu graphique de bonne facture comme le démontre les différents sprites qui s’animent merveilleusement bien au travers de décors fouillés où l’on y aperçoit quelques petites animations telles que le clignotement de panneaux lumineux, l’eau qui s’écoule d’une gouttière, le passage d’une courte averse ou bien encore le vent emportant sur son passage tout un lot de détritus.\r\n\r\nAjouté à cela des couleurs vives et un style graphique efficace, on obtient un jeu très réussi graphiquement même s’il faut reconnaître que le studio AM7 était, à ce moment, très loin d’exploiter tout le potentiel offert par la Mega Drive. À noter que de rares ralentissements apparaissent de temps à autre en jouant à deux ou lorsqu’un trop grand nombre d’ennemis s’affichent à l’écran. Impossible d’affirmer s’il s’agit d’un bug ou d’un manque d’optimisation, mais le problème est bien présent que ce soit sur une console japonaise ou occidentale.\r\n\r\n{{< image id=\"102\" >}}\r\n\r\nPar ailleurs, il n’existe aucune différence notable entre les différentes régions si ce n’est une image plus grande et une vitesse amoindrie pour la version PAL. En outre, la prise en main est immédiate et ne demande aucune maîtrise particulière pour progresser dans les différentes zones de combat. Cela dit, il faut être réactif et user des bonnes attaques afin de gérer au mieux les multiples vagues d’ennemis qui se présentent à l’écran. Dans les grandes lignes, on ressent parfaitement les sensations et le plaisir de l’arcade, ce qui est étonnant pour un jeu conçu spécifiquement au départ pour une console de salon.\r\n\r\n\r\nGrande figure de chez SEGA, Yūzō Koshiro met un point d’honneur à la réalisation de Streets of Rage en y insérant une composition musicale mélodieuse. Pour la première fois, le génie de l’artiste utilise un mélange de techno et d’house afin de taper dans un registre purement électro. Le résultat est une pure merveille pour les oreilles où chaque musique nous immerge sans pareil dans une ambiance dès plus oppressante en plus de démontrer avec brio toute la pureté du son et le potentiel offert par le processeur sonore de la Mega Drive.\r\n\r\nCurieusement, on ne retrouve pas ce même degré de qualité concernant les effets sonores qui, hélas, sont dénués de profondeur et de clarté. Difficile de faire l’impasse sur ce sentiment d’inégalité quant à la qualité audio du jeu d’autant plus que le problème n’a pas été corrigé dans la version apparue sur Mega CD malgré l’effort d’insérer des voix digitalisées. Le studio AM7 peut être fier d’avoir donné vie à un jeu aussi époustouflant qui a marqué un tournant majeur dans l’histoire de la Mega Drive et celle du jeu vidéo. \r\n\r\nStreets of Rage rempli parfaitement son objectif en pulvérisant Final Fight grâce à son excellent gameplay qui repose sur un système de combat à la fois nerveux et efficace. Oui, c’est vrai, on pourrait lui reprocher de ne pas être aussi abouti graphiquement que son grand rival, mais le titre de SEGA se démarque en affichant des couleurs plus vives, ce qui lui confère un aspect visuel plus attrayant en plus de disposer de superbes mélodies signées Yūzō Koshiro contribuant grandement à rendre Streets of Rage aussi exceptionnel encore à l’heure actuelle. \r\n\r\nPour conclure, je dirais qu\'il s’agit d\'un véritable chef-d’œuvre qu’il m’est toujours aussi plaisant à redécouvrir malgré son âge avancé. Comme beaucoup durant mon enfance, j’ai passé un grand nombre d’heures sur ce monolithe et aujourd’hui, je m’y adonne encore très régulièrement sans éprouver la moindre lassitude. L’idéal est bien entendu d’y jouer sur Mega Drive afin de revivre intégralement l’expérience d’antan, mais si la prise péritel vous rebute à l’ère de la haute définition, vous ne trouverez aucune difficulté à acquérir légalement le soft par le biais des différentes plateformes de téléchargements moyennant quelques maigres pièces et, ô combien, il les mérite allègrement tant il transpire la nostalgie et l\'émerveillement. SEGA ! \r\n\r\n', 1, 2, '2018-07-28 12:07:00', 'published', 'public', 14, 'Streets of Rage', ':)', 'baston, sega', '2025-05-01 15:56:04', '2025-05-01 15:56:04'),
(2, 76, 'Dead or Alive', 'dead-or-alive', '**Après avoir rencontré un succès fulgurant dans les salles d\'arcade du Japon, le prodigieux *Dead or Alive* débarque sur SEGA Saturn en 1997\\. Porté par la Team Ninja, ce jeu de combat avait impressionné à l\'époque par ses graphismes et sa technicité. Pourtant, la version Saturn reste encore aujourd\'hui injustement méconnue, souvent éclipsée par la version PlayStation, considérée comme supérieure. Qu’en est-il réellement ? Plongeons dans une analyse complète pour découvrir ce que cette version Saturn a vraiment dans le ventre.**\r\n\r\nLa SEGA Saturn est une console hors du commun qui a reçu pléthore de jeux de combat, aussi bien en 2D qu’en 3D. Dead or Alive s’ajoute à sa ludothèque déjà bien riche, aux côtés de titres emblématiques tels que Virtua Fighter 2, Last Bronx, Fighting Vipers ou encore Fighters Remix. Mais avant de nous attaquer à la version Saturn, il est essentiel de comprendre les raisons qui ont poussé Tecmo à mettre au point un nouveau jeu de combat alors que le marché était déjà en proie à une concurrence féroce.\r\n\r\n## Mort ou Vif,  le dernier espoir\r\n\r\nAu milieu des années 90, Tecmo traversait une période difficile et la création de *Dead or Alive* représentait alors son dernier espoir pour éviter la faillite. La société a confié à Tomonobu Itagaki, la lourde tâche de créer un jeu capable de rivaliser avec le très populaire *Virtua Fighter 2\\.* S’inspirant de ce dernier, Itagaki a développé Dead or Alive en incluant diverses améliorations dont des combats plus dynamiques et un contenu provocateur pour attirer un maximum de joueurs. Conçu pour la carte SEGA Model 2, le jeu a connu un grand succès au Japon permettant ainsi à Tecmo de se redresser financièrement. Cependant, il n’a pas réussi à s’imposer en Occident, notamment à cause de Tekken qui régnait en maître absolu.\r\n\r\nTecmo avait alors décidé de se concentrer sur le marché japonais en préparant une version console, initialement prévue pour la Nintendo 64, pour finalement atterrir sur Saturn. Ce choix s’avéra judicieux puisque Dead or Alive reposait entièrement sur le moteur de *Virtua Fighter 2*, facilitant ainsi sa conversion console. Bien que moins puissante que le Model 2, la Saturn pouvait offrir un portage de bonne facture dans un délai relativement court.\r\n\r\n{{< image id=\"110\" >}}\r\n\r\nIl est bon de noter que l\'éditeur Acclaim avait entrepris de commercialiser une version américaine, mais le projet fut tragiquement abandonné sans fournir la moindre explication. Cette absence de version occidentale a certainement été préjudiciable, même si plus tard, le jeu a été distribué sur le continent par le biais d’une version PlayStation. Bien que ce soit fort regrettable pour les joueurs sur Saturn, on peut supposer que les parts de marché détenues à ce moment par la console étaient trop faibles pour qu’une sortie outre-Atlantique soit réellement envisageable.\r\n\r\nÀ présent que nous connaissons plus en détails les conditions dans lesquelles Dead or Alive est arrivée sur Saturn, il est temps de brancher la console et d’évaluer ce que vaut réellement cette adaptation. Pour ce test, j’ai utilisé la version standard avec une console japonaise, mais il faut savoir que Dead or Alive a aussi été publié en édition limitée (Genteiban) comprenant un étui, un artbook et une image différente sur la face du CD. Il s’agit d’une belle pièce que tout fan de la franchise se doit de posséder d’autant plus que son prix de vente reste encore très raisonnable à l’heure où j\'écris ces lignes.\r\n\r\n## Le grand tournois DOA\r\n\r\nL’intrigue se focalise sur un tournoi organisé par la DOATEC, une société à la pointe de la technologie menant en parallèle de ses activités, des expériences secrètes sur la manipulation génétique et le clonage. Ce tournoi mondial réunit une poignée de combattants venus de divers horizons ayant chacun leurs propres motivations pour y participer. Certains combattent pour l’honneur et la gloire, d’autres pour assouvir leur soif de vengeance ou mener à bien une quête.\r\n\r\n{{< image id=\"112\" >}}\r\n\r\nMême si Dead or Alive est un jeu qui se concentre essentiellement sur les combats plutôt que son histoire, on ne peut que saluer l’effort d’avoir inséré une intrigue suffisamment intéressante pour augmenter l’intérêt du jeu, d’autant plus que chaque combattant possède son propre backstory, permettant ainsi de créer un attachement entre le joueur et les personnages.\r\n\r\nCette version Saturn inclut divers modes supplémentaires pour profiter pleinement du jeu à domicile. Accessible depuis l’écran principal après une courte cinématique, on retrouve le mode arcade, time attack, training, survival, versus et kumite. Ce dernier est sans doute le plus intéressant de tous, car il propose d’affronter un grand nombre de combattants tout en calculant le ratio victoires/défaites. Dans ce mode, la progression ne peut pas être sauvegardée et il faudra donc prévoir un peu de temps devant soit pour avoir la satisfaction de terminer la partie. Cela ne pose pas trop de problème lorsqu’on affronte 30 à 50 adversaires, mais au-delà, cela devient un véritable défi qui devrait vous occuper durant au moins une bonne heure.\r\n\r\nLe mode survie aurait pu également offrir un grand intérêt, mais il ne permet pas d’enchaîner rapidement une nouvelle partie après avoir perdu. En effet, le but est de survivre match après match en retrouvant partiellement quelques points de vie et le jeu s’arrête une fois vaincu. Pour recommencer, il faut alors passer par l’écran game over, l’écran titre avant de revenir à l’écran principal pour sélectionner à nouveau le mode et choisir son personnage. Il y a bien au moins une bonne dizaine de secondes qui se sont écoulées entre temps, ce qui dissuade de retenter plusieurs fois d\'affilée l’expérience. Dommage, car j’aurais vraiment préféré que le jeu nous propose de simplement recommencer la partie d’une simple pression sur le bouton “Start” à la manière du mode arcade ou time attack.\r\n\r\n{{< image id=\"122\" >}}\r\n\r\nEn plus des différents modes de jeu, Dead or Alive propose un menu spécial permettant de débloquer plusieurs options secrètes influant sur le gameplay. Ce petit ajout est très appréciable, car il renforce l’intérêt du jeu une fois que l’on a exploré ses principaux aspects. En complément, il est possible de débloquer des costumes supplémentaires pour chaque personnage en terminant plusieurs fois le mode arcade.\r\n\r\n## Un casting d’enfer\r\n\r\nUn des grands atouts de Dead or Alive est sans le moindre doute son casting d\'enfer qui se compose de figures charismatiques, bien que certaines ressemblances avec les personnages de Virtua Fighter 2 soient évidentes. En portant le regard sur les trois combattantes disponibles, il est difficile de ne pas tomber éperdument amoureux de l\'une d\'entre elle :  Kasumi, une kunoichi membre du clan Mugen Tenshin, Lei Fang, une adepte du taikyokuken et Tina Armstrong, lutteuse professionnelle. En toute franchise, Dead or Alive n’aurait assurément pas le même peps sans ces personnages divins à la plastique parfaite.\r\n\r\nIl convient de préciser que les costumes des combattants féminins sont pour le moins audacieux, mettant en valeur les courbes de leur corps sublime en tout point. Par ailleurs, les poitrines voluptueuses bougent de manière exagérée rien que pour le plaisir des yeux et certaines tenues laissent même entrevoir les sous-vêtements sans la moindre censure. Ce contenu provocateur contribue considérablement à l’attrait visuel du jeu, une chose qui serait impensable aujourd’hui tant le corps de la femme y est sexualisé à outrance. Que c’est bon l\'esprit des années 90 \\!\r\n\r\n{{< images >}}\r\n{{< image id=\"124\" >}}\r\n{{< image id=\"133\" >}}\r\n{{< /images >}}\r\n\r\nPour le reste des protagonistes, Dead or Alive propose également des combattants qui ne manquent pas d’attrait : Ryu Hayabusa, le puissant shinobi issu de la franchise Ninja Gaiden ; Bayman, un assassin effroyable formé par l’armée russe ; Zack, un DJ déjanté qui se bat avant tout pour l’argent ; Gen Fu, un grand maître du shini-rokugo-ken à ne surtout pas sous estimer ; et enfin, Jan Lee, un adepte du Jeet Kune Do, un art martial redoutable créé par le vénéré Bruce Lee.\r\n\r\nDû fait de leur similitude avec les combattants de Virtua Fighter 2, il est aisé de trouver les correspondances pour certains d’entre eux. Ainsi, nous avons Lei Fang pour Pan Chan, Ryu Hayabusa pour Kage-Maru, Gen Fu pour Shaun Di ou bien encore Tina Armstrong qui pourrait correspondre à Sarah Bryant et je serais même tenté de dire que Jacky Bryant a inspiré le personnage de Jan Lee.\r\n\r\n{{< image-text src=\"/media/games/sega-saturn/dead-or-alive/characters/kasumi.webp\" alt=\"\" class=\"\" >}}\r\n### Kasumi  \r\nPersonnage central de *Dead or Alive*, Kasumi est une kunoichi destinée à devenir le chef du clan Mugen Tenshin. Elle décide cependant de quitter secrètement son village pour découvrir qui a attaqué et paralysé son frère, Hayate.\r\n{{< /image-text >}}\r\n\r\n{{< image-text src=\"/media/games/sega-saturn/dead-or-alive/characters/ryu.webp\" alt=\"\" class=\"\" >}}\r\n### Ryu Hayabusa  \r\nLégendaire shinobi de la célèbre franchise *Ninja Gaiden*, Ryu Hayabusa rejoint le tournoi pour relever de nouveaux défis tout en recherchant la sœur de son meilleur ami, Hayate, qui a mystérieusement disparue de son village.\r\n{{< /image-text >}}\r\n{{< image-text src=\"/media/games/sega-saturn/dead-or-alive/characters/bayman.webp\" alt=\"\" class=\"\" >}}\r\n### Bayman\r\nAgent spécial russe et expert en Sambo, Bayman a pour mission d’éliminer le dirigeant de la DOATEC, Fame Douglas.\r\n{{< /image-text >}}\r\n\r\n{{< image-text src=\"/media/games/sega-saturn/dead-or-alive/characters/lei-fang.webp\" alt=\"\" class=\"\" >}}\r\n### Lei Fang\r\nPratiquante experte du taikyokuken, Lei Fang est déterminée à vaincre son rival Jan Lee, qui l\'aurait sauvée d\'une attaque de rue, et ainsi prouver sa véritable force.\r\n{{< /image-text >}}\r\n\r\n{{< image-text src=\"/media/games/sega-saturn/dead-or-alive/characters/jan-lee.webp\" alt=\"\" class=\"\" >}}\r\n### Jan Lee\r\nAdepte du Jeet Kune Do, Jan Lee est un combattant passionné, en quête perpétuelle de nouveaux adversaires à défier pour son seul plaisir.\r\n{{< /image-text >}}\r\n\r\n{{< image-text src=\"/media/games/sega-saturn/dead-or-alive/characters/tina.webp\" alt=\"\" class=\"\" >}}\r\n### Tina Armstrong  \r\nLutteuse professionnelle, Tina rêve de percer à Hollywood. Elle participe au tournoi dans l\'espoir de se faire remarquer et décrocher son premier rôle au cinéma.\r\n{{< /image-text >}}\r\n\r\n{{< image-text src=\"/media/games/sega-saturn/dead-or-alive/characters/gen-fu.webp\" alt=\"\" class=\"\" >}}\r\n### Gen Fu\r\nMaître du shini-rokugo-ken, Gen Fu sort de sa retraite pour participer au tournoi, dans l\'espoir de gagner les fonds nécessaires pour soigner sa petite-fille, Mei Lin.\r\n{{< /image-text >}}\r\n{{< image-text src=\"/media/games/sega-saturn/dead-or-alive/characters/zack.webp\" alt=\"\" class=\"\" >}}\r\n### Zack\r\nDJ excentrique, Zack ne rejoint le tournoi que pour une seule raison : gagner un maximum d’argent.\r\n{{< /image-text >}}\r\n\r\n## Un système de combat novateur\r\n\r\nDead or Alive reprend donc de nombreux éléments de Virtua Fighter 2, mais il se distingue par un système de combat grandement amélioré grâce à l\'introduction des contres, ce qui ajoute une dimension totalement nouvelle aux affrontements. Fini les enchaînements interminables : en exécutant un contre, vous interrompez le spam et punissez sévèrement votre adversaire. Il devient alors crucial de bien réfléchir avant de frapper et de maîtriser le timing afin d\'éviter d\'être contré.\r\n\r\nLes combats sont incroyablement rapides, ce qui confère au jeu un dynamisme addictif. De plus, chaque personnage dispose d’une palette de coups suffisamment variée pour diversifier les attaques, rendant ainsi les affrontements encore plus immersifs.\r\n\r\n{{< image id=\"131\" >}}\r\n\r\nLe contrôle d’un combattant repose sur trois actions : coup de poing, coup de pied et garde. Jusqu\'ici, c\'est classique et similaire à Virtua Fighter 2, mais grâce aux différentes combinaisons, il est possible d’exécuter des coups spéciaux qui peuvent s\'avérer déterminants pour remporter la victoire. Pour effectuer un contre, il suffit d\'utiliser la garde au bon moment tout en reculant. Bien évidemment, la garde peut aussi être utilisée pour se protéger de la plupart des attaques, tout en permettant d’exécuter des prises en manipulant la croix directionnelle.\r\n\r\nOutre les habituels déplacements sur l’arène, la croix directionnelle permet également d’effectuer rapidement des dash en avant et en arrière pour surprendre l\'adversaire ou au contraire se retirer in extremis pour esquiver une attaque. Les combattants peuvent aussi courir juste avant de porter un puissant coup, mais il est essentiel de maîtriser le timing pour éviter un contre brutal.\r\n\r\nDead or Alive se distingue également par l’originalité d’intégrer une zone de danger à l’extérieur du ring, qui inflige de sérieux dégâts si un combattant y tombe avant de rebondir dans les airs. Cette mécanique est particulièrement efficace pour infliger de gros dégâts à son adversaire et remporter rapidement la victoire. Cependant, il faut rester vigilant, car cette zone peut aussi se retourner contre vous.\r\n\r\n{{< screenshots >}}\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"18\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"09\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n\r\n{{< /screenshots >}}\r\n\r\nSi les contres peuvent s’avérer décisifs dans un match, le joueur peut tout autant remporter la victoire grâce aux enchaînements qui peuvent se poursuivre même dans les airs et pendant quelques fractions de secondes une fois l\'adversaire à terre. Pour être certain qu’il ne se relèvera pas, il est possible de le finir toute en beauté avec une puissante attaque au sol. C’est tout simplement jouissif \\!\r\n\r\nIl est étonnant pour un jeu de cette génération de disposer d’un aussi grand arsenal de coups avec un haut degré d’accessibilité par rapport à d’autres jeux plus exigeants qui demanderont un grand engagement personnel pour réussir à maîtriser ses rouages. Un joueur novice peut rapidement prendre ses marques, mais il est tout à fait possible d’exceller jusqu’à devenir un adversaire redoutable en pratiquant régulièrement.\r\n\r\n\r\n## Un plaisir de combattre qui ne s’arrête jamais\r\n\r\nUn autre point fort, c’est le haut niveau de difficulté qui nous pousse à toujours donner le meilleur de nous-même pour remporter la victoire. Il est vraiment surprenant que l’IA soit aussi développée et n’hésite pas à nous balancer une vague d’enchaînement tout en contrant la plupart de nos attaques. Cela est surtout vrai à partir des trois derniers affrontements qui pourront peut-être vous faire péter un câble, surtout si vous aviez en tête de pulvériser votre meilleur temps en mode arcade ou time attack.\r\n\r\nEn branchant une seconde manette, les parties deviennent d\'autant plus jouissives, plus encore si le second joueur sait se défendre, menant à des combats intenses et palpitants. On enchaîne inlassablement match après match, cherchant à déterminer qui est le plus fort. On recommence sans cesse, soit pour reprendre l\'avantage et imposer sa domination, soit pour accorder à son adversaire une nouvelle chance de revenir dans le combat, histoire de prolonger le plaisir.\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"17\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n{{< screenshots >}}\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"04\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"07\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"15\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n\r\n{{< /screenshots >}}\r\n\r\nQuelle sensation formidable que de chercher la moindre faille, la moindre ouverture, et de l\'exploiter pour punir sévèrement, voire humilier son rival. Il est certain que le mode deux joueurs apporte un énorme plus, mais on peut tout de même regretter l\'absence d\'un mode Team Battle ou autre pour rehausser davantage le challenge.\r\n\r\nEn termes de durée de vie, Dead or Alive est tout simplement énorme, notamment grâce à son contenu déblocable qui promet plusieurs heures de jeu avant d’obtenir tous les éléments cachés. Pour ce faire, vous devrez relever divers défis, comme finir le mode *Time Attack* en moins de cinq minutes, terminer le mode *Arcade* avec tous les combattants, ou encore vaincre une dizaine d’adversaires en mode *Survival*. Il est également possible de débloquer des éléments cachés en jouant pendant une certaine durée. Comme je suis généreux, je vous offre un petit tips : entrez les initiales \'DOA\' après avoir battu votre meilleur score.\r\n\r\n\r\nMême après avoir débloqué tous les éléments cachés, il est facile de se laisser tenter par une nouvelle session de jeu, simplement pour retrouver les plaisirs du gameplay et la technicité des combats. On ne peut que reconnaître que *Dead or Alive* sur Saturn offre une durée de vie quasi illimitée, tant le plaisir reste intact, même après de longues heures de jeu. Est-ce grâce à son ambiance unique ? À ses combattantes séduisantes à voir évoluer dans l’arène ? Ou à son système de combat, à la fois efficace et captivant ? Je dirais que c’est un mélange de tout cela \\!\r\n\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"10\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n\r\n## Une technique impressionnante sur Saturn\r\n\r\nJusqu’ici, *Dead or Alive* coche toutes les cases pour être considéré comme l’un des meilleurs jeux de combat de sa génération. Mais encore faut-il réussir l’épreuve de la technique. Sur ce point, le jeu de Tecmo excelle brillamment et rend hommage à la Saturn comme peu d’autres titres l’ont fait auparavant.\r\n\r\n*Virtua Fighter 2* est déjà un modèle technique impressionnant, visuellement superbe et fluide, mais *Dead or Alive* pousse encore plus loin l\'exploit. Premièrement, il profite d’un affichage haute résolution et retranscrit des modèles 3D détaillés avec une fluidité déconcertante. Oui, c’est beau, mais surtout, c’est incroyablement fluide \\!\r\n\r\n{{< screenshots >}}\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"03\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"12\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n{{< /screenshots >}}\r\n\r\nLes développeurs ont soigné chaque combattant avec une attention particulière sur les personnages féminins, et c’est un véritable plaisir de les voir s’animer à l’écran. Les mouvements des cheveux suivent chaque déplacement, réagissant même au vent, tandis que les généreuses poitrines, dans un style propre au jeu, bougent avec dynamisme, enrichissant visuellement chaque combat.\r\n\r\nCe qui est encore plus impressionnant, c’est que la console ne montre aucun signe de faiblesse. L’image ne ralentit jamais, même lors des affrontements les plus intenses. Pas de latence, même lorsqu’il s’agit d’enchaîner les coups à tout va. Aussi surprenant que cela puisse paraître, on se retrouve face à un jeu de combat 3D qui offre toute la réactivité et le dynamisme d’un jeu en 2D. C\'est tout bonnement prodigieux \\!\r\n\r\nLes décors des arènes ne sont pas en reste, offrant des paysages hauts en couleur agrémentés parfois d’éléments animés en 3D. Les textures du sol, de qualité remarquable, ajoutent une dimension supplémentaire à l’expérience visuelle, enrichissant ainsi une qualité graphique déjà exceptionnelle.\r\n\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"14\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n\r\n## Une bande son ahurissante \\!\r\n\r\nLa bande son de *Dead or Alive* joue un rôle crucial dans la création de cette ambiance si envoûtante. La voix off accentue le dynamisme des combats, tandis que les divers effets sonores, variés et de qualité, immergent le joueur dans l’action la plus totale.\r\n\r\nLes compositions, d’une qualité CD et réenregistrées à partir des musiques de la version arcade, s’accordent parfaitement à l’univers de chaque arène. Chaque morceau, qu\'il s\'agisse de rythmes énergiques ou de mélodies plus suaves, complète à merveille l’intensité des combats. Mieux encore, ces morceaux peuvent s’écouter en boucle sans jamais se lasser, rendant les sessions de jeu encore plus immersives.\r\n\r\nBien que j’apprécie toutes les musiques de l’OST, j’ai une préférence pour le thème de Kasumi, *Time of Determination*, et celui de Ryu, *Blade of Ryu*, qui captent bien l’esprit shinobi avec une magnifique touche de rock. C’est épique \\! J’aime aussi la piste dédiée au mode training, *Physical System*, que je trouve vraiment cool, me rappelant ces bons morceaux que l’on retrouvait dans les films d’arts martiaux des années 90\\.\r\n\r\n## Meilleur sur PlayStation ?\r\n\r\nDead or Alive est apparu également sur PlayStation avec un an d\'intervalle et il s\'avère être la première adaptation d\'un jeu issu d\'une borne SEGA sur la console de Sony. Au vu des spécifications de la PlayStation et du délai de développement supplémentaire, on pourrait s\'attendre à que cette version surpasse celle de la Saturn. Hors, il n\'en est rien, bien au contraire.\r\n\r\nLe point fort du portage chez Sony est indéniablement son contenu plus riche avec deux nouveaux combattants qui s\'ajoutent au casting et une présentation retravaillée bénéficiant d’une meilleure transition entre les combats. Cependant, la version Saturn se place largement au dessus en terme de visuel grâce à ses modèles 3D plus réussis, sa haute résolution et ses décors profitant d’un réel effet de profondeur.\r\n\r\n\r\n{{< image-compare description=\"Comparaison entre la version SEGA Saturn et PlayStation de Dead or Alive\" >}}\r\n    {{< image src=\"/media/games/sega-saturn/dead-or-alive/screenshots/screenshot-01.webp\" title=\"SEGA Saturn\" caption=\"SEGA Saturn\" alt=\"Sega Saturn Screenshot\" >}}\r\n    {{< image src=\"/media/games/psx/dead-or-alive/screenshots/screenshot-01.webp\" title=\"PlayStation\" caption=\"PlayStation\" alt=\"PlayStation Screenshot\" >}}\r\n{{< /image-compare >}}\r\n\r\n\r\nIl en résulte une version au top qui se veut très proche de la version arcade tandis que sur PlayStation, le jeu se veut totalement différent et prend même la liberté de proposer une nouvelle OST dont les morceaux ne collent pas toujours avec l\'univers de Dead or Alive.\r\n\r\nIl faut ajouter que la manette de la PlayStation ne permet pas autant de confort et de convivialité que celle de la Saturn. Bref, à mon humble avis, si vous souhaitez jouer à Dead or Alive de manière authentique, c\'est-à-dire fidèle à la borne d’arcade, c\'est sur Saturn que ça se passe \\!\r\n\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"21\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n\r\n\r\n## Virtua Fighter a trouvé son maître ?\r\n\r\nDead or Alive est un monolithe du jeu vidéo tant par son game play novateur et son contenu provocateur que par sa technique exceptionnelle et son ambiance incroyable. Il ne fait aucun doute que ce jeu de combat inespéré réussit à surpasser brillamment Virtua Fighter 2 et témoigne de la volonté de Tecmo quant à survivre dans une industrie sans pitié, en pleine mutation avec la démocratisation des univers 3D. Le titre Dead or Alive prend alors ici tout son sens.\r\n\r\nCependant, même si cela me coûte de l\'admettre, *Virtua Fighter 2* a bel et bien trouvé son maître. Cela ne diminue en rien l\'incroyable travail accompli par SEGA ; au contraire, sans son influence, un tel résultat aurait été impossible.\r\n\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"11\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n\r\nEn matière de  technique, *Dead or Alive* décroche un direct du droit phénoménal, brisant instantanément la mâchoire de ses concurrents devenus has-been (bye bye *Tekken* et consorts). Il m’est encore difficile de réaliser à quel point cette prouesse technique est tangible tant elle me paraît irréaliste. Sommes-nous vraiment sur Saturn ? Cette console qui, selon certains, ne vaut rien en termes de rendu 3D ? J\'ai de sérieux doutes…\r\n\r\nEt que dire de ses héroïnes ? Les combattantes de *Dead or Alive*, avec leurs costumes osés et leur allure envoûtante, ajoutent un attrait supplémentaire à l’expérience. Cette fusion entre la beauté du corps et la force féminine signe à jamais la marque de fabrique de la franchise. *Dead or Alive* ne se contente pas de rivaliser avec *Virtua Fighter* ; il redéfinit ce que signifie être une belle et puissante guerrière dans le monde des jeux vidéo.\r\n\r\nIl est regrettable que Tecmo n’ait pas réussi à amener jusqu\'à chez nous ce chef-d\'œuvre sur Saturn. Alors que la console de SEGA était en difficulté face à la montée en puissance de la PlayStation, *Dead or Alive* aurait sans doute su séduire un public très friand de ce type de jeu novateur et à l’esprit purement arcade comme on aime si intensément. Avec un tel titre commercialisé dans nos contrées, la Saturn aurait pu non seulement augmenter sa popularité et peut-être même relancer ses ventes. Après tout, qui sait quel tournant l’histoire aurait pris si ce jeu exceptionnel avait vu le jour en version occidentale sur notre console bien-aimée ?\r\n\r\nQuoi qu\'il en soit, Dead or Alive enrichit considérablement le catalogue de la Saturn et reste encore un jeu accessible financièrement, et ce même en édition limitée. À moins d\'exclure totalement l\'import de votre ludothèque, Dead or Alive se révèle un choix de premiers ordre aux côtés des autres cultes de la console. Il ne fait aucun doute que chaque fan de la Saturn peut être allègrement fier qu\'un tel jeu existe sur cette machine de rêve.\r\n\r\n{{< screenshots >}}\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"16\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n{{< screenshot \r\n    game=\"dead or alive\"\r\n    console=\"sega saturn\"\r\n    index=\"08\"\r\n    alt=\"Dead or Alive sur SEGA Saturn\" \r\n>}}\r\n{{< /screenshots >}}\r\n\r\n\r\nCe jeu de combat est un parfait complément à Virtua Fighter. Il conviendra aussi très bien aux joueurs trouvant le titre de SEGA trop austère et difficile d\'accès, grâce à ses mécaniques intuitives qui permettent de plonger dans l\'action sans accrocs. Le niveau de difficulté élevé saura séduire sans aucun doute les amateurs de baston en quête de challenge ultime. C\'est rapide, beau, et ça frappe fort. En somme, un véritable must-have à ajouter sans hésitation à toute collection Saturn digne de ce nom.\r\n\r\nDead or Alive et moi, c’est une grande histoire d’amour de longue date. Comme beaucoup, j’ai découvert la franchise par le biais du second épisode sur Dreamcast, et quelle surprise de revenir à ce premier opus sur Saturn ! Je dois avouer que je n’en attendais pas grand-chose, pensant que rien ne pouvait surpasser le suprême *Dead or Alive 2*. Pourtant, ce premier volet regorge de qualités, notamment grâce à son lien étroit avec *Virtua Fighter 2*, et il me semble évident qu\'il s\'agit à mes yeux du meilleur épisode de la franchise. \r\n\r\nJe n\'exagère pas : le jeu reste incroyablement efficace et me procure un plaisir immense au point d’en devenir obsessionnel. J\'apprécie particulièrement les efforts déployés par la Team Ninja pour rendre cette version impeccable sur le plan technique. On ressent clairement les améliorations apportées au moteur de *Virtua Fighter 2* pour tirer pleinement parti du hardware de la Saturn. C’est du grand spectacle ! Ajoutez à cela un gameplay novateur, surtout avec l\'introduction d’un système de contre, des personnages charismatiques et un contenu plus adulte, *Dead or Alive* s\'impose inéluctablement comme le meilleur jeu de combat en 3D sur consoles 32 bits.', 1, 2, '2025-04-21 00:00:00', 'draft', 'public', 24, NULL, NULL, NULL, '2025-04-27 19:17:29', '2025-04-27 19:17:29'),
(3, 91, 'The Revenge of Shinobi', 'the-revenge-of-shinobi', '', 1, 2, '2025-04-21 12:04:00', 'draft', 'public', 0, NULL, NULL, NULL, '2025-04-26 21:17:58', '2025-04-26 21:17:58'),
(5, 96, 'Sonic The Hedgehog', 'sonic-the-hedgehog', 'Suepr jeu :)', 1, 2, '2018-05-01 11:05:00', 'published', 'public', 0, 'Le test complet de Sonic The Hedgehog', 'Le meilleur jeu de la Mega Drive !', 'sega, retrogaming, sonic', '2025-04-20 10:41:54', '2025-04-20 10:41:54');
INSERT INTO `articles` (`id`, `image_id`, `title`, `slug`, `content`, `user_id`, `type_id`, `published_date`, `status`, `visibility`, `reading_time`, `seo_title`, `seo_description`, `seo_keywords`, `modified`, `created`) VALUES
(6, 137, 'Histoire du Mega CD : Welcome to the next level', 'histoire-du-mega-cd-welcome-to-the-next-level', '**La Mega Drive est une console formidable ayant donnée naissance à des jeux très aboutis techniquement, ce qui n’a pas empêché SEGA de passer à la vitesse supérieure en offrant à sa console un périphérique révolutionnaire : Le Mega CD. Loin d’être un simple lecteur comme fut le Super CDROM de la PC-Engine, cette extension permet de booster considérablement la puissance de la console afin de recevoir des jeux encore plus impressionnants. Hélas, le Mega CD n’a pas su convaincre les propriétaires de Mega Drive et reste toujours aussi boudé par une grande majorité des joueurs actuels à cause de sa mauvaise réputation, mais retournons un instant en 1991 afin de retracer son histoire et de déterminer si l’extension mérite encore de rester dans l’ombre de la dame noire.**\r\n\r\nAprès un lancement mitigé au Japon, SEGA se devait de trouver un moyen efficace de relancer durablement les ventes de la Mega Drive qui était malheureusement encore loin derrière la concurrence. Pour tenter de conquérir les joueurs japonais, la firme avait jugé bon de mettre au point un lecteur CDROM conçu spécialement pour épauler sa console 16-bit au détriment du lecteur de disquette qui à l’origine était prévu pour transformer la Mega Drive en petit ordinateur personnel à l’image du SG3000. Le périphérique fut élaboré dans un premier temps pour écarter NEC et son Turbo Duo / PC-Engine, mais aussi pour empêcher la Super Famicom de prendre l’avantage sur la Mega Drive. Plus encore, le passage sur cette nouvelle technologie donnerait à SEGA la possibilité de diminuer significativement les coûts de production des jeux par rapport aux cartouches traditionnelles et de profiter d’un plus grand espace de stockage à ne plus quoi savoir en faire.\r\n\r\n## Une Mega puissance au service jeu vidéo\r\nBaptisé en toute logique Mega CD, le projet fut supervisé par Tomio Takami, le directeur exécutif de SEGA, à qui l’on doit des titres mythiques tels que The Super Shinobi II, Sonic The Hedgehog 3 ou encore Sonic & Knuckles. Au départ, le Mega CD se devait d’être un simple lecteur CD couplé à une grande quantité de mémoire, mais pour être sûr et certain que la Mega Drive couplée à ce périphérique surpasserait allégrement les spécificités de la Super Famicom, il a été décidé d’ajouter en renfort tout un panel de processeurs très puissants.\r\n\r\nC’est alors que les ingénieurs développèrent le SEGA 315-5548, un processeur graphique sur mesure (ASIC) capable de gérer en hardware divers effets tels que le zoom et la rotation. De ce fait, les concepteurs de jeux étaient en mesure de reproduire à leur guise le « mode 7 » de la Super Famicom sans que cela ait un impact négatif sur les performances in-game, mais à la différence de la console de Nintendo, le Mega CD peut appliquer ces effets à la fois sur les sprites et les arrières-plans.\r\n\r\n\r\n\r\nSEGA a été contraint d’ajouter en supplément un Motorola 68000 cadencé à une fréquence de 12,5 MHz afin de profiter pleinement des caractéristiques de cette nouvelle puce graphique puisque le processeur central de la Mega Drive ne se montrait pas assez véloce pour suivre la cadence qui lui était imposée. Il faut aussi souligner que le Mega CD souffrait d’un défaut majeur dès sa conception puisque tributaire du VDP de la Mega Drive. Aussi puissant soit-il, le SEGA 315-5548 ne peut afficher à l’écran plus de 64 couleurs simultanément, ce qui n’est pas sans conséquence pour les jeux dits en Full Motion Video (FMV) dont le rendu à l’écran était même à l’époque loin d’être convaincant en termes de qualité d’image.\r\n\r\nPour obtenir un meilleur rendu, il aura fallu attendre les nouveaux codecs vidéo CinePack et TruVideo de chez SEGA qui, grâce à la méthode Hilite/Shadow, ont permis d’étendre artificiellement le nombre de couleurs affichables entre 128 et 256 couleurs. Cette amélioration a été aussi rendue possible dans les jeux plus traditionnels en ayant recours à quelques astuces de programmations donnant l’illusion qu’un grand nombre de couleurs était affiché à l’écran. Cette technique fut utilisée dans quelques jeux comme Snatcher de Konami qui profite de 192 couleurs ou bien Eternal Champions CD de SEGA qui se targue d’en afficher 256.\r\n\r\n\r\n**Mighty Morphin Power Ranger est un jeu en FMV utilisant le codec TruVideo**\r\n\r\nLa gestion audio est déléguée au Ricoh RF5C164, la même puce sonore qui fut utilisée dans la borne du jeu automobile RAD Mobile. Les caractéristiques font état d’un total de 8 canaux pouvant être étendu au nombre de 10 à condition de solliciter le YM2612 de la Mega Drive. La puce prend naturellement en charge la lecture de CD audio et peut faire du sampling jusqu’à 32 Hz avec une limitation mémoire de 64 KB. Avec de telles spécificités, la présence du Ricoh RF5C164 fut une véritable révolution pour la Mega Drive qui pouvait enfin profiter d’un son stéréo d’une qualité sonore exceptionnelle, du moins nettement supérieure à ce que pouvait proposer la Super Famicom.\r\n\r\nLa lecture des données se fait par le biais d’un lecteur frontal simple vitesse conçu par JVC dont le temps d’accès maximum est estimé à 1,4 seconde. Il s’accompagne d’une mémoire principale de 6Mbit dédiée exclusivement au stockage de données, ce qui est tout juste énorme en comparaison des maigres 8Kbit disponibles dans le Turbo Duo. Cette grande quantité de mémoire présente un avantage non négligeable pour les développeurs qui, à présent, pouvaient entreprendre de réaliser des jeux très gourmands en ressources, car non limités par les cartouches standards de 4Mbit.\r\n\r\n\r\nÀ côté, on retrouve une mémoire cache de 128Kbit présente pour stocker diverses informations nécessitant un accès très rapide comme un tableau contenant le résultat de calculs complexes. Plus encore, le Mega CD bénéficie de 64Kbit supplémentaires réservés exclusivement aux sauvegardes de jeux pouvant être étendus via une cartouche RAM d’une capacité de 1Mbit soit 2045 blocs. Sur le papier, le Mega CD est une machine redoutable, mais ses spécifications techniques hors norme pour l’époque ont augmentées considérablement le coût de production sans que cela soit véritablement un problème selon SEGA.\r\n\r\n## Le Mega lancement\r\nLe Mega CD fait sa première apparition au Japon lors du Tokyo Toy Show de 1991 où on pouvait également y découvrir quelques nouveautés prévues sur Mega Drive dont OutRun, Galaxy Force II, Rent a Hero et Undeadline. Le 12 décembre 1991, SEGA s’empresse de commercialiser officiellement son périphérique sur le territoire nippon au prix de 49 800 yens avec un line-up comprenant Earnest Evans, Heavy Nova, Funky Horror Band et Sol-Feace, mais malgré son prix très élevé et l’absence de killer app digne de ce nom, les ventes du Mega CD sont très encourageantes puisque les chiffres révèlent un total de 100 000 unités écoulées dès la première année, dont 15 000 dès le jour de sa sortie. Ces excellents résultats s’expliquent en grande partie par le fait que les joueurs japonais furent très attirés par le format CD et les nombreux RPG qui leur étaient proposés.\r\n\r\nPar manque de temps et d’expérience pour exploiter tout le potentiel offert par cette nouvelle technologie, SEGA avait estimé qu’il fallait développer en priorité des RPG bon marché et ce fut un choix pertinent, car il s’agissait d’un genre en pleine prospérité au Japon dont les jeux bénéficiaient généralement d’une durée de vie conséquente sans demander de longues périodes de développement. C’est alors que bon nombre de RPG sont sortis au fil des mois comme Wakusei Woodstock: Funky Horror Band (SEGA), Death Bringer (Telnet Japan), Seirei Shinseiki Fhey Area (WolfTeam), Cosmic Fantasy Stories (Riot Games), Aisle Lord (WolfTeam), Mahou no Shoujo: Silky Lip (Riot Games), mais c’est surtout l’excellent Lunar: The Silver Star de Game Arts qui fera le grand bonheur des utilisateurs du Mega CD.\r\n\r\n\r\nPar chance, Nintendo ne considérait pas le Mega CD comme une machine concurrente, ce qui permit à de nombreux développeurs et éditeurs de travailler librement dessus, bien que la majorité d’entre eux ont préféré s’abstenir et de se tourner vers le Turbo Duo. SEGA pouvait tout de même compter sur le soutient d’une poignée de partenaires dévoués à savoir Wolf Team, Working Designs, Nihon Telnet, Konami, Game Arts sans oublier JVC qui s’est énormément investi dans la carrière du Mega CD en publiant un grand nombre d’exclusivités.\r\n\r\n## Welcome to the Next Level\r\nSix mois après le lancement du Mega CD au Japon, SEGA s’apprête à s’attaquer au marché américain c’est en mai 1992 que l’extension de la Mega Drive est présentée sous le nom de SEGA CD lors du Consumer Eletronics Show (CES) à Chicago. À ce moment précis, SEGA of America considérait à tort qu’il s’agissait d’un nouveau système venu prendre la relève de la Genesis dans le but de tuer la Super Nintendo, mais SEGA Japan insista fermement pour que l’appareil soit présenté comme un étant un périphérique complémentaire à ne surtout pas opposer directement à la concurrence. Cette totale incompréhension s’explique certainement du fait que la branche américaine fut tardivement impliquée dans le projet en plus de n’avoir reçu aucun prototype durant sa phase conception.\r\n\r\nPour assurer le succès du SEGA CD, le président de SEGA of America, Tom Kalinkse, est conscient qu’il était primordial de proposer des titres de qualités apportant une nouvelle expérience aux joueurs en misant pleinement sur la FMV au détriment des jeux d’arcade. Kalinkse décide alors d’ignorer la quasi-totalité du catalogue japonais et prend l’initiative d’agrandir en conséquence la société afin de se focaliser principalement sur la production de nouveaux jeux. L’image positive du SEGA CD se voit renforcée grâce au soutien de Sony au travers de sa filiale ImageSoft qui publiera bon nombre de jeux pour le périphérique et les autres consoles de SEGA.\r\n\r\n\r\n\r\nLe 15 octobre 1992, le SEGA CD fait officiellement son entrée en Amérique du Nord sous le slogan « Welcome to the next level ». Les joueurs américains ont alors le choix entre deux packs vendus à partir de 299 dollars dont le premier comprend la compilation SEGA Classics Arcade 4in1 (incluant les jeux Columns, Golden Axe, Streets of Rage et The Revenge of Shinobi), Sherlock Holmes : Consulting Detective Vol. 1 puis deux CD Audio présents afin de démontrer les capacités sonores du périphérique tandis que le second pack vient uniquement avec le jeu Sol-Feace.\r\n\r\nLe même jour, les propriétaires de SEGA CD ont en plus la possibilité de se procurer le très controversé Night Trap, un FMV réalisé par Digital Pictures, où le joueur incarne un agent du SCAT (SEGA Control Attack Team) dont la mission consiste à protéger un groupe de charmantes demoiselles d’une horde de vampires en actionnant moult pièges présents dans la maison.\r\n\r\nDans la foulée, Sony ImageSoft délivra Sewer Shark, un autre FMW reprenant le concept du rail shooter qui était initialement prévu pour la console NEMO avant quelle ne soit abandonnée par Hasbro. Quelques semaines plus tard, Sony ImageSoft publie les jeux de plateformes Chuck Rock et Hook, l’adaptation du film de Spierlberg, tous deux développés par le studio britannique Core Design plus connu pour avoir donné naissance à Tomb Raider en 1996 sur PC, PlayStation et Saturn.\r\n\r\nMalgré le peu de titres disponibles, le SEGA CD obtient de bons chiffres de vente puisqu’à la fin de l’année, on décompte pas moins de 200 000 unités écoulées, soit deux fois plus que le Japon sur un temps relativement plus court.\r\n\r\n## Mega Puissance II\r\nPour faire baisser les coûts de production et corriger les défauts de fiabilité du Mega CD, SEGA prépare une seconde version baptisée « Mega CD II » qui profite d’un nouveau design afin d’accompagner la sortie de la Mega Drive II, mais tout en restant compatible avec la première Mega Drive. Par ailleurs, SEGA fournira une petite cale en supplément qui permet d’adapter parfaitement la largeur des anciennes consoles avec le Mega CD II.\r\n\r\n\r\nLe combo Genesis / SEGA CD 2 destiné au marché nord américaine\r\n\r\nAprès un bon démarrage au Japon puis en Amérique du Nord, SEGA souhaite commercialiser le Mega CD sur le continent européen, mais les différentes branches préfèrent attendre la sortie du nouveau modèle avant de lancer officiellement le produit sur le marché. Néanmoins, le Royaume-Uni bénéficie d’un traitement de faveur grâce à la forte popularité de la Mega Drive au point que le pays était, à l’époque, surnommé le « Sega Stronghold ». C’est alors nos voisins britanniques ont eu le privilège d’acquérir le Mega CD dès le 19 avril moyennant la somme de 270 livres sterling (412 dollars) dans un pack comprenant un lot de trois CD-ROM dont SEGA Classics 5in1, Cobra Command, Sol-Feace et Super Monaco GP.\r\n\r\nÀ noter que durant la même période, le Mega CD était aussi disponible en Italie, mais il était fourni uniquement avec les jeux Cobra Command et Sol-Feace. Quelques exemplaires ont été importés en France par Micromania qui grâce à cette exclusivité pouvait se permettre de pratiquer des prix relativement élevés à quelques mois de la sortie officielle du Mega CD II.\r\n\r\n\r\n \r\nLe 1er septembre 1993, débarque en France le Mega CD II avec Road Avenger pour la coquette somme de 1990 francs, mais son prix élevé et le manque de communication ne permet pas d’obtenir de bons chiffres de vente. Même après la sortie de Sonic CD et Final Fight CD, les ventes du Mega CD II ne décollent pas et se sera le même constat dans tout le reste de l’Europe jusqu’à la fin de l’année dont les résultats révèlent qu’il y a eu un total de 60 000 à 70 000 d’exemplaires vendus.\r\n\r\n## Déclin\r\nDurant la période allant de 1993 à 1994, beaucoup de nouveaux titres ont été publiés à destination du Mega CD, mais la plupart d’entre eux étaient en réalité de simples conversions de jeux déjà existants sur Mega Drive qui ne tiraient pas pleinement profit des capacités techniques du périphérique puisque les développeurs se contentaient généralement de bourrer le CD avec des cinématiques animées et des pistes audio. Les FMV qui étaient mis en avant souffraient trop souvent d’une réalisation déplorable en sus de ne pas offrir une action soutenue à l’écran. Finalement, pour un joueur occidental, très peu de jeux justifiaient vraiment l’achat du Mega CD.\r\n\r\nIl faut aussi souligner le fait que de très bons jeux ne sont jamais sortis chez nous en Europe comme Dark Wizard, Lunar : The Silver Star, Revenge of the Ninja, Rise of the Dragon, The Secret of Monkey Island, Sengoku Denshou, Lunar : Ethernal Blue, Popful Mail ou encore Shadowrun. Avec autant d’excellents jeux passés à la trappe, il est difficile de comprendre la position de SEGA qui ne s’est pas donné les moyens nécessaires pour conquérir le marché européen.\r\n\r\nSEGA avait pourtant tenté de relancer la machine en proposant des jeux utilisant à la fois les spécificités du Mega CD et du 32X, mais on dénombre seulement six titres compatibles qui, malgré un rendu visuel amélioré, avaient un intérêt très limité puisqu’il s’agissait exclusivement de jeux en FMV étant déjà sortis depuis un moment.\r\n\r\nAu Japon comme en Amérique du Nord, les ventes du Mega CD finissent par s’effondrer suite à l’annonce des consoles de nouvelles générations. Peu à peu, le Mega CD est abandonné par SEGA qui est bien plus préoccupé au lancement de son prochain système de jeux, la Saturn. Beaucoup de propriétaires du Mega CD furent mécontents par le manque d’investissement de la part de SEGA et on vécut ce moment comme une terrible trahison, ce qui sera sans nul doute préjudiciable pour la future carrière de la Saturn.\r\n\r\n\r\nAnnonce de Street Fighter II sur Mega CD mentionnée dans le magazine Mean Machines #14\r\n\r\nAvec un total de 850 000 exemplaires vendus à travers le monde, le Mega CD est un échec, surtout en Europe où seulement 4% des propriétaires de la Mega Drive ont acquis l’extension. Un triste constat qui aurait certainement pu être évité avec notamment un meilleur soutien de la part des éditeurs tiers influant de l’époque et la production de jeux exploitant convenablement les spécificités du Mega CD. C’est d’autant plus dommage, car plusieurs jeux à succès ont été annulés dont Street Fighter II, Power Drift, Super Gaiares,The Super Shinobi II, Thunder Force IV, Castelvania IV, Contra Spirits, Life Force, Orius, Super Contra, Gradius...\r\n\r\n## Il était une fois le Wondermega\r\nAu cours de sa carrière, le Mega CD s’est vu décliner en plusieurs modèles dont plus le connu est indéniablement le Wondermega créé par JVC au travers de sa filiale Victor Enternainement. Ce modèle est apparu pour la première fois au Japon en avril 1992 où il était vendu au prix fort de 82 000 yens soit la somme vertigineuse de 3 427 francs. Cette version haut de gamme du Mega CD a la particularité d’intégrer une Mega Drive avec quelques fonctionnalités supplémentaires dont un processeur sonore à signal numérique (DSP), une sortie SVHS et MIDI. On y retrouve également deux prises microphone avec un commutateur d’effet écho et un lecteur légèrement plus rapide de l’ordre de 15 % en moyenne.\r\n\r\n\r\n \r\nEmballé par le Wondermega, SEGA commercialisera dans la foulée sa propre version en y apposant fièrement son logo en haute à droite, là où se trouvait celui de Victor. En 1993, un nouveau modèle fera son apparition avec d’importants changements au niveau du design et l’ajout d’un port infrarouge permettant d’utiliser les nouvelles manettes sans fils qui disposaient désormais de six boutons.\r\n\r\nEn 1994, JVC lancera sa machine en Amérique du Nord sous le nom d’X’Eye, mais dans le but de diminuer son prix de vente, la machine est dépourvue de son port infrarouge et de sa sortie SVHS. Bien que toutes les versions du Wondermega soient parfaitement compatibles avec le 32X, son utilisation empêche d’ouvrir la porte du lecteur CD, ce qui sera problématique pour les jeux Mega CD nécessitant de changer de disque en cours de partie. De nos jours, le Wondermega reste encore un véritable objet de prestige très convoité par les collectionneurs fortunés prêt à débourser de grosse somme d’argent pour acquérir l’un des rares exemplaires disponibles sur les différents sites aux enchères.\r\n\r\nDurant la même période, SEGA a commercialé le Multi-Mega ou SEGA CDX en Amérique du Nord qui, comme le Wondermega de JVC, intègre une Mega Drive, mais se veut très différent dans son approche puisqu’il s’agit d’un baladeur CD que l’on peut transporter un peu partout grâce à son compartiment à piles. Sur la face avant, on y retrouve plusieurs boutons de contrôle avec un petit écran LCD situé au milieu indiquant le numéro de piste en cours d’utilisation et une sortie audio qui permet de relier la console à une sono HiFi.\r\n\r\n\r\nLe Multi-Mega était fourni avec une manette 6 boutons, un adaptateur secteur et un câble vidéo composite. En Amérique du Nord, un pack vendu à 399 dollars contenait plusieurs jeux, dont le SEGA Classics Arcade, Sonic CD et Ecco le Dauphin, tandis qu’au Brésil, la console était vendue avec le jeu Night Trap. Aussi étrange soit-il, le Multi-Mega a été commercialisé au Japon à des fins purement éducatives sous le nom de SEGA Linguaphone « Education Gear ». Le coût de fabrication était relativement faible, ce qui permettait de proposer un prix très attractif aux joueurs souhaitant passer à la technologie CD tout en profitant de la ludothèque Mega Drive, cependant SEGA stoppera très tôt la production du Multi-Mega afin que le produit ne rentre pas en conflit avec le 32X dont la sortie était prévue à la fin de l’année 1994. Ainsi, le Multi-Mega est un objet très rare dont le prix reste relativement élevé sur le marché de l’occasion.\r\n\r\nÀ ce jour, la dernière déclinaison connue du Mega CD est le surprenant CSD-G1M créé par le fabricant d\'électronique japonais Aiwa. Vendu en 1994 à partir de 45 000 yens soit 2375 francs, l\'appareil se présente sous la forme d\'un poste radio cd à l\'apparence des plus classique, mais en y regardant de plus près, on constate que deux ports manette et un port cartouche sont présents sur la face avant de la station d\'accueil à relier au système via un connecteur situé à l\'arrière du châssis. Hélas, le CSD-G1M est un appareil coûteux d\'une extrême rareté étant donné qu\'il a été commercialisé exclusivement au Japon et en très faible quantité. Il y a donc peu de chances pour que vous puissiez un jour avoir l\'occasion de jouer sur cette machine si unique à moins d’être un collectionneur chevronné.\r\n\r\n## Les incontournables du Mega CD\r\nDe nos jours, le Mega CD reste un support peu convoité par les joueurs en raison de son prix excessif et de son catalogue de jeux trop souvent méconnu, mais en se donnant les moyens, il est tout à fait possible de mettre la main sur d’excellentes pépites à découvrir. Pour vous en donner un petit aperçu, j’ai pris soin de sélectionner quelques jeux que je juge indispensables sur Mega CD.\r\n\r\n### Sonic CD\r\n\r\nParmi les jeux indispensables figure sans conteste Sonic CD qui est le best-seller du Mega CD avec ses 1,5 million d’exemplaires vendus. Une belle performance pour un jeu qui au départ était un simple portage de Sonic 2 avant d’être transformé en un nouvel épisode exclusif plus enclin à démontrer les capacités techniques du Mega CD. Sonic CD rassemble un nombre incroyable de niveaux qu’il est possible de traverser à différentes époques et insère des bonus stages qui utilisent ingénieusement les effets de rotation et de zoom. Même si depuis cet épisode a été réédité à maintes reprises sur divers supports, il restera à jamais un must have sur Mega CD d’autant plus que c’est l’un des rares jeux à tirer un tant soit peu profit des capacités de la machine.\r\n\r\n### Final Fight CD\r\n\r\nFinal Fight CD est aussi une belle réussite puisque cette adaptation entièrement réalisée par SEGA se veut très proche de la version arcade bien que ce dernier souffre d’une limitation technique lui empêchant d’afficher à l’écran plus de quatre adversaires en même temps. Néanmoins, on retrouve toutes les bonnes sensations de la borne avec quelques nouveautés en bonus telles que des cinématiques animées, une bande-son entièrement réenregistrée et la venue d’un mode time attack. Cela reste plutôt léger en termes de contenu, mais Final Fight CD reste sans conteste la meilleure version console disponible sans devoir passer par de l’émulation.\r\n\r\n### Fatal Fury Special\r\n\r\nLe Mega CD s’est aussi du vs. figthing pur et dur à l’ancienne avec Fatal Fury Special dont le portage a été confié, cette fois, au studio norvégien Funcom et édité par JVC. Contrairement à ce que nous avions l’habitude de voir sur Mega Drive, cette conversion est tout juste impressionnante même si toutefois on y constate un nombre de couleurs amoindries, quelques frames en moins au niveau des animations et des décors amputés de plusieurs éléments. Mis à part ces quelques déconvenues, le jeu s’avère plus convaincant et plaisant à jouer que les honorables versions publiées sur PC-Engine et Super Nintendo. À défaut de ne pas posséder de NeoGeo à la maison, ce Fatal Fury Special CD devrait sans trop de mal satisfaire la majorité des amateurs de baston 2D.\r\n\r\n### Samurai Shodown\r\n\r\n\r\nAprès un premier portage de bonne facture avec Fatal Fury Special, Funcom s’est également chargé d’adapter Samurai Shodown sur Mega CD et le résultat se veut plutôt convaincant même si ici on est encore loin d’égaler la version NeoGeo. Sans surprises donc, on retrouve les mêmes concessions qui ont été faites dans Fatal Fury Special et il faut aussi souligner que le personnage Earthquake a été fâcheusement retiré du casting en raison de sa taille beaucoup trop grande pour être géré aussi puissant soit le combo Mega Drive / Mega CD. Cela dit, cette version CD reste le meilleur choix possible sur console 16-bit d’autant plus qu’elle est parfaitement compatible avec la manette 6 boutons.\r\n\r\n### Popful Mail : Magical Fantasy Adventure\r\n\r\nInitialement développé en 1991 par Nihon Falcom pour les ordinateurs PC-8801 et PC-9801 de NEC, Popful Mail : Magical Fantasy Adventure est un excellent jeu d’action-RPG où le joueur incarne le chasseur de prime, Popful Mail, parti à la recherche d’un mystérieux magicien. Bien que le titre soit disponible sur PC-Engine CD et Super Nintendo, c’est surtout la version Mega CD que l’on retiendra pour ses superbes cinématiques, ses dialogues en audio et diverses améliorations. Néanmoins, il faudra se contenter de la version américaine ou japonaise, car le titre n’est malheureusement jamais apparu dans nos contrées.\r\n\r\n### Robo Aleste\r\n\r\n\r\nImpossible pour tout amateur de shmup de passer a coté de Robo Aleste, le digne héritier du mythique Musha Aleste sur Mega Drive. Dans cet épisode exclusif au Mega CD, il est désormais question d’évoluer dans un univers futuriste moyenâgeux à l’ère Sengoku où le joueur contrôle un mecha d’une armée de ninja robotique en guerre contre des seigneurs féodaux. Compile signe ici un jeu incroyable qui exploite plutôt bien les capacités du Mega CD notamment en utilisant pleinement des effets de rotation et de zoom, mais aussi en affichant un nombre ahurissant de sprites à l’écran. Comme si cela ne suffisait pas, le titre s’accompagne de superbes cinématiques qui viennent agrémenter le scénario avec en prime des compositions musicales mémorables. Nul doute, Robo Aleste est un mega hit en puissance qui pourrait justifier à lui seul l’achat d’un Mega CD surtout si vous êtes un gros mordu de shmup.\r\n\r\n### Snatcher\r\n\r\n\r\nSnatcher est un jeu d’aventure graphique développé sur PC-8801 et MSX2 en 1988 par Hideo Kojima pour le compte de Konami. Au fil des années, le titre s’est vu porter sur diverses machines allant de la PC-Engine jusqu’à la Saturn, mais c’est la version Mega CD qui s’avère être la plus intéressante à jouer puisqu’elle est la seule à avoir été libérée en dehors du Japon. Dans cette grande aventure futuriste à l’ambiance cyber punk, il est question d’incarner un agent de police, Gilian Seed, dont le travail consiste à traquer et découvrir l’origine d’étranges cyborgs apparus mystérieusement pour prendre discrètement la place des humains dans leur vie quotidienne. La sortie en occident de Snatcher a occasionné quelques modifications dont une censure sur plusieurs scènes afin ne pas heurter la sensibilité des jeunes joueurs, mais il s’agit de la version la plus aboutie à ce jour. On regrettera seulement que le jeu n’ait pas bénéficié d’une traduction française et que la plupart des dialogues audio ne disposent malheureusement d’aucun sous-titre, ce qui rend la compréhension difficile pour les joueurs n’étant pas particulièrement à l’aise avec la langue de Shakespeare.\r\n\r\n## Le Mega CD de nos jours\r\n26 ans après sa première apparition dans l’histoire du jeu vidéo, le Mega CD fait encore parlé de lui, mais cet objet est surtout convoité par les collectionneurs fins désireux d’acquérir la première version qui s’accorde le mieux avec le design originel de la Mega Drive. C’est pourquoi on note une différence de prix importante avec le Mega CD II qui se négocie généralement autour d’une centaine d’euros pour du matériel fonctionnel et le double lorsque la boîte est fournie avec le manuel d’utilisation.\r\n\r\nPour un joueur, il est donc beaucoup plus intéressant financièrement de se procurer un Mega CD II surtout que ce dernier est relativement plus fiable, mais il faut bien veiller à ce que la petite cale soit fournie pour une parfaite adaptation avec la Mega Drive de première génération. Par ailleurs, il se peut que la pile permettant de garder en mémoire les sauvegardes ne soit plus fonctionnelle, mais son remplacement n’est pas chose aisée, car SEGA a songé bon de la souder à la carte mère. Si vous n’êtes pas habitué à manier le fer à souder, il existe une alternative plus simple qui consiste à se procurer une cartouche de sauvegardes (Backup Ram Cartridge) à insérer dans la fente réservée aux jeux Mega Drive.\r\n\r\nOutre le prix du Mega CD, les jeux sont eux aussi très chers que ce soit en version américaine, européenne ou japonaise. À titre d’exemple, pour des titres aussi commun que Sonic CD et Final Fight CD, il faut prévoir de débourser la soixantaine d’euros, mais d’autres jeux peuvent dépasser largement la centaine d’euros comme Robo Aleste, Snatcher, Keio Flying Squadron, Fatal Fury Special, Terminator ou bien encore Flynk. Si vous avez prochainement décidé d’acquérir un Mega CD, gardez bien à l’esprit que les prix pratiqués pour les jeux sont en moyenne plus élevés que ceux pour la Mega Drive.\r\n\r\nUne autre contrainte vient s’ajouter, car le Mega CD ne peut pas fonctionner avec une console d’une région différente. Cela signifie que si vous possédez une Mega Drive japonaise (NTSC J), il ne sera pas possible de l’utiliser avec un Mega CD européen (PAL) et vice versa. Néanmoins, il est possible de dézoner complètement un Mega CD grâce à l’installation d’un « free bios », ce qui permet de profiter de tout le catalogue de jeux sans la moindre restriction. Attention toutefois, car c\'est une opération très délicate réservée aux experts de la soudure, mais en utilisant le Mega EverDrive de krikzz, il est possible de profiter simplement d\'un dézonage temporaire. Le Mega CD a aussi la particularité de n’embarquer aucune protection contre la copie, ce qui rend tout à fait possible l’utilisation d’un jeu gravé sans aucune modification ou manipulation spécifique. Cette absence de protection s’explique certainement dû fait qu’il était à l’époque extrêmement coûteux et contraignant de graver un jeu soit même.\r\n\r\n## Conclusion\r\nMalgré son impopularité, le Mega CD fut une machine au potentiel énorme qui n’a malheureusement jamais réussi à conquérir le cœur des joueurs. Avec le recul, on ne peut que déplorer le manque d’investissement de la part de SEGA dans cette grande aventure qui aura tout de même eu le mérite de permettre à l’industrie d’expérimenter la technologie CD et de préparer le terrain pour les futures générations de consoles.\r\n\r\nAlors oui, la FMV aura indéniablement apporté une expérience nouvelle jusque-là réservée aux joueurs PC, mais il faut reconnaître que le Mega CD n’a jamais été une machine adaptée à ce type d’exercice et il est aussi bon d’admettre qu’aucun jeu proposé n’a su exploiter convenablement le concept. Si l’histoire était à refaire, il aurait été plus raisonnable de miser dans un premier temps sur le portage des gros hits de l’arcade en guise de démo technique puis d’alimenter le catalogue avec plusieurs titres exclusifs exploitant convenablement les capacités techniques du Mega CD de manière à inciter un maximum de joueurs à upgrader leur Mega Drive sans la moindre hésitation.\r\n\r\nIl est d’ailleurs étrange que SEGA n’ait jamais pris l’initiative de sortir plusieurs suites de ses licences phares telles que Streets of Rage, Golden Axe ou bien Shinobi qui auraient assurément fait vendre davantage de Mega CD. De plus, l’apparition du Multi-Mega est aussi étonnante, car ce baladeur rendait l’expérience abordable financièrement pour les personnes souhaitant passer à la technologie CD tout en profitant de la ludothèque Mega Drive. Il est vraiment dommage que SEGA n’est pas repoussé la date de sortie du 32X afin de se focaliser plus sérieusement sur le Mega CD avant de passer bien plus au tard sur une nouvelle console.\r\n\r\nAujourd’hui, il est tout à fait compréhensible que la majorité des joueurs continuent de bouder le Mega CD voire pour certains fans de la renier, mais en prenant la peine d’éplucher son catalogue avec la plus grande attention, on finit par découvrir avec stupéfaction des pépites insoupçonnées. Une sorte de trésor oublié que seuls les joueurs les plus curieux et les plus fidèles à la marque peuvent encore prétendre à découvrir.\r\n \r\n\r\nRéférences de l\'article :\r\n\r\n* https://sega.jp/fb/segahard/mcd\r\n* https://sites.google.com/site/consoleoldies/sega/megadrive/mega-cd\r\n* https://segaretro.org/Sega_Mega-CD\r\n* Service Games : The Rise and Fal of SEGA de Sam Pettus', 1, 4, '2025-04-21 00:00:00', 'draft', 'public', 29, NULL, NULL, NULL, '2025-05-01 15:05:39', '2025-05-01 15:05:39'),
(7, 138, 'Le SEGA TeraDrive', 'le-sega-teradrive', '**Après avoir principalement développé plus d’une dizaine de jeux bon marché sur GameBoy et NES, c’est à la fin de l’année 1993 que l’équipe de Beam Software s’est attaquée pour la première fois à la Mega Drive avec Blades of Vengeance. Il s’agit d’un jeu d’action nous plongeant dans un pur univers « heroic fantasy » aux côtés de trois aventuriers résolus à en découdre avec les forces du mal dans le but de rétablir l’ordre et la paix dans un Royaume décimé par la guerre.**\r\n\r\nSi le nom de Blades of Vengeance ne vous évoque pas grand-chose, c’est parce qu’il s’agit malheureusement d’un jeu encore trop méconnu sur la console de SEGA. Il faut reconnaître que de nos jours, les jeux estampillés « Electronic Arts » rencontrent peu de succès auprès des joueurs ainsi que des collectionneurs du dimanche.\r\n\r\nOutre le format de la cartouche bien spécifique aux jeux de chez Electronic Arts, la jaquette se veut bien trop classique dû à son style purement occidental rappelant ces vieux films en VHS souvent de piètre qualité. Non, la jaquette de Blades of Vengeance est loin de vendre du rêve et il est vraiment dommage qu’Electronic Arts n’a pas songé à proposer une version alternative soit pour le marché européen ou américain.\r\n\r\nNotez qu’il est assez étonnant pour l’époque que le personnage féminin se retrouve au centre de la jaquette laissant ainsi en retrait les deux autres protagonistes. C’est loin d’être un choix judicieux, car au début des années 90, il était bien plus vendeur de mettre en avant des personnages masculins représentant le parfait mâle alpha tout en muscle. Ce fût par exemple le cas avec la série des Golden Axe où la jolie amazone Tyris Flare fût systématiquement positionnée en arrière-plan.\r\nÀ la recherche de la maléfique « Mannax »\r\n\r\nEn outre, l’intrigue que nous propose Beam Software n’a rien d’original ni de palpitant. En effet, la maléfique Mannax, dame des ténèbres a conquis le Royaume et dans l’espoir de rétablir l’ordre dans le pays, un mystérieux sorcier envoie trois héros en mission afin de l’anéantir. On pourra difficilement faire plus simple niveau narration ! Pour peu que le manuel d’utilisation soit encore présent dans la boîte, vous ne pourrez pas en apprendre davantage sur l’intrigue ni même sur l’origine de l’un des trois aventuriers qui étrangement ne possèdent pas de nom. Il faudra alors se contenter de les désigner par leur compétence : la chasseuse, le barbare et le magicien. Logique !\r\n\r\nL’écran titre de Blades of Vengeance se veut rudimentaire et ne propose aucun menu d’options que l’on retrouve dans la plupart des jeux de cette génération. Avant de commencer une nouvelle partie, il n’est donc pas possible de sélectionner un niveau de difficulté ou même de changer la disposition des boutons. Il faudra alors se contenter d’un décor montagneux défilant en boucle avant d’accéder à l’écran de sélection des personnages après une pression sur la touche « Start ». Surprise ! La chasseuse est une fois de plus mise en avant puisqu’il s’agit du premier personnage sélectionnable qui en prime dispose des caractéristiques les plus intéressants.\r\n\r\n\r\nEn effet, cette dernière a une excellente portée d’attaque et son agilité lui permet d’accéder facilement à des plateformes éloignées. À contrario, le barbare possède une grande puissance, mais souffre d’une faible portée d’attaque avec une détente verticale relativement faible. Le magicien a l’avantage de lancer des attaques à distance, ce qui s’avère très pratique pour faire le ménage sans prendre de risques, mais ses coups manquent cruellement de puissance. Il ne fait aucun doute que Beam Software avait choisi la chasseuse comme héro principal pour son jeu, ce qui s’avère une bonne chose puisqu’il s’agit du personnage le plus agréable visuellement en comparaison aux sprites du barbare et du magicien.\r\n\r\nAux premiers abords, Blades of Vengeance se présente comme un jeu de plateforme dès plus traditionnel, mais ce dernier a la particularité d’insérer des notions de jeux de rôles notamment avec la possibilité de récupérer en chemin une multitude d’objets dissimulés dans des coffres ou sur le cadavre de nos victimes. Lorsque le joueur ramasse un objet, il est automatiquement stocké dans un inventaire en vue d’être utilisé plus tard dans l’aventure.\r\n\r\nCertains de ces objets seront d’une grande aide comme les potions d’énergie, les baguettes ou les anneaux magiques capables d’éliminer instantanément les ennemis. Il y a également les clés ouvrant des portes fermées, les potions de champs de force assurant une protection temporaire contre les attaques et autres pièges, mais aussi les potions de gaz annulant les effets des vapeurs toxiques.\r\n\r\nPour les utiliser, il faut dans un premier temps se rendre dans l’inventaire en appuyant sur « Start » puis sélectionner l’objet souhaité. Par la suite, il faut appuyer de nouveau sur « Start » pour reprendre la partie puis presser le bouton « A » afin d’utiliser l’objet en question. Cette opération devra être exécutée à nouveau si l’on souhaite changer d’objet, ce qui n’est guère très pratique et tend à casser le rythme de l’action. Par exemple, il devient vite frustrant de gaspiller une vie, car nous n’avons pas eu le temps de consommer rapidement une petite potion d’énergie dans un moment délicat contre un boss, voire un simple ennemi.\r\n\r\nIl est également possible de récolter de l’argent et de l’or afin d’acheter divers items en boutique disponible à la fin d’un niveau. En plus des objets cités que l’on peut récupérer dans un niveau, la boutique propose d’acheter des vies supplémentaires et une armure permettant de bénéficier d’une compétence spéciale en plus d’accroître la résistance aux attaques. Au vu de la difficulté élevée du soft où la moindre erreur ne pardonne pas, cette armure est indispensable pour espérer progresser sereinement d’autant plus qu’il est possible de la garder même après un fâcheux game over.\r\n\r\nPar ailleurs, le joueur ne dispose d’aucun crédit au début de la partie et après avoir perdu les trois vies offertes, il faudra recommencer tout depuis le début ! Heureusement, il est possible de récupérer un crédit à partir de 75 000 points, c’est-à-dire pas avant le troisième, voire le quatrième niveau. Cela aurait du sens si Blades of Vengeance était un jeu accessible avec un niveau de difficulté sélectionnable, mais hélas, c’est bien loin d’être le cas.\r\n\r\n\r\nIl y aussi cette fâcheuse sensation d’injustice face à un level design maladroit où il est difficile d’éviter des dégâts malgré la présence d’une position de défense contrant les attaques frontales. Pour ce faire, il suffit de presser la touche « bas » et le tour est joué ! Bien qu’il s’agisse d’une fonctionnalité indispensable pour progresser, il faut souligner que c’est un choix plutôt étrange, non naturel et peu esthétique pour ce type de jeu orienté sur l’action.\r\nUn périple long et difficile\r\n\r\nMalgré un bestiaire plutôt étoffé, il est difficile d’apprécier cette variété tant les ennemis possèdent des paternes peu évidentes à mémoriser en plus d’être obligé à trouver le bon timing pour attaquer très brièvement. C’est pour dire, dès le second niveau, il faut sans cesse se protéger et attendre le moment opportun pour frapper l’un de ses opposants. Il n’est pas rare de s’y reprendre à plusieurs reprises pour détruire un ennemi lambda et il faut s’armer d’une grande patience lorsqu’il s’agit d’ennemis plus coriaces comme les loups-garous par exemple. Il y a également d’autres types d’ennemis difficiles à toucher à cause de leur petite taille et d\'une boîte de collision peu évidente à trouver, ce qui complique grandement les choses.\r\n\r\n\r\nPour les braves et vaillants aventuriers d’entre vous qui auront réussi à se frayer un chemin jusqu’à la fin d’un niveau, il faudra affronter un boss comme dans tout bon jeu d’action qui se respecte. Ces derniers se veulent redoutables et il faut reconnaître qu’il n’est pas chose aisée de garder son sang froid quand on sait que la moindre vie nous est précieuse. Cela dit, les boss bénéficient de paternes relativement simples et en étant un tant soit peu attentif, on arrive à trouver assez rapidement la bonne approche pour remporter la victoire. Par ailleurs, il ne faut surtout pas hésiter à utiliser certains objets comme les anneaux ou les baguettes magiques afin de leur infliger des dégâts supplémentaires et de bien veiller à disposer de suffisamment de potions pour se restaurer de l’énergie dès que nécessaire.\r\n\r\nPour venir à bout de cette aventure composée d’un total de huit niveaux, il faudra compter chrono en main une bonne heure et demi en moyenne. Cela confère à Blades of Vengeance une bonne durée de vie qui aurait pu être meilleure si le mode deux joueurs inclu présentait un véritable intérêt, ce qui dans les faits est loin d’être le cas. Pour être franc, en coopération l’expérience devient rebutante au point de devenir une véritable torture pour l’esprit tant il est difficile de suivre son partenaire tout en évitant les ennemis et autres pièges qui pullulent dans chaque niveau. C’est à se demander si les gars de chez Beam Software ont pris le temps de tester ne serait-ce qu’au moins une fois leur jeu à deux !\r\n\r\nSur le plan technique, Blades of Vengeance se contente du minimum syndical avec un scrolling sur deux plans. Alors oui, on retrouve un joli effet de distorsion avant chaque niveau et sur l’arrière-plan du premier niveau, mais c’est bien trop peu pour nous impressionner devant l’écran surtout quand on connaît les possibilités offertes par la console. Heureusement, le jeu se défend plutôt bien graphiquement avec des décors soignés, des sprites de grandes tailles héritant de jolies animations et un choix de couleur plutôt convaincant. Il ne s’agit pas d’un des jeux les plus beaux de la Mega Drive, mais le rendu visuel est très agréable et il est fort appréciable de constater que Beam Software n’a pas hésité à inclure du contenu mature notamment avec la présence de giclées de sang tombant au sol et une tenue très légère pour la chasseuse.\r\n\r\nMalheureusement, les musiques de Blades of Vengeance sont loin de mettre en valeur la puce sonore de la Mega Drive puisqu’elles n’ont rien d’exceptionnelles et ne collent pas avec l’ambiance des niveaux. Il est difficile de croire que le compositeur avait réalisé ces musiques spécialement pour le jeu tant il y a un décalage entre l’univers et les mélodies. Ce n’est guère mieux avec les effets sonores qui dans l’ensemble sont beaucoup trop discrets et de mauvaise qualité. C’est vraiment navrant, car avec une bande sonore de qualité, il est certain que Blades of Vengeance proposerait une bien meilleure expérience.', 1, 4, '2025-04-21 00:00:00', 'draft', 'public', 11, NULL, NULL, NULL, '2025-05-01 15:06:55', '2025-05-01 15:06:55'),
(8, NULL, 'Estimer la valeur de ses jeux rétros', 'estimer-la-valeur-de-ses-jeux-retros', '', 1, 6, '2025-04-26 12:00:00', 'draft', 'public', 0, NULL, NULL, NULL, '2025-04-26 21:11:13', '2025-04-26 21:11:13');
INSERT INTO `articles` (`id`, `image_id`, `title`, `slug`, `content`, `user_id`, `type_id`, `published_date`, `status`, `visibility`, `reading_time`, `seo_title`, `seo_description`, `seo_keywords`, `modified`, `created`) VALUES
(9, 86, 'La SEGA Saturn et son architecture 3D', 'la-sega-saturn-et-son-architecture-3d', '**Depuis l’avènement des lecteurs de disques optiques dans nos consoles, les développeurs ont su profiter d’une plus grande capacité de stockage par rapport aux cartouches traditionnelles, mais cette modernité n’est pas sans défaut, car le disque optique est un média fragile qui, même sans être utilisé, se détériore au fil du temps. Dans un futur proche, de nombreux jeux vidéo qui ont été distribués durant la fin des années 80 jusqu’au début des années 2000 seront malheureusement voués à disparaître, mais pour tenter de préserver le plus longtemps possible leur précieuse ludothèque de jeux rétros, certains joueurs ont recours aux fameux CD gravés, mais leur utilisation est-elle sans risque pour le matériel ?**\r\n\r\nSi vous êtes l’heureux possesseur d’une console de jeux rétro disposant d’un lecteur de disque optique, il est fort probable que vous utilisez régulièrement des CD-R pour exécuter des homebrew, remplacer des disques défectueux ou tenter de préserver vos jeux dûment achetés contre le vieillissement. Bien que graver un jeu peut sembler être un acte anodin de nos jours, il y a toujours des doutes concernant leur effet sur la durée de vie d’un bloc optique surtout quand ont sait qu’il devient relativement difficile de trouver des pièces de rechange en cas de panne. Au vu des prix des consoles rétro, il est donc normal qu’une grande majorité des retrogamers refusent encore aujourd’hui d’utiliser ce type de disques pour ne pas risquer d’abîmer le matériel.\r\n\r\nIl faut savoir que contrairement à un CD pressé, la lecture d’un jeu gravé demande un peu plus d’effort pour la lentille, car les techniques pour y inscrire les données sont complètement différentes. En effet, dans le cas d’un CD enregistrable, les données sont inscrites sur la surface grâce à un faisceau laser qui vient brûler directement la couche chimique tandis que le pressage CD consiste à utiliser un moule, le glassmaster, dans lequel sera injecté du polycarbonate (plastique) avant d’être pressé. Durant le processus, des machines sophistiquées contrôlent en permanence les différentes étapes de fabrication afin de s’assurer que les données sont conformes au CD d’origine. Par la suite est alors ajoutée une fine couche d’aluminium faisant office de vernis protecteur avant la sérigraphie couleur afin de bénéficier d’une bonne résistance à contrario du CD-R qui est très sensible aux chocs, à la lumière et aux températures extrêmes.\r\n\r\nDe par sa fragilité, un jeu gravé se détériora logiquement plus vite par rapport à un jeu acheté dans le commerce, ce qui au bout d’un moment aura pour conséquence de forcer la lentille à travailler davantage pour lire les données. Il est aussi important de souligner que la gravure d’un CD ne sera jamais parfaite puisqu’il s’agit en quelque sorte d’une duplication « artisanale » dont le résultat dépend très souvent du fichier source, mais aussi des connaissances de l’utilisateur et des outils qui lui sont mis à sa disposition.\r\n\r\nDupliquer un disque demande un vrai travail de préparation et c’est une erreur de penser qu’il suffit de balancer un banal CD-R vierge dans son lecteur avant de lancer immédiatement la gravure sans même avoir procédé au préalable à quelques vérifications élémentaires. Il est par exemple possible que l’intégrité des données soit altérée en raison d’une source comportant des erreurs ou bien d’une vitesse de gravure trop élevée. Le CD-R sera neuf en apparence, mais l’usage de ce dernier aura les mêmes incidences sur la lentille qu’un CD en mauvais état. Il est donc indispensable de vérifier l’intégrité des données à dupliquer et de s’assurer par la suite qu’aucun secteur défectueux ne soit présent avant son utilisation.\r\n\r\nÉtant donné que c’est la bonne condition d’un CD pressé ou gravé qui, sur le long terme, déterminera la bonne santé du bloc optique, cela relève du bon sens de disposer d’un CD-R de qualité, d’un bon graveur et d’un logiciel de renom. Malgré ces précautions, certains jeux gourmands en mémoire peuvent solliciter énormément le bloc optique en accédant constamment aux données présentes sur le disque, ce qui fera sollicitera intensivement la lentille, mais le véritable danger est inéluctablement les homebrew permettant de lire des films sur nos anciennes consoles sauf si celles-ci ont été pensées pour le multimédia comme la PlayStation 2 et la Xbox.\r\nJeux originaux ou gravés, comment choisir ?\r\n\r\nMême si un disque gravé ne pourra jamais égaler la qualité de conception d’un CD pressé, il est parfois préférable d’utiliser un CD-R plutôt qu’un CD original dans le cas où celui-ci serait en mauvais état, mais si après vérification votre CD ne présente aucun défaut majeur, il n’y a aucune raison d’utiliser un disque gravé si ce n’est vouloir ralentir l’inévitable : la mort du disque.\r\n\r\nIl est bon de préciser certaines subtilités propres aux GD-ROM de la Dreamcast qui souffrent d’une surface très fragile puisque la moindre tâche ou rayure peut irrémédiablement rendre le disque illisible. Par ailleurs, les jeux récupérés sur Internet sous forme d’image ISO sont très souvent compressés afin de pouvoir tenir sur un CD-R d’une capacité allant de 700 à 800MB et de ce fait, il y a un risque potentiel que le positionnement des données sur le disque ne soit pas correctement optimisé, ce qui obligera la lentille à fournir un travail supplémentaire en faisant d’incessants aller-retour lors de la lecture.\r\n\r\nAu vu de toutes les contraintes qu’apportent l’utilisation d’un jeu gravé, il est normal de préférer jouer avec des CD originaux, mais si vous souhaitez tout de même utiliser des CD-R, gardez bien en tête que ces disques sont très fragiles et qu’il faut les manipuler avec le plus grand soin tout en les protégeant de la lumière du soleil, des fortes chaleurs, mais aussi de l’humidité. Puisque ces disques enregistrables ont une durée de vie limitée pouvant aller de 2 à 5 ans, par précaution je ne serais trop vous conseiller d’effectuer régulièrement de nouvelles copies et de jeter les anciennes.\r\n\r\nPour les indécis d’entre vous qui n’arriveraient pas encore à se positionner, sachez qu’il existe une autre alternative consistant à remplacer le lecteur optique par un disque dur ou un lecteur de cartes flash. C’est plutôt radical comme solution, mais ces mods sont une véritable bénédiction, car leur installation permet d’en finir définitivement avec la fragilité et l’usure des CD en plus de redonner vie à une console dont le lecteur serait malencontreusement défaillant. Quoi que vous choisissiez, gardez bien en tête que vos jeux et vos consoles finiront, un jour hélas, par ne plus fonctionner.', 1, 7, '2025-04-21 03:04:00', 'draft', 'public', 7, NULL, NULL, NULL, '2025-04-21 15:24:02', '2025-04-21 15:24:02'),
(10, 79, 'Jeux gravés : quels risques pour nos consoles ?', 'jeux-graves-quels-risques-pour-nos-consoles', '', 1, 7, '2025-04-26 12:04:00', 'draft', 'public', 0, NULL, NULL, NULL, '2025-04-26 21:11:35', '2025-04-26 21:11:35'),
(11, 94, 'Le Zilog Z80', 'le-zilog-z80', '', 1, 4, '2025-04-27 00:00:00', 'published', 'public', 0, NULL, NULL, NULL, '2025-04-27 13:33:43', '2025-04-27 13:33:43'),
(12, 95, 'Une mystérieuse Mega Drive 2', 'une-mysterieuse-mega-drive-2', '', 1, 1, '2025-04-27 13:34:07', 'draft', 'public', 0, NULL, NULL, NULL, '2025-04-27 13:34:07', '2025-04-27 13:34:07'),
(13, 96, 'Sonic & Knuckles : le jeu qui m’a fait adorer la Mega Drive', 'sonic-knuckles-le-jeu-qui-m-a-fait-adorer-la-mega-drive', '', 1, 1, '2025-04-27 13:34:47', 'draft', 'public', 0, NULL, NULL, NULL, '2025-04-27 13:34:47', '2025-04-27 13:34:47'),
(14, 136, 'The HyperStone Heist : Ce jeu ultime que j\'ai enfin acquis', 'the-hyperstone-heist-ce-jeu-ultime-que-j-ai-enfin-acquis', '', 1, 1, '2025-04-30 00:00:00', 'draft', 'public', 0, NULL, NULL, NULL, '2025-04-30 17:53:08', '2025-04-30 17:53:08'),
(15, 79, 'Tout savoir pour bien débuter sur SEGA Saturn', 'tout-savoir-pour-bien-debuter-sur-sega-saturn', '', 1, 6, '2025-05-10 15:21:09', 'draft', 'public', 0, NULL, NULL, NULL, NULL, '2025-04-20 17:17:35'),
(16, 81, 'Reprendre le contrôle sur les jeux rétros', 'reprendre-le-controle-sur-les-jeux-retros', '', 1, 6, '2025-05-10 15:21:31', 'draft', 'public', 0, NULL, NULL, NULL, NULL, '2025-04-20 17:17:51'),
(17, 97, 'Développer sur SEGA Saturn avec libyaul', 'developper-sur-sega-saturn-avec-libyaul', '', 1, 5, '2025-04-27 13:45:03', 'draft', 'public', 0, NULL, NULL, NULL, '2025-04-27 13:45:03', '2025-04-27 13:45:03');

-- --------------------------------------------------------

--
-- Structure de la table `articles_systems`
--

CREATE TABLE `articles_systems` (
  `id` int NOT NULL,
  `article_id` int NOT NULL,
  `system_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `articles_systems`
--

INSERT INTO `articles_systems` (`id`, `article_id`, `system_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 2),
(4, 9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `articles_tags`
--

CREATE TABLE `articles_tags` (
  `id` int NOT NULL,
  `article_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `articles_tags`
--

INSERT INTO `articles_tags` (`id`, `article_id`, `tag_id`) VALUES
(9, 1, 3),
(4, 2, 3),
(8, 5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `article_types`
--

CREATE TABLE `article_types` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `content_type` varchar(45) DEFAULT 'article'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `article_types`
--

INSERT INTO `article_types` (`id`, `name`, `slug`, `description`, `content_type`) VALUES
(1, 'Story', 'stories', '', 'story'),
(2, 'Tests', 'tests', '', 'review'),
(4, 'Chronique', 'chroniques', '', 'feature'),
(5, 'Tutoriel', 'tutoriels', '', 'tutorial'),
(6, 'Guide', 'guides', '', 'feature'),
(7, 'Focus', 'focus', '', 'feature'),
(8, 'Edito', 'editos', NULL, 'story');

-- --------------------------------------------------------

--
-- Structure de la table `companies`
--

CREATE TABLE `companies` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `slug` varchar(60) DEFAULT NULL,
  `description` text,
  `is_manufacturer` tinyint(1) DEFAULT '0',
  `is_publisher` tinyint(1) DEFAULT '0',
  `is_developer` tinyint(1) DEFAULT '0',
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `companies`
--

INSERT INTO `companies` (`id`, `name`, `slug`, `description`, `is_manufacturer`, `is_publisher`, `is_developer`, `parent_id`) VALUES
(1, 'SEGA', 'sega', 'SEGA est le constructeur historique qui a défoncé Nintendo !', 1, 1, 1, NULL),
(2, 'Capcom', 'capcom', '', 0, 1, 1, NULL),
(3, 'Konami', 'konami', '', 0, 1, 1, NULL),
(4, 'Core Design', 'core-design', '', 0, 1, 1, NULL),
(5, 'Tecno Soft', 'tecno-soft', '', 0, 0, 1, NULL),
(6, 'Delphine Software', 'delphine-software', '', 0, 0, 1, NULL),
(7, 'Hudson Soft', 'hudson-soft', '', 0, 1, 1, NULL),
(8, 'Tecmo', 'tecmo', '', 0, 1, 1, NULL),
(9, 'SNK', 'snk', '', 0, 1, 1, NULL),
(10, 'Treasure', 'treasure', '', 0, 0, 1, NULL),
(11, 'Bullfrog', 'bullfrog', '', 0, 0, 1, NULL),
(12, 'Acclaim', 'acclaim', '', 0, 1, 1, NULL),
(13, 'Midway', 'midway', '', 0, 1, 1, NULL),
(14, 'Lobotomy Software', 'lobotomy-software', '', 0, 0, 1, NULL),
(15, '3D Realms', '3d-realms', '', 0, 1, 1, NULL),
(16, 'Vic Tokai', 'vic-tokai', '', 0, 1, 1, NULL),
(17, 'G.Rev', 'g-rev', '', 0, 0, 1, NULL),
(18, 'Infogrames', 'infogrames', '', 0, 1, 1, NULL),
(19, 'Compile', 'compile', '', 0, 0, 1, NULL),
(20, 'SEGA AM2', 'sega-am2', NULL, NULL, NULL, 1, 1),
(21, 'SEGA AM3', 'sega-am3', NULL, NULL, NULL, 1, 1),
(22, 'Eidos Interactive', 'eidos-interactive', NULL, 0, 1, 0, NULL),
(23, 'Kaneko', 'kaneko', NULL, 0, 1, 1, NULL),
(24, 'Namco', 'namco', NULL, 0, 1, 1, NULL),
(25, 'Sonic Team', 'sonic-team', NULL, 0, 0, 1, 1),
(26, 'U.S. Gold', 'u-s-gold', NULL, NULL, 1, 1, NULL),
(27, 'SEGA AM8', 'sega-am8', NULL, 0, 0, 1, 1),
(28, 'Team Ninja', NULL, NULL, NULL, NULL, 1, 8);

-- --------------------------------------------------------

--
-- Structure de la table `games`
--

CREATE TABLE `games` (
  `id` int NOT NULL,
  `title` varchar(160) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `image_id` int DEFAULT NULL,
  `system_id` int NOT NULL,
  `publisher_id` int DEFAULT NULL,
  `developer_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `release_date_format` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `games`
--

INSERT INTO `games` (`id`, `title`, `slug`, `description`, `image_id`, `system_id`, `publisher_id`, `developer_id`, `genre_id`, `release_date`, `release_date_format`, `created`, `modified`) VALUES
(1, 'Sonic The Hedgehog', 'sonic-the-hedgehog', NULL, NULL, 2, 1, 25, 4, '1991-01-01', 'day', '2025-04-21 08:50:39', '2025-04-21 08:50:39'),
(2, 'The Revenge of Shinobi', 'the-revenge-of-shinobi', 'The Revenge of Shinobi est un jeu d\'action dans la pure veine des jeux d\'arcade. Cette version Mega Drive est sans conteste le summum du jeu d\'action sur console !', NULL, 2, 1, 1, 1, '1989-01-01', 'year', '2025-04-20 13:24:49', '2025-04-20 13:24:49'),
(3, 'Thunder Force III', 'thunder-force-iii', NULL, NULL, 2, 1, 5, 5, '2025-04-20', 'day', '2025-04-20 13:06:30', '2025-04-20 13:06:30'),
(4, 'Sonic The Hedgehog 2', 'sonic-the-hedgehog-2', '', NULL, 2, 1, 25, 4, '1992-10-25', 'day', '2025-04-21 15:33:34', '2025-04-21 15:33:34'),
(5, 'Sonic The Hedgehog 3', 'sonic-the-hedgehog-3', '', NULL, 2, 1, 25, 4, '1994-02-24', 'day', '2025-04-21 15:34:23', '2025-04-21 15:34:23'),
(6, 'Mortal Kombat', 'mortal-kombat', NULL, NULL, 2, 13, 12, 3, '1993-09-13', 'day', '2025-04-21 08:59:46', '2025-04-21 08:59:46'),
(7, 'Comix Zone', 'comix-zone', NULL, NULL, 2, 1, 27, 1, '1995-01-01', 'year', '2025-04-21 08:28:23', '2025-04-21 08:28:23'),
(8, 'Flash Back', 'flash-back', NULL, NULL, 2, 26, 6, 1, '1992-01-01', 'year', '2025-04-21 08:25:35', '2025-04-21 08:25:35'),
(9, 'Thunder Force IV', 'thunder-force-iv', NULL, NULL, 2, 1, 5, 5, '2025-04-20', 'day', '2025-04-20 13:20:12', '2025-04-20 13:20:12'),
(10, 'Musha Aleste', 'musha-aleste', NULL, NULL, 2, 1, 19, 5, '2025-04-20', 'day', '2025-04-20 13:09:15', '2025-04-20 13:09:15'),
(11, 'Final Fight CD', 'final-fight-cd', NULL, NULL, 6, 1, 1, 6, '1993-01-01', 'year', '2025-04-21 09:01:15', '2025-04-21 09:01:15'),
(12, 'Sonic CD', 'sonic-cd', NULL, NULL, 6, 1, 25, 4, '1994-09-23', 'day', '2025-04-21 08:41:11', '2025-04-21 08:41:11'),
(13, 'Robo Aleste', 'robo-aleste', NULL, NULL, 6, 1, 19, 5, '1992-01-01', 'year', '2025-04-20 16:04:50', '2025-04-20 16:04:50'),
(14, 'Dead or Alive', 'dead-or-alive', NULL, NULL, 3, 1, 8, 3, '2025-04-20', 'day', '2025-04-20 13:11:32', '2025-04-20 13:11:32'),
(15, 'Virtua Fighter', 'virtua-fighter', NULL, NULL, 3, 1, 20, 3, '1994-11-22', 'day', '2025-04-21 09:01:57', '2025-04-21 09:01:57'),
(16, 'Tomb Raider', 'tomb-raider', NULL, NULL, 3, 1, 4, 1, '2025-04-20', 'day', '2025-04-20 13:11:19', '2025-04-20 13:11:19'),
(17, 'Duke Nukem 3D', 'duke-nukem-3d', NULL, NULL, 3, 1, 14, 1, '2025-04-20', 'day', '2025-04-20 13:11:53', '2025-04-20 13:11:53'),
(18, 'Sonic Jam', 'sonic-jam', NULL, NULL, 3, 1, 25, 4, '1997-08-28', 'day', '2025-04-21 08:43:13', '2025-04-21 08:43:13'),
(19, 'Street Fighter Alpha', 'street-fighter-alpha', NULL, NULL, 3, 2, 2, 3, '2025-04-20', 'day', '2025-04-20 13:10:32', '2025-04-20 13:10:32'),
(20, 'Street Fighter Alpha 2', 'street-fighter-alpha-2', NULL, NULL, 3, 2, 2, 3, '1996-02-27', 'day', '2025-04-21 11:40:05', '2025-04-21 11:40:05'),
(21, 'Last Bronx', 'last-bronx', NULL, NULL, 3, 1, 1, 3, '2025-04-20', 'day', '2025-04-20 16:02:32', '2025-04-20 16:02:32'),
(22, 'Sonic & Knuckles', 'sonic-knuckles', NULL, NULL, 2, 1, 25, 4, '1994-10-18', 'day', '2025-04-21 08:41:57', '2025-04-21 08:41:57'),
(23, 'Aero Blaster', 'aero-blaster', NULL, NULL, 2, 23, 23, 5, '1990-01-01', 'year', '2025-04-20 16:04:06', '2025-04-20 16:04:06'),
(24, 'Virtua Fighter 2', 'virtua-fighter-2', NULL, NULL, 3, 1, 20, 3, '2025-04-20', 'day', '2025-04-21 09:02:11', '2025-04-21 09:02:11'),
(25, 'Sonic Adventure', 'sonic-adventure', NULL, NULL, 4, 1, 25, 4, '1999-10-14', 'day', '2025-04-21 08:43:54', '2025-04-21 08:43:54'),
(26, 'Sonic Adventure 2', 'sonic-adventure-2', NULL, NULL, 4, 1, 25, 4, '2001-06-23', 'day', '2025-04-20 17:04:32', '2025-04-20 17:04:32'),
(27, 'Alex Kidd', 'alex-kidd', 'Un super jeu sur Master System :)', NULL, 1, 1, 1, 4, '2025-04-20', 'day', '2025-04-20 13:23:06', '2025-04-20 13:23:06'),
(28, 'Ninja Gaiden', 'ninja-gaiden', '', NULL, 1, 1, 1, 1, '1992-01-01', 'year', '2025-04-21 15:35:17', '2025-04-21 15:35:17'),
(29, 'Shadow Dancer: The Secret of Shinobi', 'shadow-dancer-the-secret-of-shinobi', NULL, NULL, 2, 1, 1, 1, '2025-04-20', 'day', '2025-04-20 13:20:29', '2025-04-20 13:20:29'),
(30, 'Golden Axe', 'golden-axe', 'Un culte :)', NULL, 2, 1, 1, 6, '1989-01-01', 'year', '2025-04-20 13:26:15', NULL),
(31, 'Gunstar Heroes', 'gunstar-heroes', NULL, NULL, 2, 1, 10, 1, '1993-01-01', 'year', '2025-04-20 15:59:42', NULL),
(32, 'PowerStone', 'powerstone', NULL, NULL, 4, 22, 2, 1, '1999-10-13', 'day', '2025-04-20 16:02:10', NULL),
(33, 'Sonic The Hedgehog 2', 'sonic-the-hedgehog-2', NULL, NULL, 1, 1, 25, 4, '1992-10-25', 'day', '2025-04-21 08:45:18', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `games_genres`
--

CREATE TABLE `games_genres` (
  `id` int NOT NULL,
  `game_id` int NOT NULL,
  `genre_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `genres`
--

CREATE TABLE `genres` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `genres`
--

INSERT INTO `genres` (`id`, `name`, `slug`, `description`, `created`, `modified`) VALUES
(1, 'Action', 'action', '', NULL, NULL),
(2, 'Aventure', 'aventure', '', NULL, NULL),
(3, 'Combat', 'combat', '', NULL, NULL),
(4, 'Plateforme', 'plateforme', '', NULL, NULL),
(5, 'Shoot\'em up', 'shoot-em-up', '', NULL, NULL),
(6, 'Beat\'em up', 'beat-em-up', '', NULL, NULL),
(7, 'RPG', 'rpg', '', NULL, NULL),
(8, 'Course', 'course', '', NULL, NULL),
(9, 'Doom-like', 'doom-like', '', NULL, NULL),
(10, 'Stratégie', 'strategie', '', NULL, NULL),
(11, 'Puzzle', 'puzzle', '', NULL, NULL),
(12, 'Gestion', 'gestion', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` int NOT NULL,
  `title` varchar(160) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(45) DEFAULT 'image',
  `category` varchar(45) DEFAULT NULL,
  `mime` varchar(60) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filesize` int DEFAULT NULL,
  `filegroup` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `game_id` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `title`, `description`, `type`, `category`, `mime`, `filename`, `filesize`, `filegroup`, `width`, `height`, `keywords`, `game_id`, `created`, `modified`) VALUES
(1, 'Collection de jeux Saturn', 'Une pile de jeux Saturn PAL', 'photo', NULL, 'image/jpeg', '20250426_1fb1bdbd1d.webp', 217266, 1, 2048, 1536, 'collection, jeux, sega saturn, boîte', NULL, '2025-04-26 15:53:31', '2025-04-26 15:53:31'),
(2, 'SEGA Saturn', 'Console SEGA Saturn', 'photo', NULL, 'image/jpeg', '20250426_05ec90bf5d.webp', 161182, 1, 1600, 1600, NULL, NULL, '2025-04-26 14:57:04', '2025-04-26 14:57:04'),
(3, 'SEGA Saturn', 'Console SEGA Saturn', 'photo', NULL, 'image/jpeg', '20250426_2ee8db4437.webp', 133572, 1, 1600, 1600, 'sega saturn', NULL, '2025-04-26 15:51:51', '2025-04-26 15:51:51'),
(4, 'Boîte Nights Manette 3D', 'Boîte du jeu Nights', 'photo', NULL, 'image/jpeg', '20250426_ce9ae80849.webp', 57570, 1, 595, 425, NULL, NULL, '2025-04-26 14:57:43', '2025-04-26 14:57:43'),
(5, 'SEGA Saturn', 'Console SEGA Saturn', 'photo', NULL, 'image/jpeg', '20250426_d6c8b502fb.webp', 190788, 1, 1600, 1148, 'sega saturn', NULL, '2025-04-26 15:52:33', '2025-04-26 15:52:33'),
(6, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_0464709823.webp', 47190, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:41', NULL),
(7, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_85f92334b7.webp', 37268, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:42', NULL),
(8, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_51712d994d.webp', 53980, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:43', NULL),
(9, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_1ef5d850b7.webp', 49910, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:44', NULL),
(10, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_6e62fafd87.webp', 24374, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:45', NULL),
(11, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_4bc976e7f0.webp', 57234, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:45', NULL),
(12, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_3c3e499606.webp', 52846, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:46', NULL),
(13, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_d750672b79.webp', 24538, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:47', NULL),
(14, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_23ff388d38.webp', 22392, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:48', NULL),
(15, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_e079315120.webp', 42084, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:49', NULL),
(16, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_6042df9075.webp', 38308, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:50', NULL),
(17, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_d74e018d8f.webp', 34482, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:51', NULL),
(18, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_f922581cad.webp', 36494, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:52', NULL),
(19, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_cad5299406.webp', 33276, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:53', NULL),
(20, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_257e1598f2.webp', 33300, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:53', NULL),
(21, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_cc0f84a980.webp', 34020, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:54', NULL),
(22, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_f94b02e637.webp', 37310, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:55', NULL),
(23, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_1908f4c930.webp', 35356, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:56', NULL),
(24, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_153cb0c900.webp', 35638, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:57', NULL),
(25, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_55e091e5a5.webp', 40138, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:58', NULL),
(26, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_12b00bdd7b.webp', 46752, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:58', NULL),
(27, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_f734f27f1a.webp', 40184, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:05:59', NULL),
(28, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_9e5350ee80.webp', 43372, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:00', NULL),
(29, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_a829459936.webp', 40084, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:01', NULL),
(30, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_7d5f1475da.webp', 38410, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:02', NULL),
(31, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_f0810b91d0.webp', 36694, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:03', NULL),
(32, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_12ccd9ba2c.webp', 41096, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:04', NULL),
(33, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_6e299ebd05.webp', 26006, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:05', NULL),
(34, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_5e52c118a1.webp', 36374, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:05', NULL),
(35, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_1e8c184ab0.webp', 38006, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:06', NULL),
(36, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_21f505dd67.webp', 33548, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:07', NULL),
(37, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_710b6f5cc6.webp', 35612, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:08', NULL),
(38, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_06a0de4904.webp', 39766, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:09', NULL),
(39, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_d6deb371fd.webp', 32114, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:10', NULL),
(40, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_e452298d47.webp', 36014, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:11', NULL),
(41, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_4b71250e9d.webp', 23736, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:12', NULL),
(42, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_d77c6abb57.webp', 39654, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:12', NULL),
(43, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_82e62e29f1.webp', 40130, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:13', NULL),
(44, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_e553992333.webp', 38904, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:14', NULL),
(45, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_b7d81f7914.webp', 49966, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:15', NULL),
(46, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_cb69378195.webp', 29968, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:16', NULL),
(47, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_bb4bf406e9.webp', 24758, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:17', NULL),
(48, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_ab3cdc171c.webp', 30632, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:17', NULL),
(49, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_5ee168cac4.webp', 32518, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:18', NULL),
(50, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_03916f6d9e.webp', 45352, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:19', NULL),
(51, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_2a29994349.webp', 39424, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:20', NULL),
(52, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_e56d09da3f.webp', 34298, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:21', NULL),
(53, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_81e8313955.webp', 34212, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:22', NULL),
(54, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_a9edab7d16.webp', 37376, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:23', NULL),
(55, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_ab287ea09b.webp', 20824, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:24', NULL),
(56, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_5c1c53b5bf.webp', 30066, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:24', NULL),
(57, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_edd73a47b3.webp', 28364, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:25', NULL),
(58, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_ddda589a02.webp', 30504, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:26', NULL),
(59, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_3641c259e6.webp', 30196, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:27', NULL),
(60, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_5c665d11fe.webp', 31588, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:28', NULL),
(61, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_d5290ebdd6.webp', 38034, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:29', NULL),
(62, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_aefdf42633.webp', 25160, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:29', NULL),
(63, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_38a36ab48c.webp', 27314, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:30', NULL),
(64, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_899c84e8ba.webp', 30270, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:31', NULL),
(65, 'Virtua Fighter Remix', NULL, 'screenshot', NULL, 'image/png', '20250426_f9f6dcec2e.webp', 30836, 1, 664, 448, 'sega saturn, virtua fighter, capture', NULL, '2025-04-26 15:06:32', NULL),
(66, 'SEGA Rally Championship', 'Meilleur jeu de l\'année !\n\nCapture provenant d\'une vraie console :)', 'screenshot', NULL, 'image/png', '20250426_bebab0b7bc.webp', 56982, 1, 664, 448, 'sega saturn, capture, voiture, automobile', NULL, '2025-04-26 16:03:45', '2025-04-26 16:03:45'),
(67, 'SEGA Rally Championship', NULL, 'screenshot', NULL, 'image/png', '20250426_f341ead463.webp', 57112, 1, 664, 448, 'sega saturn, capture, voiture, automobile', NULL, '2025-04-26 16:02:13', '2025-04-26 16:02:13'),
(68, 'SEGA Rally Championship', NULL, 'screenshot', NULL, 'image/png', '20250426_a08d50d68e.webp', 61736, 1, 664, 448, 'sega saturn, capture, voiture, automobile', NULL, '2025-04-26 16:02:16', '2025-04-26 16:02:16'),
(69, 'SEGA Rally Championship', NULL, 'screenshot', NULL, 'image/png', '20250426_7c95147914.webp', 65198, 1, 664, 448, 'sega saturn, capture, voiture, automobile', NULL, '2025-04-26 16:02:18', '2025-04-26 16:02:18'),
(70, 'SEGA Rally Championship', NULL, 'screenshot', NULL, 'image/png', '20250426_dbe62d3d64.webp', 64782, 1, 664, 448, 'sega saturn, capture, voiture, automobile', NULL, '2025-04-26 16:02:24', '2025-04-26 16:02:24'),
(71, 'SEGA Rally Championship', NULL, 'screenshot', NULL, 'image/png', '20250426_970cc7a6af.webp', 59632, 1, 664, 448, 'sega saturn, capture, voiture, automobile', NULL, '2025-04-26 16:02:27', '2025-04-26 16:02:27'),
(72, 'SEGA Rally Championship', NULL, 'screenshot', NULL, 'image/png', '20250426_37e5899603.webp', 63646, 1, 664, 448, 'sega saturn, capture, voiture, automobile', NULL, '2025-04-26 16:02:30', '2025-04-26 16:02:30'),
(73, NULL, NULL, 'art', NULL, 'image/jpeg', '20250426_211f11fbd0.webp', 267318, 1, 1000, 1000, NULL, NULL, '2025-04-26 21:08:56', '2025-04-26 21:08:56'),
(74, NULL, NULL, 'art', NULL, 'image/webp', '20250426_51fe822823.webp', 52786, 1, 1280, 720, NULL, NULL, '2025-04-26 21:17:25', NULL),
(75, NULL, NULL, 'art', NULL, 'image/webp', '20250426_12e9aa99a9.webp', 190714, 1, 1000, 800, NULL, NULL, '2025-04-26 21:17:26', NULL),
(76, NULL, NULL, 'art', NULL, 'image/webp', '20250426_0418789ba0.webp', 43172, 1, 686, 386, NULL, NULL, '2025-04-26 21:17:27', NULL),
(77, NULL, NULL, 'art', NULL, 'image/webp', '20250426_bb5f8fc838.webp', 65470, 1, 1344, 630, NULL, NULL, '2025-04-26 21:17:28', NULL),
(78, NULL, NULL, 'art', NULL, 'image/webp', '20250426_2a6c57badc.webp', 143034, 1, 1000, 563, NULL, NULL, '2025-04-26 21:17:29', NULL),
(79, NULL, NULL, 'art', NULL, 'image/webp', '20250426_70e6e39d35.webp', 73298, 1, 1344, 630, NULL, NULL, '2025-04-26 21:17:30', NULL),
(80, NULL, NULL, 'art', NULL, 'image/webp', '20250426_c71ad1a16a.webp', 80810, 1, 1344, 630, NULL, NULL, '2025-04-26 21:17:32', NULL),
(81, NULL, NULL, 'art', NULL, 'image/webp', '20250426_6aa07697a6.webp', 152880, 1, 1344, 630, NULL, NULL, '2025-04-26 21:17:33', NULL),
(82, NULL, NULL, 'art', NULL, 'image/webp', '20250426_d1bf48944b.webp', 55820, 1, 1344, 630, NULL, NULL, '2025-04-26 21:17:34', NULL),
(83, NULL, NULL, 'art', NULL, 'image/webp', '20250426_bfcd4bc4f8.webp', 73398, 1, 772, 600, NULL, NULL, '2025-04-26 21:17:36', NULL),
(84, NULL, NULL, 'art', NULL, 'image/webp', '20250426_3a00f93794.webp', 140294, 1, 1024, 1024, NULL, NULL, '2025-04-26 21:17:37', NULL),
(85, NULL, NULL, 'art', NULL, 'image/jpeg', '20250426_2e7354df78.webp', 47890, 1, 768, 432, NULL, NULL, '2025-04-26 21:17:38', NULL),
(86, NULL, NULL, 'art', NULL, 'image/webp', '20250426_8871431173.webp', 65804, 1, 1344, 630, NULL, NULL, '2025-04-26 21:17:39', NULL),
(87, NULL, NULL, 'art', NULL, 'image/webp', '20250426_6563c577d4.webp', 50406, 1, 1080, 1080, NULL, NULL, '2025-04-26 21:17:40', NULL),
(88, NULL, NULL, 'art', NULL, 'image/webp', '20250426_b257020c8d.webp', 98600, 1, 1344, 630, NULL, NULL, '2025-04-26 21:17:42', NULL),
(89, NULL, NULL, 'art', NULL, 'image/webp', '20250426_0155c13874.webp', 232180, 1, 1000, 1000, NULL, NULL, '2025-04-26 21:17:43', NULL),
(90, NULL, NULL, 'art', NULL, 'image/png', '20250426_aced7542b1.webp', 32320, 1, 320, 224, NULL, NULL, '2025-04-26 21:17:45', NULL),
(91, NULL, NULL, 'art', NULL, 'image/webp', '20250426_39b29da353.webp', 72492, 1, 1000, 800, NULL, NULL, '2025-04-26 21:17:45', NULL),
(92, NULL, NULL, 'art', NULL, 'image/webp', '20250426_409a346094.webp', 202552, 1, 1000, 1000, NULL, NULL, '2025-04-26 21:17:47', NULL),
(93, NULL, NULL, 'art', NULL, 'image/jpeg', '20250426_e041ef4a95.webp', 253358, 1, 1000, 1000, NULL, NULL, '2025-04-26 21:17:48', NULL),
(94, NULL, NULL, NULL, NULL, 'image/webp', '20250427_540b3559b3.webp', 92958, 1, 783, 488, NULL, NULL, '2025-04-27 13:33:30', NULL),
(95, NULL, NULL, NULL, NULL, 'image/webp', '20250427_81faa326f4.webp', 55820, 1, 1344, 630, NULL, NULL, '2025-04-27 13:34:00', NULL),
(96, NULL, NULL, NULL, NULL, 'image/png', '20250427_3cfceb6baa.webp', 32320, 1, 320, 224, NULL, NULL, '2025-04-27 13:34:39', NULL),
(97, NULL, NULL, NULL, NULL, 'image/webp', '20250427_fe445e2d80.webp', 50406, 1, 1080, 1080, NULL, NULL, '2025-04-27 13:44:42', NULL),
(98, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_657ddc7381.webp', 61774, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:34', NULL),
(99, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_de019bf356.webp', 84372, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:35', NULL),
(100, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_43c9f828e2.webp', 57670, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:36', NULL),
(101, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_4ba832a25b.webp', 94318, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:37', NULL),
(102, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_4c63e45416.webp', 51602, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:37', NULL),
(103, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_bb9784b4f1.webp', 86216, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:38', NULL),
(104, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_871b76c1f0.webp', 80354, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:39', NULL),
(105, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_2afdab4e21.webp', 42402, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:40', NULL),
(106, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_a7d85af486.webp', 75864, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:41', NULL),
(107, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_29b5caf414.webp', 87474, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:42', NULL),
(108, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_688a7ff15f.webp', 88620, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:43', NULL),
(109, 'Streets of Rage', NULL, 'screenshot', NULL, 'image/webp', '20250427_ab1a0bde33.webp', 49898, 1, 800, 600, NULL, NULL, '2025-04-27 17:34:44', NULL),
(110, 'Dead or Alive', NULL, 'scan', NULL, 'image/webp', '20250427_1d1db26ed2.webp', 202218, 1, 848, 1200, 'brochure, arcade, flyer', NULL, '2025-04-27 17:38:54', NULL),
(111, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_1a4dbf981a.webp', 64930, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:19', NULL),
(112, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_65f4825434.webp', 53672, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:20', NULL),
(113, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_5541115866.webp', 70060, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:21', NULL),
(114, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_a3f4476df7.webp', 57722, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:22', NULL),
(115, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_60f17341d5.webp', 60358, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:23', NULL),
(116, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_fcb55b9b98.webp', 64204, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:25', NULL),
(117, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_1cd0b17908.webp', 78850, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:25', NULL),
(118, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_a1aa9a576d.webp', 58468, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:27', NULL),
(119, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_53dd8735ae.webp', 65842, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:27', NULL),
(120, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_b36e7f8d5f.webp', 53662, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:28', NULL),
(121, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_ba319bc826.webp', 56508, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:29', NULL),
(122, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_3c3e7ec3ef.webp', 65398, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:30', NULL),
(123, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_2a07975aa0.webp', 87446, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:31', NULL),
(124, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_78feca8646.webp', 55162, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:32', NULL),
(125, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_2accb940f2.webp', 41736, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:33', NULL),
(126, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_9ebfc16521.webp', 62506, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:33', NULL),
(127, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_4a636b37ff.webp', 56674, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:34', NULL),
(128, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_4f22e1456d.webp', 57904, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:35', NULL),
(129, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_5343acb370.webp', 69138, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:36', NULL),
(130, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_6e1ef7b5e0.webp', 49128, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:37', NULL),
(131, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_b8dca5495b.webp', 64280, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:37', NULL),
(132, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_bd6008a6a9.webp', 39460, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:38', NULL),
(133, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_cc5cf3b61c.webp', 63090, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:39', NULL),
(134, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_a89230d590.webp', 65950, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:40', NULL),
(135, 'Dead or Alive', NULL, 'screenshot', NULL, 'image/webp', '20250427_20106d242a.webp', 67626, 1, 640, 450, 'arcade, sega saturn, dead or alive', NULL, '2025-04-27 17:42:41', NULL),
(136, NULL, NULL, 'art', NULL, 'image/webp', '20250430_f8f449194e.webp', 168520, 1, 1344, 630, NULL, NULL, '2025-04-30 17:52:53', NULL),
(137, NULL, NULL, 'photo', NULL, 'image/webp', '20250501_9538eee0c8.webp', 182116, 1, 1000, 1008, NULL, NULL, '2025-05-01 15:04:56', NULL),
(138, NULL, NULL, 'image', NULL, 'image/webp', '20250501_2b4210e10c.webp', 98600, 1, 1344, 630, NULL, NULL, '2025-05-01 15:06:36', NULL),
(139, NULL, NULL, 'image', NULL, 'image/webp', '20250510_0d9b22c043.webp', 65470, 1, 1344, 630, NULL, NULL, '2025-05-10 15:34:52', NULL),
(140, NULL, NULL, 'image', NULL, 'image/webp', '20250510_8811f0ff1c.webp', 65470, 1, 1344, 630, NULL, NULL, '2025-05-10 15:35:25', NULL),
(141, NULL, NULL, 'image', NULL, 'image/webp', '20250510_7354827261.webp', 202552, 1, 1000, 1000, NULL, NULL, '2025-05-10 17:52:10', NULL),
(142, NULL, NULL, 'image', NULL, 'image/webp', '20250510_2c987cb0bd.webp', 202552, 1, 1000, 1000, NULL, NULL, '2025-05-10 17:54:27', NULL),
(143, NULL, NULL, 'image', NULL, 'image/webp', '20250510_2af9b8f0cd.webp', 39032, 1, 1344, 630, NULL, NULL, '2025-05-10 18:06:01', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `options`
--

CREATE TABLE `options` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `protected` tinyint(1) DEFAULT NULL,
  `autoload` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `review_ratings`
--

CREATE TABLE `review_ratings` (
  `id` int NOT NULL,
  `article_id` int NOT NULL,
  `content` text,
  `audio` int DEFAULT '0',
  `gameplay` int DEFAULT '0',
  `graphics` int DEFAULT '0',
  `lifespan` int DEFAULT '0',
  `optimization` int DEFAULT '0',
  `average` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `systems`
--

CREATE TABLE `systems` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `systems`
--

INSERT INTO `systems` (`id`, `name`, `slug`, `description`) VALUES
(1, 'Master System', 'master-system', 'La meilleure console 8 bit de tous les temps :)'),
(2, 'Mega Drive', 'mega-drive', ''),
(3, 'Saturn', 'sega-saturn', ''),
(4, 'Dreamcast', 'dreamcast', ''),
(5, 'Game Gear', 'game-gear', ''),
(6, 'Mega CD', 'mega-cd', ''),
(7, '32X', '32x', ''),
(8, 'Arcade', 'arcade', '');

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `slug` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `description`, `created`, `modified`) VALUES
(1, 'Retrogaming', 'retrogaming', NULL, NULL, NULL),
(2, 'Performance', 'performance', NULL, NULL, NULL),
(3, 'Baston', 'baston', NULL, NULL, NULL),
(4, 'Sonic', 'sonic', NULL, NULL, NULL),
(5, 'Genesis Does', 'genesis-does', NULL, NULL, NULL),
(6, 'Assembleur', 'assembleur', NULL, NULL, NULL),
(7, 'Programmation', 'programmation', NULL, NULL, NULL),
(8, 'Collection', 'collection', NULL, NULL, NULL),
(9, 'Découverte', 'decouverte', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `motto` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT 'default',
  `article_count` int DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `token`, `description`, `motto`, `role`, `article_count`, `created`, `modified`) VALUES
(1, 'kentosama', 'jacques.belosoukinski@gmail.com', 'katana', 'ac3040d9744b3adabf851c7c3fed9746', 'Passionné par le jeu vidéo rétro, je partage ici mes découvertes, mes analyses et mes réflexions autour de l’univers fascinant de SEGA.', 'SEGA Power !!!', 'default', 0, '2025-04-27 12:31:53', '2025-04-27 12:31:53');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug_UNIQUE` (`slug`),
  ADD KEY `fk_articles_1_idx` (`user_id`),
  ADD KEY `fk_articles_2_idx` (`type_id`);

--
-- Index pour la table `articles_systems`
--
ALTER TABLE `articles_systems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `article_id_UNIQUE` (`article_id`,`system_id`),
  ADD KEY `fk_articles_systems_2_idx` (`system_id`);

--
-- Index pour la table `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `article_id_UNIQUE` (`article_id`,`tag_id`),
  ADD KEY `fk_articles_tags_2_idx` (`tag_id`);

--
-- Index pour la table `article_types`
--
ALTER TABLE `article_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug_UNIQUE` (`slug`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Index pour la table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_companies_1_idx` (`parent_id`);

--
-- Index pour la table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug_UNIQUE` (`slug`,`system_id`),
  ADD KEY `fk_games_1_idx` (`image_id`),
  ADD KEY `fk_games_2_idx` (`publisher_id`),
  ADD KEY `fk_games_3_idx` (`developer_id`),
  ADD KEY `fk_games_4_idx` (`system_id`);

--
-- Index pour la table `games_genres`
--
ALTER TABLE `games_genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `game_id_UNIQUE` (`game_id`,`genre_id`),
  ADD KEY `fk_games_genres_2_idx` (`genre_id`);

--
-- Index pour la table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug_UNIQUE` (`slug`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filename_UNIQUE` (`filename`),
  ADD KEY `fk_media_1_idx` (`game_id`);

--
-- Index pour la table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Index pour la table `review_ratings`
--
ALTER TABLE `review_ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `article_id_UNIQUE` (`article_id`);

--
-- Index pour la table `systems`
--
ALTER TABLE `systems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD UNIQUE KEY `slug_UNIQUE` (`slug`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug_UNIQUE` (`slug`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `token_UNIQUE` (`token`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `articles_systems`
--
ALTER TABLE `articles_systems`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `articles_tags`
--
ALTER TABLE `articles_tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `article_types`
--
ALTER TABLE `article_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `games`
--
ALTER TABLE `games`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `games_genres`
--
ALTER TABLE `games_genres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT pour la table `options`
--
ALTER TABLE `options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `review_ratings`
--
ALTER TABLE `review_ratings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `systems`
--
ALTER TABLE `systems`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `fk_articles_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_articles_2` FOREIGN KEY (`type_id`) REFERENCES `article_types` (`id`);

--
-- Contraintes pour la table `articles_systems`
--
ALTER TABLE `articles_systems`
  ADD CONSTRAINT `fk_articles_systems_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `fk_articles_systems_2` FOREIGN KEY (`system_id`) REFERENCES `systems` (`id`);

--
-- Contraintes pour la table `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD CONSTRAINT `fk_articles_tags_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `fk_articles_tags_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Contraintes pour la table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `fk_companies_1` FOREIGN KEY (`parent_id`) REFERENCES `companies` (`id`);

--
-- Contraintes pour la table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `fk_games_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `fk_games_2` FOREIGN KEY (`publisher_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `fk_games_3` FOREIGN KEY (`developer_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `fk_games_4` FOREIGN KEY (`system_id`) REFERENCES `systems` (`id`);

--
-- Contraintes pour la table `games_genres`
--
ALTER TABLE `games_genres`
  ADD CONSTRAINT `fk_games_genres_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `fk_games_genres_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_media_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`);

--
-- Contraintes pour la table `review_ratings`
--
ALTER TABLE `review_ratings`
  ADD CONSTRAINT `fk_review_ratings_1` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

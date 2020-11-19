DROP DATABASE IF EXISTS marketplace;

CREATE DATABASE marketplace;

USE marketplace;

DROP TABLE IF EXISTS brands;

CREATE TABLE brands
(
	brandCode INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	brandName TEXT
);

DROP TABLE IF EXISTS categories;

CREATE TABLE categories
(
	categoryNumber INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    categoryName TINYTEXT
);

DROP TABLE IF EXISTS vendors;

CREATE TABLE vendors
(
	vendorCode INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    vendorName TINYTEXT,
    vendorDescription TINYTEXT
);

DROP TABLE IF EXISTS products;

CREATE TABLE products
(
	productCode VARCHAR(13) PRIMARY KEY,
    productName TINYTEXT,
    shortDescription TINYTEXT,
    longDescription TEXT,
    brandCode INT,
    FOREIGN KEY(brandCode) REFERENCES brands(brandCode) ON DELETE CASCADE ON UPDATE CASCADE,
    productUrl TEXT
);

DROP TABLE IF EXISTS products_categories; 

CREATE TABLE products_categories
(
	productCode VARCHAR(13),
    FOREIGN KEY(productCode) REFERENCES products(productCode) ON DELETE CASCADE ON UPDATE CASCADE,
    categoryNumber INT,
    FOREIGN KEY(categoryNumber) REFERENCES categories(categoryNumber) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT categoriesConstraint PRIMARY KEY(productCode, categoryNumber)
);

DROP TABLE IF EXISTS products_vendors;

CREATE TABLE products_vendors
(
	productCode VARCHAR(13),
    FOREIGN KEY(productCode) REFERENCES products(productCode) ON DELETE CASCADE ON UPDATE CASCADE,
    vendorCode INT,
    FOREIGN KEY(vendorCode) REFERENCES vendors(vendorCode) ON DELETE CASCADE ON UPDATE CASCADE,
    priceHT DECIMAL(10,2),
    shippingHT DECIMAL(10,2),
    stock INT,
    CONSTRAINT vendorsConstraint PRIMARY KEY(productCode, vendorCode)
);





INSERT INTO brands (brandName) VALUES ("Nintendo"),("Microsoft"),("Sony"),("Datel");





INSERT INTO products (productCode, productName, shortDescription, longDescription, brandCode, productUrl)
VALUES ("4012927029534", "Suikoden V", "Dernier opus de la série légendaire, préquel au plus légendaire encore Suikoden II!", "Tragédie et destin sont intimement liés autour de la légendaire Rune Solaire!</br>Sur les terres de Faléna, dans un pays prospère placé sous le joug matriarcat et sous la bienveillante puissance de la Rune Solaire, des troubles civils commencèrent à éclater, forçant la reine à se servir de la Rune Solaire afin de maîtriser le soulèvement... Mais à quel prix? Plongez en tant que prince dans une quête immense et éclaircissez les mystères entourant la Rune Solaire, les troubles civils, et les sombres intentions d'une puissance inconnue, dans la grande saga de Suikoden!", "3","https://image.jeuxvideo.com/images/p2/s/u/suk5p20f.jpg"),
("5060073303946","Persona 3","L'opus le plus vendu de la saga sombre de Shin Megami Tensei!","De terribles créatures rôdent dans l'obscurité, s'attaquant à ceux qui osent s'aventurer dans l'heure sombre, une anomalie temporelle cachée entre deux jours. En tant que membre d'une confrérie étudiante secrète, vous devez manier votre force intérieure, Persona, et protéger l'humanité contre une fin imminente. Vivrez-vous assez longtemps pour voir un nouveau jour se lever?","3","https://image.jeuxvideo.com/images/p2/p/e/per3p20f.jpg"),
("0711719473428","Dark Chronicle","Un des RPG les plus originaux et cultes de la console!","Dans un loingtain futur, un empereur cruel décide de remonter le temps pour éliminer tout ce qui pourrait s'opposer à son règne de terreur.</br>Dans le présent, un monde meurt. Une seule de ses villes a été épargnée. Mais dans cette ville, un jeune garçon découvre un secret qui va boulverser sa vie... et le cours de l'histoire...","3","https://image.jeuxvideo.com/images-sm/p2/d/k/dkc2p20f.jpg"),
("0711719116615","Tekken 5","Nouvel opus de la série culte de jeu de combat!","Le ninja affine ses réflexes, le boxeur serre ses poings, le catcheur étire ses muscles, l'assassin verouille sa cible... et le plus puissant des combattants de l'histoire de Tekken attend le vainqueur. Vengence et destruction seront au rendez-vous!</br>Le King of Iron First Tournament est de retour...","3","https://image.jeuxvideo.com/images-sm/p2/t/e/tek5p20f.jpg"),
("0711719468721","Final Fantasy X","Le premier volet de la série phare de la série sur Playstation 2!","Le monde enchanteur de Spira vit sous la menace constante de Sin, une entité maléfique qui dévaste tout sur son passage et n'inspire qu'effroi aux populations sans défense.</br>Incarnez Tidus, jeune star de blitzball, et Yuna, talentueuse Invokeur, dans leur pèlerinage aux quatre coins de Spira. Leur quête a pour unique but de débarasser le monde de son pire ennemi... Mais sont-ils prêts à en payer le prix?</br>Seule l'Invocation Finale peut défaire Sin. La paix de Spira repose dorénavant entre vos mains.","3","https://image.jeuxvideo.com/images-sm/p2/f/f/ffaxp20f.jpg"),
("0710425395741","Red Dead Redemption Xbox 360","Red Dead Redemption sur 360 est un GTA-like qui se déroule au début du XXème siècle","Red Dead Redemption sur 360 est un GTA-like qui se déroule au début du XXème siècle, en pleine révolution mexicaine, dans une ambiance western. On y incarne John Marston, un hors-la-loi contraint et forcé de traquer ses anciens 'frères' qui l\'ont laissé pour mort. John peut chasser toutes les espèces animales de l\'Ouest Américain et doit remplir une série de missions pour regagner son indépendance","2","https://image.jeuxvideo.com/images/jaquettes/00029350/jaquette-red-dead-redemption-xbox-360-cover-avant-g.jpg"),
("1803390191678","Batman Arkham:City Xbox 360","Batman Arkham City est un jeu d'aventure/action dans lequel Batman doit de nouveau affronter son ennemi juré, le Joker","Batman Arkham City est un jeu d'aventure/action dans lequel Batman doit de nouveau affronter son ennemi juré, le Joker, dans un Arkham toujours plus sombre et vaste. De nombreuses quêtes annexes permettent d'explorer la ville en détails.","2","https://image.jeuxvideo.com/images/jaquettes/00035463/jaquette-batman-arkham-city-xbox-360-cover-avant-g-1315230574.jpg"),
("4309859793293","Darksiders Xbox 360","Incarne un des quatre cavaliers de L'Apocalypse","Darksiders est un jeu d'aventure et d'action ou le joueur incarne un des quatre cavaliers de L'Apocalypse arpentant la terre après la fin du monde. Le titre alterne des phases de combats colossales avec des phases d'exploration.","2","https://image.jeuxvideo.com/images-sm/jaquettes/00019198/jaquette-darksiders-wrath-of-war-xbox-360-cover-avant-g.jpg"),
("1989455238880","Assasin\'s Creed : Brotherhood Xbox 360","Incarner le Maitre Assassin Ezio à Rome","Jeu d'action-aventure en monde ouvert, Assassin's Creed : Brotherhood vous permet d'incarner le Maitre Assassin Ezio à Rome, dans sa lutte contre l'Ordre des Templiers. Dans ce troisième opus de la série, l'esprit du jeu est conservé, et le multijoueur prend désormais une place importante notamment à travers plusieurs modes proposés. Chaque personnage pouvant être incarné possède armes et attaques spécifiques à son style de gameplay.","2","https://image.jeuxvideo.com/images-sm/jaquettes/00034473/jaquette-assassin-s-creed-brotherhood-xbox-360-cover-avant-g.jpg"),
("9000460549969","Call of Duty : Black Ops Xbox 360","Call of Duty : Black Ops est un jeu de tir à la première personne se déroulant pendant la guerre froide.","Call of Duty : Black Ops est un jeu de tir à la première personne se déroulant pendant la guerre froide. Le joueur y suit un soldat américain à travers de nombreuses destinations disséminées dans les campagnes et agrémentées de scènes cinématiques. En plus du mode solo, un mode multi est disponible, ainsi qu'un mode Zombies.","2","https://image.jeuxvideo.com/images-sm/jaquettes/00034820/jaquette-call-of-duty-black-ops-xbox-360-cover-avant-g.jpg"),
("8835461460376","Far Cry 3 Xbox 360","Far Cry 3 est un FPS en Open World se déroulant à Rook Island, une île au milieu du Pacifique","Far Cry 3 est un FPS en Open World se déroulant à Rook Island, une île au milieu du Pacifique. Le joueur y incarne Jason Brody, un touriste californien mêlé à une prise d'otage par des pirates. Celui-ci réussit à s'échapper mais doit survivre dans la jungle hostile en accomplissant certaines missions","2","https://image.jeuxvideo.com/images-sm/jaquettes/00026421/jaquette-far-cry-3-xbox-360-cover-avant-g-1333184989.jpg"),
("1826238223328","Halo Reach Xbox 360","Halo Reach sur Xbox 360 nous conte l'histoire de la chute de la planète Reach","Halo Reach sur Xbox 360 nous conte l'histoire de la chute de la planète Reach, avant le tout premier épisode de la célèbre série de FPS. On y suit le combat désespéré de l'escouade Noble, formée de puissants Spartans, contre les innombrables légions Covenants. La campagne est jouable à 4 en coopération et le jeu intègre une multitude de modes multijoueurs largement configurables, dont le fameux Baptême du feu. Un éditeur de cartes complet est également inclus.","2","https://image.jeuxvideo.com/images-sm/jaquettes/00025845/jaquette-halo-reach-xbox-360-cover-avant-g.jpg"),
("5256198950692","Manette Xbox 360 Edition Limitée : Halo 4","Manette sans fil Édition Spéciale Halo4","Halo4 marque le retour de l’emblématique Master Chiefrevenu faire face à son destin et à un danger qui menace l'univers tout entier. Arborant l'emblème de l’UNSC sur un châssis gris opaque, cette Manette sans fil Édition Spéciale Halo4 intégrera également la touche XboxGuide bleue façonHalo4.","3","https://images-eu.ssl-images-amazon.com/images/G/08/products/videogames/2012/Store/XboxHalo/02._V394177265_.jpg"),
("4991723863832","Xbox 360 Elite","Console de jeu Xbox 360 Elite 120G","Microsoft Xbox 360 Elite 120GB, Xbox 360, Noir, 512 Mo, DDR3, IBM PowerPC, Disque dur ","3","https://images-na.ssl-images-amazon.com/images/I/41lS5cEZPeL._AC_.jpg"),
("7062498777153","Xbox 360 Slim","Console de jeu Xbox 360 Slim 250G","a Xbox 360 S (Slim) intègre 250 Go de disque dur, le Wi-Fi, cinq ports USB et une nouvelle carte mère. Elle se veut plus fiable et plus silencieuse.","3","https://images.fr.shopping.rakuten.com/photo/1078212110_L.jpg"),
("4694294223076","Casque Officiel Xbox 360","casque Micro pour Console de Jeux Xbox 360 Manette","Casque Micro pour Console de Jeux Xbox 360 Manette - Joypad - Un casque avec microphone pour Microsoft Xbox 360 Slim / Xbox 360. Discuter la stratégie de jeu avec vos coéquipiers, 'trash-talk' vos adversaires ou tout simplement discuter tout en jouant à vos jeux préférés comme Call of Duty ou Halo. Laisser des messages vocaux avec le service Xbox Live message. Il suffit de le brancher directement dans la manette Xbox 360. Caractéristiques: Simple écouteurs arceau. Bouton de réglage du volume et interrupteur muet. Casque léger et réglable. Microphone anti-bruit réglable. Compatible Xbox 360 et Xbox 360 Slim.","3","https://www.cdiscount.com/pdt2/0/9/8/1/700x700/tri5060188010098/rw/trixes-casque-micro-headset-pour-xbox-360-micro.jpg"),
("4020628738655","Gamecube","La (ou le3) Nintendo GameCube (ニンテンドーゲームキューブ, Nintendō Gēmukyūbu?, Nintendo Gamecube)4 est une console de jeux vidéo de salon du fabricant japonais Nintendo, sortie en 2001 (2002 en Europe), développée en association avec IBM, NEC et ATI. Elle fut en concurrence avec la PlayStation 2 de Sony, la Xbox de Microsoft et la Dreamcast de Sega, qui forment ensemble la sixième génération de consoles de jeux vidéo."," Game Cube est une console de génération 128 bits intégrant un lecteur de DVD-Rom dun format miniature (8 cm au lieu de 12 cm). Si lon compare la capacité de stockage de ces disques, on atteint la quantité exceptionnelle de 1.5 Go par unité, soit environ trois plus quun CD-Rom de PlayStation ou bien encore 40 à 50 fois le contenu dune cartouche Nintendo 64. Pour gérer et animer toutes ces données, un processeur spécifique a été mis au point, le Gekko. Cadencé à 405 MHz, il est combiné à un processeur graphique dédié, le Flipper qui est lui-même capable de gérer un maximum de 12 millions de polygones à la seconde avec effets. A propos deffets, les joueurs PC retrouveront les effets de rendu de leurs puissants ordinateurs (Alpha Blending, Bump Mapping, Pixel Shading, Anti-aliasing) pour une qualité dimage inégalée. Incontestablement, Nintendo a misé sur une haute technologie. Avec ses quatre ports pour manettes de jeu, la NGC reste fidèle à la politique multijoueur instaurée par Nintendo depuis la N64. Livrée avec une manette ergonomique offrant une prise en main exceptionnelle, la console profite également de toute une gamme daccessoires sans cesse réactualisée par les différents accessoiristes du marché. Par ailleurs, la GameBoy Advance pourra être connectée à la GameCube et faire fonction dans un premier temps de manette dappoint avant déchanger dautres types de données dans un futur que lon espère proche.","1","https://images.fr.shopping.rakuten.com/photo/gamecube-purple-black-violette-console-gamecube-863743221_ML.jpg"),
("4021628738655","Wii","La Wii (ウィー, Wī?) est une console de jeux de salon du fabricant japonais Nintendo, sortie en 2006. Console de la septième génération, tout comme la Xbox 360 et la PlayStation 3 avec lesquelles elle est en rivalité, la Wii est la console de salon la plus vendue de sa génération avec 101,63 millions d'exemplaires écoulés en 2016. Elle a comme particularité d'utiliser un accéléromètre capable de détecter la position, l'orientation et les mouvements dans l'espace de la manette. La Wii a marqué un tournant dans l'histoire du jeu vidéo en ouvrant ce loisir à un public plus large, ciblant ainsi l'ensemble de la société, ce qui explique en partie son succès.","La Wii (prononcez 'Oui') est la dernière console de salon Nintendo en date. Elle a ouvert une nouvelle ère dans le divertissement. Cela fait des années que la popularité, mais aussi la complexité des jeux vidéo grandit. Avec la Wii, Nintendo transforme le jeu en maximisant l'amusement et en minimisant les tracas. Wii avec Wiimote Console Wii avec la télécommande Wii Plus. Un look épuré Le design compact de la console Wii lui permet de s’intégrer naturellement à votre équipement audiovisuel. Elle peut être placée à la verticale ou à l’horizontale. La Wii intègre 512 Mo de mémoire flash, deux ports USB 2.0 et un module WiFi. Un port carte mémoire SD permet d’augmenter la mémoire interne de la machine. La console consomme peu grâce à un processeur dernier cri qui permet de limiter son encombrement et de la laisser connectée au réseau via le mode WiiConnect24. Des contrôle révolutionnaires La télécommande Wii Plus sans fil sensible au mouvement, au fonctionnement intuitif, permet de jouer plus naturellement. Cette manette ergonomique reconnaît les mouvements que vous effectuez dans la vie de tous les jours. Vous tapez sur un tambour, vous essayez de frapper une balle avec une raquette de tennis ou une batte de base-ball… Pourquoi appuyer sur un bouton pour reproduire ces mouvements ? Avec la télécommande Wii, il vous suffit de bouger normalement pour jouer. Nintendo a voulu faire de la télécommande Wii la première manette de jeu universelle. Dans un jeu de combat, c’est une épée, dans un jeu de course c’est un volant… C’est à la fois votre pinceau, votre club de golf et votre avion, mais c’est surtout la clé qui vous donne accès à un monde de divertissement auquel vous n’aviez jamais osé rêver. Encore plus immersif avec le Nunchuk Connectez le Nunchuk à la télécommande Wii Plus et tenez-vous prêt. Vous venez de vous immerger dans un nouveau monde où le jeu prend enfin tout son sens. Vous obtenez ainsi deux appareils à la précision remarquable. Ils deviennent votre épée et votre bouclier pour défendre Hyrule dans The Legend of Zelda: Twilight Princess. Ce sont les armes qui vous permettent de vous frayer un chemin dans les corridors exigus de Metroid Prime 3: Corruption et le monde souterrain hostile de Red Steel.","1","https://www.cdiscount.com/pdt2/0/6/3/1/700x700/nin1741405052063/rw/nintendo-wii-wii-sport.jpg"),
("4021628738355","Nintendo Switch","La Nintendo Switch (ニンテンドースイッチ, Nintendō Suitchi?) est une console de jeux vidéo produite par Nintendo, succédant à la Wii U. Il s'agit de la première console hybride, c'est-à-dire multi modes, mise en vente de l'histoire7, pouvant aussi bien faire office de console de salon que de console portable. Annoncée le 17 mars 2015 au cours d'une conférence de presse, présentée officiellement le 20 octobre 2016 et montrée plus en détail le 17 janvier 2017 lors d'une présentation en direct, elle est sortie mondialement le 3 mars 2017.","Nintendo Switch avec paire de Joy-Con Rouge Néon et Bleu Néon. Obtenez la console de jeu qui vous permet de jouer aux jeux que vous voulez, n'importe où, comme vous le voulez! À la maison, la Nintendo Switch est placée sur la station d'accueil Nintendo Switch qui relie la console au téléviseur et vous permet de jouer avec votre famille et vos amis dans le confort de votre salon. Retirez simplement la Nintendo Switch de la station d'accueil pour faire passer la console en mode portable; vous pourrez alors profiter de la même fantastique expérience de jeu qu'à la maison lors de vos déplacements. La portabilité de la Nintendo Switch est améliorée grâce à son écran lumineux à haute définition. Elle vous permet de profiter d'une expérience de console de jeu complète au parc, en avion, en voiture ou chez un ami.","1","https://static.gamergen.com/img/aws/41ZbthlkGiL.jpg"),
("4021608738355","Wii U","La Wii U (ウィー ユー, Wī Yū?, prononcé en anglais : [wiː juː]) est une console de jeu vidéo commercialisée par Nintendo, succédant à la Wii. Elle est sortie le 18 novembre 2012 en Amérique du Nord, le 30 novembre 2012 en Europe et le 8 décembre 2012 au Japon. Première console de jeu vidéo de huitième génération à sortir, elle est en concurrence avec la PlayStation 4 et la Xbox One.","La console est annoncée le 7 juin 2011, durant l'E3 2011. La Wii U est la première console de salon à proposer une manette avec un écran tactile intégré, le Wii U GamePad. Les deux principales nouveautés de la console sont apportées par celui-ci. D'une part, le Wii U GamePad permet de continuer une partie, grâce à son écran intégré, même lorsque la télévision n'est pas disponible, mais cette fonctionnalité n'est pas présente avec tous les jeux. D'autre part en complément de manettes Wii, le contrôleur offre en multijoueur une expérience de jeu dite d'« informations asymétriques », c'est-à-dire que les joueurs ne disposent pas nécessairement des mêmes informations sur le GamePad par rapport à une manette et un écran de télévision traditionnels. Enfin, il s'agit de la première console de Nintendo à pouvoir générer des graphismes en haute définition. Considérée comme une déception commerciale, la production de la console s'arrête en 2017, soit seulement 4 ans après sa sortie, pour laisser place à la Nintendo Switch.","1","https://dyw7ncnq1en5l.cloudfront.net/optim/produits/318/11209/nintendo-wii-u_1374851347__w1280.jpg"),
("4021608738351","Nintendo DS Lite","La Nintendo DS (ニンテンドーDS, Nintendō Dī Esu?, DS pour Dual Screen, Double Screen au Japon), est une console portable créée par Nintendo, sortie fin 2004 au Japon et en Amérique du Nord et en 2005 en Europe. Elle est équipée de plusieurs fonctions auparavant rares, voire inédites dans le domaine du jeu vidéo portable, telles que deux écrans rétro-éclairés simultanément dont un écran tactile, un microphone, deux ports cartouche (un pour les jeux Nintendo DS, un autre pour les cartouches de jeu Game Boy Advance et les accessoires), deux haut-parleurs compatibles surround (virtuel), ou encore le Wi-Fi intégré, d'une portée de 10 à 30 mètres en LAN, permettant de connecter seize consoles entre elles, et de se connecter au Nintendo Wi-Fi Connection pour jouer en ligne.","Elle offre la meilleure qualité d’écran, luminosité et définition, de toutes les consoles actuelles ! Elle est plus compacte et plus légère en comparaison avec l’originale : - seulement les 2/3 en taille - allégée de 20% Ecrans rétro éclairés avec réglage : - Ses deux écrans rétro éclairés peuvent être réglés selon quatre niveaux afin de s’adapter à n’importe quelle luminosité et de réduire la consommation d’énergie. Le micro se trouve au centre de l’appareil : - Ses indicateurs de batterie sont clairement visibles, que la console soit ouverte ou fermée. Le stylet est plus confortable en main et plus accessible : - 1 cm de plus en taille et 1 mm de plus en circonférence - Accessible dans une fente présente sur le coté de la console. Les boutons « Start » et « Select » : - ont été repositionnés pour faciliter leur accès. Accès cartouche GBA protégé : - Un cache amovible Game Boy Advance protège l’accès cartouche pour plus de protection ","1","https://www.cdiscount.com/pdt2/9/3/0/1/550x550/nin3700909604930/rw/console-nintendo-ds-lite-bleu-ciel.jpg"),
("1234567890123","The Legend Of Zelda : Twilight Princess","The Legend of Zelda: Twilight Princess (ゼルダの伝説 トワイライトプリンセス, Zeruda no densetsu: Towairaito purinsesu?, litt. « La légende de Zelda : La princesse du crépuscule ») est un jeu vidéo d'action-aventure développé par Nintendo EAD et édité par Nintendo, sorti sur GameCube et Wii en 2006. Il s'agit du treizième opus de la série The Legend of Zelda. Initialement annoncée pour 2005 sur GameCube au salon E3 de 2004, sa sortie est repoussée à plusieurs reprises pour peaufiner le jeu, permettant également de le sortir pour le lancement de la Wii fin 2006.","Le joueur incarne Link, un jeune fermier de 17 ans vivant dans un village appelé Toal avec ses amis. L'histoire commence réellement quand ceux-ci se font capturer par des monstres montés sur des sangliers. Link part à leur recherche en direction de la forêt de Firone et se retrouve face à un mur noir inquiétant. De l'autre côté, une partie du royaume d'Hyrule est corrompue par le Crépuscule. Un monstre emporte Link vers ce monde et essaie de l'éliminer. Le pouvoir de la Triforce du courage, détenu par Link, le transforme en loup pour se protéger. Il est fait prisonnier dans les geôles du château d'Hyrule où il rencontre Midona, une créature du Crépuscule qui le libère et le guide vers la princesse Zelda. Celle-ci raconte alors à Link comment Xanto, le roi des Ombres, a pris le contrôle du royaume d'Hyrule. Pour rendre leur lumière aux différentes régions d'Hyrule et retrouver sa forme humaine, Link doit retrouver des perles de lumière qui y sont dispersées. En parallèle, Midona l'entraîne en quête des cristaux d'Ombre, censés détenir le pouvoir de ses ancêtres et permettre de vaincre Xanto. Le royaume d'Hyrule libéré du Crépuscule et les cristaux d'Ombre récupérés, Link tombe nez-à-nez avec Xanto qui récupère les cristaux d'Ombre, maudit Link pour qu'il soit à jamais un loup et expose Midona à la lumière de l'esprit de Lanelle, ce qui l'affaiblit gravement. Link emmène Midona auprès de la princesse Zelda, qui offre son énergie vitale en sacrifice pour la sauver. Zelda révèle à Link l'existence d'une épée légendaire, cachée au sanctuaire de la forêt de Firone, capable de déchirer sa malédiction. Link retrouve sa forme humaine et Midona récupère le fragment de magie qui l'empoisonnait. Commence alors la deuxième phase de l'aventure. Grâce au fragment de magie, le joueur peut alterner selon les besoins du jeu entre sa forme humaine et sa forme animale. Midona entraîne Link dans le désert Gerudo à la recherche du miroir des Ombres, permettant de se rendre au royaume du Crépuscule. Sur place, les anciens sages veillant sur le miroir nous apprennent que Xanto n'est que le sous-fifre du Seigneur du Mal, Ganondorf, et que le miroir des Ombres a été brisé pour protéger le royaume d'Hyrule de ses agissements. Link doit retrouver les fragments du miroir éparpillés, se trouvant selon les sages « dans les hauteurs enneigées, dans une antique forêt et quelque part dans les cieux ». Link retourne ensuite reconstituer le miroir et les sages dévoilent que Midona n'est autre que la princesse du Crépuscule, maudite par Xanto. Link ouvre ensuite le passage vers le monde des Ombres, traverse le Palais du Crépuscule, bat Xanto et récupère les cristaux d'ombres. Link se prépare ensuite à affronter Ganondorf, qui a pris le contrôle du château d'Hyrule et de la princesse Zelda. Le combat final prend place au château. Après avoir triomphé, Link aperçoit la silhouette d'une jeune fille titubante au loin, qui n'est autre que Midona ayant reprise son apparence « humaine ». La scène finale montre Link, Zelda et Midona face au Miroir des Ombres, s'échangeant quelques mots d'adieux à la suite desquels Midona repart dans son royaume et détruit définitivement le miroir des Ombres, afin de couper tout lien entre le monde de la lumière et celui des ombres.","1","https://image.jeuxvideo.com/images-sm/gc/t/l/tlozgc0f.jpg"),
("4021608708359","The Legend Of Zelda : The Wind Waker","The Legend of Zelda: The Wind Waker (ou simplement The Wind Waker) est un jeu d'action-aventure développé par la division Nintendo EAD et publié par Nintendo sur GameCube le 13 décembre 2002 au Japon, puis en mars 2003 en Amérique du Nord et en mai 2003 en Europe. C'est le dixième jeu de la franchise The Legend of Zelda.","Le joueur contrôle le protagoniste Link, alors que le jeu se déroule sur un ensemble d'îles situé dans une vaste mer, lieu inédit pour la franchise. Le personnage joueur tente de sauver sa sœur du sorcier Ganon, et se retrouve impliqué dans une lutte pour sauvegarder la Triforce. Aidé par des alliés, dont la capitaine des pirates Tetra, incarnation de la princesse Zelda, et un bateau parlant appelé Lion Rouge, Link navigue sur les étendues d'eau et explore des îles où il y parcourt divers donjons labyrinthiques pour obtenir le pouvoir nécessaire pour vaincre Ganon. Le vent, qui permet la navigation, joue un rôle de premier plan dans le gameplay et peut être contrôlé grâce à la Baguette du vent. Sur l'Île de l'Aurore, Link, un descendant du « Héros du temps », célèbre le jour de ses douze ans comme il est de coutume, en s'habillant d'une tunique et d'un bonnet en l'honneur du Héros du temps. Cependant au cours des festivités, un oiseau immense survient dans le ciel, le roi Cuirasse, qui tient dans ses serres une jeune fille alors qu'il est poursuivi par un bateau de pirates. L'oiseau est obligé de lâcher sa proie, et fait tomber dans la forêt de l'île celle qui est en réalité la capitaine des pirates, Tetra. Link intervient et sauve Tetra, mais l'oiseau emporte la sœur du jeune garçon nommée Arielle, qu'il prend pour la capitaine. Tetra accepte d'aider Link à retrouver sa sœur. Link s'équipe d'une épée et d'un bouclier, avant qu'ils embarquent ensemble et se dirigent vers la Forteresse maudite. Là, il perd son armement, puis retrouve Arielle et d'autres filles kidnappées. Link y rencontre le roi Cuirasse, qui l'emmène face à un mystérieux personnage. Ce dernier le précipite vers le vaste océan, qui se réveille quelques heures plus tard sur Mercantîle, à bord d'un bateau appelé « Lion Rouge » doté de la capacité de parler. Celui-ci lui révèle que le mystérieux personnage qui commande l'oiseau est Ganondorf. Ce dernier enlève des jeunes filles, car il est à la recherche de la princesse Zelda, qui possède la Triforce de la sagesse qu'il convoite17,8,9,30. Pour le vaincre, Link doit obtenir le pouvoir du Héros du temps, grâce aux trois perles des déesses. Lion Rouge lui donne la Baguette du vent, qui permet de contrôler l'élément de l'air. Il trouve la perle de Din sur l'Île du Dragon, auprès de Valoo, l'esprit du ciel ; il obtient la perle de Farore sur l'Île aux Forêts où se situe l'arbre Mojo, l'esprit de la terre, en aidant les Korogus ; il prend possession de la perle de Nayru en passant par l'Île du Poisson, dévastée, puis sur l'île Mercantîle et finalement sur l'Île de l'Aurore pour l'obtenir auprès de Jabu. Le roi des bateaux Lion Rouge emmène ensuite Link à la Tour des dieux, où il doit surmonter des épreuves avant de descendre sous l'océan jusqu'à un château englouti, figé dans le temps. Là, Link trouve l'arme du Héros du temps, Excalibur l'Épée de légende17,8,9,31.","1","https://image.jeuxvideo.com/images-sm/gc/z/d/zdgcgc0f.jpg"),
("4250154420155","Manette Dualshock 2","La manette officielle de la Playstation 2!","Manette Dual Shock 2, compatible pour les consoles Playstation 2 des différents modèles, avec fonction de vibration en fonction des jeux et ses deux pads pour plus de précision et une exprience de jeu unique!","3","https://www.cdiscount.com/pdt2/2/6/0/1/700x700/auc6473463065260/rw/manette-type-dualshock-2-2000-playstation-2-ps2.jpg"),
("0711719102304","Carte Mémoire 8Mo","La carte mémoire officielle de la Playstation 2!","Une carte mémoire grosse capacité, officielle et compatible avec tous les modèles de Playstation 2 pour être sûr de ne pas perdre la progression sur vos jeux préférés!","3","https://www.gamecash.fr/thumbnail-600/carte-memoire-ps2-e14406.jpg"),
("0711719700005","Console Playstation 2","La console Playstation 2, modèle FAT!","Le premier modèle, le plus ancien et le plus commun, de Playstation 2! Un modèle qui aura la possibilité de brancher un disque dur pour stocker des données!","3","https://www.gamecash.fr/thumbnail-400-450/playstation-two-noire-manette-e18651.jpg"),
("0711719706403","Console Playstation 2 Slim","Une version SLIM plus petite de la fameuse Playstation 2!","Une version plus récente, et beaucoup plus compacte de votre console favorite! Elle conserve les mêmes performances, pour une taille et un poids inférieurs, et ne sera juste plus en mesure de recevoir le branchement d'un disque dur pour stocker vos données.","3","https://www.dealicash.fr/1734880-thickbox_default/console-sony-playstation-2-slim.jpg"),
("7194801354691","Action Replay Max","Un accessoire parfait pour vous débloquer dans vos jeux!","Avec cette accessoire magique, fini la galère, fini les jeux trop difficiles! Entre les nombreux codes de jeux, pré-programmés dans l'Action-Replay, et ceux que vous pourrez entrer manuellement, vous ne serez plus jamais bloquer sur un jeu!","4","https://images-na.ssl-images-amazon.com/images/I/A1PpE2M8YNL._AC_SL1500_.jpg"),
("4020628738654","PS4", "La PlayStation 4 (abrégée officiellement PS4) est une console de jeux vidéo","La PlayStation 4 (abrégée officiellement PS4) est une console de jeux vidéo de salon de huitième génération développée par Sony Computer Entertainment. ... Elle est la console tous types confondus la plus vendue de sa génération.","3","https://media.ldlc.com/r1600/ld/products/00/03/83/35/LD0003833580_2.jpg"),
("175945565095","PS4 PRO","la PlayStation 4 Pro : une PS4 beaucoup plus puissante","la PlayStation 4 Pro : une PS4 beaucoup plus puissante taillée pour l'Ultra HD et la réalité virtuelle.","3","https://images.frandroid.com/wp-content/uploads/2019/04/sony-playstation-4-pro.png"),
("7966800977418","PS4 Slim","la PlayStation 4 Slim est la version améliorée de la console","la PlayStation 4 Slim est la version améliorée de la console la plus populaire de la huitième génération. Elle conserve la même puissance et conserve son avantage devant la Xbox One et la Switch. Elle dispose d'un lecteur Blu-Ray et d'un disque dur intégré de 500 Go ou de 1 To.","3","https://www.cdiscount.com/pdt2/7/6/8/1/700x700/son0711719816768/rw/playstation-4-ps4-slim-500-go-avec-une-manette-s.jpg"),
("9998670514325","Manette PS4","DualShock est une gamme de manettes","DualShock est une gamme de manettes de jeu officielles des consoles de salon Playstation de Sony. Son nom fait référence à la présence de doubles moteurs solénoïdes, qui permettent de produire des vibrations dans le contrôleur.","3","https://static.fnac-static.com/multimedia/Images/FR/NR/39/76/7f/8353337/1540-1/tsp20160908115017/Manette-PS4-Sony-Dual-Shock-4-Noir-V2.jpg"),
("3391891979047","The Witcher 3 : Wild Hunt ","The Witcher 3 est un RPG en monde ouvert, dans un univers Fantasy hautement scénarisé où vos choix sont décisifs.","The Witcher 3 est un RPG en monde ouvert, dans un univers Fantasy hautement scénarisé où vos choix sont décisifs. Vous incarnez un tueur de monstres professionnel chargé de retrouver l'enfant de la prophétie dans un vaste monde riche en cités marchandes, cols périlleux et grottes oubliées. ","3","https://image.jeuxvideo.com/medias-sm/142247/1422469609-6846-jaquette-avant.jpg"),
("5055856412434","Dishonored 2","Incarnez Corvo ou Emily, qui se battront une fois de plus pour la justice ","Incarnez Corvo ou Emily, qui se battront une fois de plus pour la justice et la vérité et aventurez-vous dans la ville côtière exotique de Karnaca. Maîtrisez des pouvoirs surnaturels pour vous déplacer sans être vu, détruire vos ennemis, ou mêler les deux approches. ","3","https://image.jeuxvideo.com/medias-sm/146579/1465791382-7892-jaquette-avant.jpg"),
("0711719833758","Horizon : Zero Dawn","Dans cet univers post-apocalyptique vibrant et luxuriant, d'énormes créatures mécaniques parcourent les terres","Dans cet univers post-apocalyptique vibrant et luxuriant, d'énormes créatures mécaniques parcourent les terres qu'elles ont arrachées des mains de l'humanité. Vous incarnez Aloy, une chasseuse habile et curieuse qui ne compte que sur elle-même pour rester en vie et se protéger des machines. ","3","https://image.jeuxvideo.com/medias-sm/146918/1469175971-5626-jaquette-avant.jpg"),
("0711711635758","The Last of Us : Remastered","The Last of Us Remastered regroupe le jeu de base","The Last of Us Remastered regroupe le jeu de base, le DLC Left Behind et les packs de maps multijoueur Territoires Abandonnés et Territoires Récupérés. ","3","https://image.jeuxvideo.com/images-sm/jaquettes/00052332/jaquette-the-last-of-us-remastered-playstation-4-ps4-cover-avant-g-1397063678.jpg"),
("5055856415718","Dishonored : La Mort de l'Outsider","Dishonored : Death of the Outsider est un stand alone dans lequel nous incarnons Billie Lurk","Dishonored : Death of the Outsider est un stand alone dans lequel nous incarnons Billie Lurk, qui rejoint l'assassin Daud afin de mener le plus grand assassinat jamais imaginé : celui de l'Outsider. ","3","https://image.jeuxvideo.com/medias-sm/149753/1497530710-7342-jaquette-avant.jpg"),
("0711719357773","God of War ","Dans ce nouvel opus exploitant mythologie nordique, Kratos a enfin l’opportunité de canaliser la rage qui l'a si longtemps habité.","Dans ce nouvel opus exploitant mythologie nordique, Kratos a enfin l’opportunité de canaliser la rage qui l'a si longtemps habité. Inquiet du sombre héritage qu'il a transmis à son fils, Kratos espère pouvoir réparer ses fautes et effacer les horreurs de son passé. ","3","https://image.jeuxvideo.com/medias-sm/151689/1516893501-9622-jaquette-avant.jpg"),
("5026555358996","Red Dead Redemption II","Découvrez l'histoire d’Arthur Morgan et de la bande de Van der Linde","Découvrez l'histoire d’Arthur Morgan et de la bande de Van der Linde qui, lors de leur parcours à travers les vastes terres sauvages d’Amérique, n’auront d’autre choix que de piller et de se battre pour survivre.","3","https://image.jeuxvideo.com/medias-sm/152535/1525347951-3856-jaquette-avant.jpg");

INSERT INTO categories (categoryName) VALUES ("Jeu-Vidéo"),("Playstation 2"),("Console"),("Accessoire Console"),("Playstation"),("Playstation 4"),("Wii"),("Switch"),("Xbox360"),("Gamecube"),("NintendoDS"), ("WiiU");

INSERT INTO vendors (vendorName, vendorDescription) VALUES ("Dominique Lassaut","Dominique Lassaut s'engage à fournir à point fermé pour chaque client la qualité de service clientèle la plus profonde possible."),("Richard Dupond","Richard Dupond spécialiste de la vente en ligne depuis 2005. Tous les envois sont suivis. Emballage professionnel. Service client réactif."),("Philippe Leblanc","Vendeur professionnel depuis 2009, notre gamme s’étend sur le domaine des jeux vidéo, de la téléphonie et de la mobilité, la photographie, ainsi que tous les accessoires informatiques. Notre SAV gratuit et performant est une force en plus de nos prix. Nous vendons en France et à l'international."),("Simon Kuthapel","Vous mettrez la main sur le produit qui vous tente à prix réduit parmi les jeux présents dans notre boutique. Nous aimons réjouir nos consommateurs en leur permettant de faire d'importantes affaires. Vous trouverez certainement ce dont vous avez besoin grâce à nos nombreuses soldes et offres promotionnelles. Regroupez vos achats pour économiser sur les frais de port."); 

INSERT INTO products_categories (productCode, categoryNumber) VALUES ("4012927029534", "1"),("4012927029534", "2"), ("5060073303946", "1"),("5060073303946", "2"), ("0711719473428", "1"), ("0711719473428", "2"), ("0711719116615", "1"), ("0711719116615", "2"), ("0711719468721", "1"), ("0711719468721", "2"), ("0710425395741", "1"), ("0710425395741", "9"),
("1803390191678", "1"), ("1803390191678", "9"),
("4309859793293", "1"), ("4309859793293", "9"),
("1989455238880", "1"), ("1989455238880", "9"),
("9000460549969", "1"), ("9000460549969", "9"),
("8835461460376", "1"), ("8835461460376", "9"),
("1826238223328", "1"), ("1826238223328", "9"),
("5256198950692", "4"), ("5256198950692", "9"),
("4991723863832", "3"), ("4991723863832", "9"),
("7062498777153", "3"), ("7062498777153", "9"),
("4694294223076", "4"), ("4694294223076", "9"),
("4020628738655", "3"), ("4020628738655", "10"),
("4021628738655", "3"), ("4021628738655", "7"),
("4021628738355", "3"), ("4021628738355", "8"),
("4021608738355", "3"), ("4021608738355", "12"),
("4021608738351", "3"), ("4021608738351", "11"),
("1234567890123", "1"), ("1234567890123", "10"),
("4021608708359", "1"), ("4021608708359", "10"),
("4250154420155", "4"), ("4250154420155", "2"),
("0711719102304", "4"), ("0711719102304", "2"),
("0711719700005", "3"), ("0711719700005", "2"),
("0711719706403", "3"), ("0711719706403", "2"),
("7194801354691", "4"), ("7194801354691", "2"),
("4020628738654", "3"), ("4020628738654", "6"),
("175945565095", "3"), ("175945565095", "6"),
("7966800977418", "3"), ("7966800977418", "6"),
("9998670514325", "4"), ("9998670514325", "6"),
("3391891979047", "1"), ("3391891979047", "6"),
("5055856412434", "1"), ("5055856412434", "6"),
("0711719833758", "1"), ("0711719833758", "6"),
("0711711635758", "1"), ("0711711635758", "6"),
("5055856415718", "1"), ("5055856415718", "6"),
("0711719357773", "1"), ("0711719357773", "6"),
("5026555358996", "1"), ("5026555358996", "6");


INSERT INTO products_vendors (productCode, vendorCode, priceHT, shippingHT, stock) VALUES 
("4012927029534", "2", "20", "3.99", "125"),
("4012927029534", "3", "20", "3.99", "121"),

("1803390191678", "1", "20", "3.99", "125"),
("1803390191678", "3", "20", "3.99", "125"),
("1803390191678", "4", "20", "3.99", "125"),

("5060073303946", "1", "20", "3.99", "122"),
("5060073303946", "4", "20", "3.99", "122"),
("5060073303946", "2", "20", "3.99", "122"),

("0711719473428", "1", "20", "3.99", "111"),
("0711719473428", "4", "20", "3.99", "111"),

("0711719116615", "1", "20", "3.99", "59"),
("0711719116615", "3", "20", "3.99", "59"),
("0711719116615", "4", "20", "3.99", "59"),

("0711719468721", "1", "20", "3.99", "59"),
("0711719468721", "3", "20", "3.99", "59"),
("0711719468721", "4", "20", "3.99", "59"),


("4250154420155", "1", "30", "3.99", "99"),
("4250154420155", "2", "30", "3.99", "99"),
("4250154420155", "3", "30", "3.99", "99"),

("0711719102304", "1", "5", "3.99", "11002"),
("0711719102304", "4", "5", "3.99", "11002"),

("0711719706403", "1", "99", "3.99", "1225"),

("0710425395741", "2", "40", "3.99", "114"),
("0710425395741", "1", "40", "3.99", "114"),
("0710425395741", "4", "40", "3.99", "114"),

("4309859793293", "2", "20", "3.99", "115"),
("4309859793293", "1", "20", "3.99", "115"),

("1989455238880", "2", "20", "3.99", "125"),
("1989455238880", "3", "20", "3.99", "125"),
("1989455238880", "1", "20", "3.99", "125"),

("9000460549969", "2", "40", "3.99", "125"),

("8835461460376", "2", "30", "3.99", "125"),


("1826238223328", "2", "40", "3.99", "120"),
("1826238223328", "1", "40", "3.99", "120"),



("5256198950692", "2", "40", "3.99", "1115"),
("5256198950692", "1", "40", "3.99", "1115"),

("4991723863832", "2", "250", "3.99", "1255"),
("4991723863832", "4", "250", "3.99", "1255"),

("7062498777153", "2", "270", "3.99", "1825"),
("7062498777153", "1", "270", "3.99", "1825"),
("7062498777153", "3", "270", "3.99", "1825"),
("7062498777153", "4", "270", "3.99", "1825"),

("4021628738655", "3", "99", "3.99", "415"),
("4021628738655", "1", "99", "3.99", "415"),

("4021608738355", "3", "199", "3.99", "13325"),
("4021608738355", "1", "199", "3.99", "13325"),
("4021608738355", "2", "199", "3.99", "13325"),

("4021608738351", "3", "120", "3.99", "1115"),

("1234567890123", "3", "20", "3.99", "5"),

("4020628738654", "4", "299", "3.99", "1235"),
("4020628738654", "1", "299", "3.99", "1235"),
("4020628738654", "2", "299", "3.99", "1235"),

("175945565095", "4", "340", "3.99", "1125"),
("175945565095", "1", "340", "3.99", "1125"),
("175945565095", "2", "340", "3.99", "1125"),
("175945565095", "3", "340", "3.99", "1125"),

("7966800977418", "4", "400", "3.99", "1255"),
("7966800977418", "1", "400", "3.99", "1255"),

("3391891979047", "4", "40", "3.99", "3425"),

("5055856412434", "4", "40", "3.99", "425"),

("0711711635758", "1", "40", "3.99", "6625"),
("0711711635758", "2", "40", "3.99", "6625"),
("0711711635758", "3", "40", "3.99", "6625"),
("0711711635758", "4", "40", "3.99", "6625"),

("5055856415718", "4", "40", "3.99", "1125"),
("5055856415718", "2", "40", "3.99", "1125"),
("5055856415718", "1", "40", "3.99", "1125"),

("0711719357773", "4", "40", "3.99", "3125"),
("0711719357773", "1", "40", "3.99", "3125"),

("5026555358996", "4", "40", "3.99", "5"),
("5026555358996", "3", "40", "3.99", "5"),


("4694294223076", "4", "40", "3.99", "5"),
("4694294223076", "3", "40", "3.99", "5"),


("4020628738655", "1", "99", "3.99", "5"),
("4020628738655", "3", "99", "3.99", "5"),

("4021628738355", "4", "250", "3.99", "5"),
("4021628738355", "1", "250", "3.99", "5"),

("4021608708359", "4", "40", "3.99", "5"),
("4021608708359", "3", "40", "3.99", "5"),

("7194801354691", "4", "40", "3.99", "5"),
("7194801354691", "3", "40", "3.99", "5"),


("0711719706403", "4", "40", "3.99", "5"),
("0711719706403", "3", "40", "3.99", "5"),


("9998670514325", "4", "40", "3.99", "5"),
("9998670514325", "3", "40", "3.99", "5"),

("0711719700005", "4", "89", "3.99", "5"),
("0711719700005", "3", "89", "3.99", "5"),

("0711719833758", "4", "40", "3.99", "5"),
("0711719833758", "3", "40", "3.99", "5");

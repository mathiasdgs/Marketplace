## Projet réalisé au cours de la formation Simplon.co de développeur Web et Web Mobile, par :

- [Atilla Kahraman](https://github.com/atillakah), 
- [Mathias Danglades](https://github.com/mathiasdgs),
- [Thomas Champromis](https://github.com/thomaschampromis)
- et [Thibault Camuset](https://github.com/Thibault-Camuset). 

*Petit projet de site, contenant une page de type "Marketplace", connectée à une base de données contenant des produits, des vendeurs, des marques et des catégories de produits, codé en PHP et avec donc, une partie base de données en MySQL.*


- Version en ligne: (A venir)

- MCD: https://lucid.app/lucidchart/71d7886d-d70f-4e28-9689-78acd7112382/view
- MPD: https://app.lucidchart.com/lucidchart/bb2293d0-c664-441e-9f33-4af00873c07e/view


- Wireframe: https://www.figma.com/file/I1TtHSprO5vazVw9oPpDLb/MarketPlace?node-id=0%3A1
- Maquette: https://www.figma.com/file/I1TtHSprO5vazVw9oPpDLb/MarketPlace?node-id=79%3A2


- Gestion de projet: https://trello.com/b/eaFXx17E/projet-simplon-marketplace

---

### Consignes d'utilisation:

- Importer le dump dans PHPmyadmin pour créer la base de données (bien penser a désactiver la vérification des clé étrangères)
- Si besoin est, changer le nom d'utilisateur/mot de passe dans le fichier config.inc.php pour pouvoir se connecter à la base de données.
- Déposer tous les fichiers du répository dans un dossier, et l'ouvrir avec le localhost de votre navigateur.
- Enjoy!

---

### Les consignes principales à respecter étant:

- Un prototype de catalogue de produits, avec accès aux fiches de produits détaillées.
- Une base de données qui contiendra les produits, leurs catégories, les marques et les vendeurs (fournir le MCD, MPD, et le dump de la BDD).

Spécificitées de la BDD:

- Un produit peux avoir plusieurs catégories.
- Un produit n'a qu'une seule marque.
- Un produit doit être caractérisé par : son code ean13, son nom, une description courte, une description longue, un prix de vente HT, un prix d'envoi HT, un stock.
- Un produit peut être vendu par plusieurs vendeurs. Le prix HT, les frais de ports HT et leur stock leur est propre.

*(Facultatif/Bonus):*
- Affichage d'un visuel pour chaque produit
- Mise en place d'une pagination sur la page des produits

### L'équipe devra respecter, et avancer selon plusieurs étapes:

- Partie 1 : Organisation (partie gestion de projet, ici, sous Trello)

- Partie 2 : Partie BDD (avant tout conception MCD, MPD, puis créer la base de données)

- Partie 3 : Prototype du site, (maquette + wireframe)

- Partie 4 : Back-End (interface qui lie le site à la base de données, possibilité d'ajouter, modifier, supprimer et visualiser pour chaque élements de la table, donc produits, marques, catégories et vendeurs. A faire en mode défensif, avec les vérifications).

- Partie 5 : Front-End (Lister les produits sur le site, afficher les détails quand l'utilisateur clique dessus).

---

"Putin, j'ai envie de bouffer des pates aux crevettes!" Atilla Kahraman.

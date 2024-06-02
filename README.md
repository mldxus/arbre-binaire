# arbre binaire
Projet : L2 Informatique — Semestre 2, Université d’Orléans

- Objectif :
Concevoir une structure de données représentant un tableau d'entiers sous forme d'arbre binaire pour répondre à diverses requêtes (somme, maximum, etc.).

- Primitives :
create : Initialiser la structure avec une liste d'entiers.
update : Mettre à jour une valeur dans le tableau.
query : Réaliser une requête sur un intervalle du tableau.

- Modules :
NodeSum : Somme des éléments d'un intervalle.
NodeMaxOcc : Valeur maximum et son nombre d'occurrences.
NodeMaxSubseg : Plus grande somme d'éléments contigus dans un intervalle.

# Programmation fonctionnelle - Devoir de programmation 2024

Pour installer les paquets dont le projet a besoin :

`opam install . --deps-only --with-doc --with-test`

Pour compiler le projet :

`dune build`

Pour lancer les tests :

`dune test`

Pour exécuter le projet :

`dune exec devoir_de_programmation`

Pour exécuter le projet avec des arguments de ligne de commande :

`dune exec devoir_de_programmation -- les arguments de ligne de commande`

Exemple :

`dune exec devoir_de_programmation -- -data "1 2 3 2" -problem maxocc -print -query 0 1 -query 0 3 -update 3 0 -print -query 0 3`

devrait donner l'affichage suivant :

```
(1, 1) (2, 1) (3, 1) (2, 1)        
(2, 1)
(3, 1)
input[0]=3
(3, 1) (2, 1) (3, 1) (2, 1) 
(3, 2)
```

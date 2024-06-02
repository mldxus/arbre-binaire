
type data = int
type answer = int  (* Implémentation concrète de 'answer' comme un entier *)
type node = {
  answer : answer;  (* Ce champ contiendra la somme des éléments dans l'intervalle *)
  left : int;       (* Borne gauche de l'intervalle *)
  right : int;      (* Borne droite de l'intervalle *)
}

(* Création d’une réponse à partir d'une unique valeur *)
let create : data -> answer = fun data ->
  data  (* Pour une feuille, la réponse est simplement la valeur elle-même *)

(* Combinaison de deux noeuds pour former un noeud parent *)
let combine a b = {
  answer = a.answer + b.answer;  (* La réponse est la somme des réponses des enfants *)
  left = a.left;                 (* La borne gauche du parent est celle du fils gauche *)
  right = b.right;               (* La borne droite du parent est celle du fils droit *)
}

(* Conversion de 'answer' (somme des éléments) en chaîne de caractères *)
let to_string answer =
  string_of_int answer 
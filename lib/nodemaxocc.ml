type data = int
type answer = int * int  (* (max_value, count) *)
type node = {
  answer : answer;  (* Contient la valeur max et son nombre d'occurrences *)
  left : int;       (* Indice gauche de l'intervalle couvert par le noeud *)
  right : int;      (* Indice droit de l'intervalle couvert par le noeud *)
}

(* Crée une réponse à partir d'une donnée unique, qui est un élément du tableau *)
let create : data -> answer = fun data ->
  (data, 1)  (* La valeur maximale est 'data', et elle apparaît une fois *)

(* Combinaison de deux noeuds pour en former un nouveau *)
let combine : node -> node-> node = fun a b ->
  let (max_a, count_a) = a.answer in
  let (max_b, count_b) = b.answer in
  if max_a > max_b then
    { answer = (max_a, count_a); left = a.left;right = b.right }  (* 'a' a la valeur maximale plus grande *)
  else if max_a < max_b then
    { answer = (max_b, count_b); left = a.left;right = b.right }  (* 'b' a la valeur maximale plus grande *)
  else
    { answer = (max_a, count_a + count_b); left = a.left;right = b.right }  (* Les maximaux sont égaux, additionner les occurrences *)

(* Conversion d'une 'answer' en chaîne de caractères pour l'affichage *)
let to_string (max_value, count) : string =
  Printf.sprintf "(%d, %d)" max_value count
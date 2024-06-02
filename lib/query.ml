open Sig 

module Make (N : NODE) : QUERY_STRUCTURE = struct
  type tree = N.node binary_tree
  type data = int
  type answer = N.answer

  let to_string = N.to_string

  let rec create : data list -> tree = fun lst -> 
    let rec aux lst left right =
      if left = right then
        let rep : N.node = { answer = N.create (List.nth lst left); left; right } in
        Leaf { node = rep }
      else
        let mid = (left + right) / 2 in
        let left_child = aux lst left mid in
        let right_child = aux lst (mid + 1) right in
        Node { node = N.combine (get_node left_child) (get_node right_child); left_child; right_child }
    in aux lst 0 (List.length lst - 1)

  and get_node = function
    | Leaf { node } | Node { node; _ } -> node

  let rec update : tree -> data -> int -> tree = fun tree data idx ->
    match tree with
    | Leaf { node } when node.left = idx && node.right = idx ->
      Leaf { node = { node with answer = N.create data } }
    | Node { node; left_child; right_child } ->
      let mid = (node.left + node.right) / 2 in
      if idx <= mid then
        let updated_left = update left_child data idx in
        Node { node = N.combine (get_node updated_left) (get_node right_child); left_child = updated_left; right_child }
      else
        let updated_right = update right_child data idx in
        Node { node = N.combine (get_node left_child) (get_node updated_right); left_child; right_child = updated_right }
    | _ -> Leaf { node = { answer = N.create 0 ; left = 0 ; right = 0 } }

  let combine_answers : answer -> answer -> answer= fun a b ->
    (N.combine { answer = a; left = 0; right = 0 } { answer = b; left = 0; right = 0 }).answer

  let rec query : tree -> int -> int -> answer=  fun tree l r ->
    match tree with
    | Leaf { node } when node.left = l && node.right = r -> node.answer
    | Node { node; left_child; right_child } ->
      if l <= node.left && node.right <= r then node.answer
      else combine_answers (query left_child l r) (query right_child l r)
    | _ -> N.create 0
end


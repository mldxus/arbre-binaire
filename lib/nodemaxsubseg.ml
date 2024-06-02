type data = int
type answer = { sum : int; prefix : int; suffix : int; subseg : int }
type node = { answer : answer; left : int; right : int }

let create : data -> answer = 
 fun data -> 
  let value = max 0 data in  (* On ne prend en compte que les valeurs positives ou 0 *)
  { 
    sum = data; 
    prefix = value; 
    suffix = value; 
    subseg = value 
  }

  let combine : node -> node -> node =
    fun n1 n2 ->
     let left = n1.left in
     let right = n2.right in
     let sum = n1.answer.sum + n2.answer.sum in
     let prefix = max n1.answer.prefix (n1.answer.sum + n2.answer.prefix) in
     let suffix = max n2.answer.suffix (n2.answer.sum + n1.answer.suffix) in
     let subseg = max (max n1.answer.subseg n2.answer.subseg) (n1.answer.suffix + n2.answer.prefix) in
     {
       answer = { sum; prefix; suffix; subseg }; 
       left;
       right;
     }
   

let to_string : answer -> string = 
 fun a ->
  Printf.sprintf "%d" a.subseg
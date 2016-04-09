open WorldObject
open WorldObjectI

(* ### Part 2 Movement ### *)
let bee_inverse_speed = Some 1

(* ### Part 3 Actions ### *)
let max_pollen_types = 5

(* ### Part 4 Aging ### *)
let bee_lifetime = 1000

(* ### Part 5 Smart Bees ### *)
let max_sensing_range = 5

(** Bees travel the world searching for honey.  They are able to sense flowers
    within close range, and they will return to the hive once they have
    pollenated enough species of flowers. *)
class bee p : world_object_i =
object (self)
  inherit world_object p as super

  (******************************)
  (***** Instance Variables *****)
  (******************************)

  (* ### Part 3 Actions ### *)
  val mutable pollen = []

  (* ### TODO: Part 5 Smart Bees ### *)

  (* ### TODO: Part 6 Custom Events ### *)

  (***********************)
  (***** Initializer *****)
  (***********************)

  (* ### TODO: Part 3 Actions ### *)

  (* ### TODO: Part 6 Custom Events ### *)

  (**************************)
  (***** Event Handlers *****)
  (**************************)

  method private do_action : unit =
    let neighbors = World.get self#get_pos in
    List.iter self#deposit_pollen neighbors ;
    List.iter self#extract_pollen neighbors
  (* ### TODO: Part 6 Custom Events ### *)


  (* ### TODO: Part 6 Custom Events ### *)

  (**************************)
  (***** Helper Methods *****)
  (**************************)

  (* ### Part 3 Actions ### *)
  method private deposit_pollen (o:world_object_i) : unit =
    let pollen' = o#receive_pollen pollen in
    pollen <- pollen'

  method private extract_pollen (o:world_object_i) : unit =
    match o#forfeit_pollen with
    | None -> ()
    | Some i -> pollen <- i::pollen


  (* ### TODO: Part 5 Smart Bees ### *)

  (********************************)
  (***** WorldObjectI Methods *****)
  (********************************)

  (* ### TODO: Part 1 Basic ### *)
(*
  method get_name = raise TODO

  (* ### TODO: Part 4 Aging ### *)
  method draw = raise TODO

  method draw_z_axis = raise TODO
*)

  (***************************)
  (***** Movable Methods *****)
  (***************************)

  (* ### TODO: Part 2 Movement ### *)
(*
  method next_direction = raise TODO
*)

  (* ### TODO: Part 5 Smart Bees ### *)

  (* ### TODO: Part 6 Custom Events ### *)

  (***********************)
  (***** Bee Methods *****)
  (***********************)

  (* ### TODO: Part 5 Smart Bees ### *)

end

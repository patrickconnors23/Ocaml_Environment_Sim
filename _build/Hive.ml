open WEvent
open WorldObject
open WorldObjectI

(* ### Part 3 Actions ### *)
let starting_pollen = 500
let cost_of_bee = 10
let spawn_probability = 20
let pollen_probability = 50
let max_pollen_deposit = 3

(** A hive will spawn bees and serve as a deposit point for the pollen that bees
    harvest.  It is possible to steal honey from a hive, however the hive will
    signal that it is in danger and its loyal bees will become angry. *)
class hive p : world_object_i =
object (self)
  inherit world_object p as super

  (******************************)
  (***** Instance Variables *****)
  (******************************)

  (* ### Part 3 Actions ### *)
  val mutable pollen = starting_pollen


  (* ### TODO: Part 6 Custom Events ### *)

  (***********************)
  (***** Initializer *****)
  (***********************)

  (* ### Part 3 Actions ### *)
  initializer
    self#register_handler World.action_event (fun () -> self#do_action)


  (**************************)
  (***** Event Handlers *****)
  (**************************)

  (* ### Part 3 Actions ### *)
  (* ### TODO: Part 4 Aging ### *)
  method private do_action =
    Helpers.with_inv_probability World.rand pollen_probability
      begin fun () ->
        pollen <- pollen + 1
      end;
    if pollen >= cost_of_bee then
      Helpers.with_inv_probability World.rand spawn_probability
        begin fun () ->
          pollen <- pollen - cost_of_bee ;
        end

  (* ### TODO: Part 4 Aging ### *)

  (**************************)
  (***** Helper Methods *****)
  (**************************)

  (* ### TODO: Part 4 Aging ### *)

  (* ### TODO: Part 5 Smart Bees ### *)

  (****************************)
  (*** WorldObjectI Methods ***)
  (****************************)

  (* ### TODO: Part 1 Basic ### *)
(*
  method get_name = raise TODO

  method draw = raise TODO

  method draw_z_axis = raise TODO
*)

  (* ### Part 3 Actions ### *)
  (* ### Part 6 Custom Events *)
  method receive_pollen ps =
    pollen <- pollen + (min (List.length ps) max_pollen_deposit) ;
    []

  (* ### TODO: Part 6 Custom Events ### *)

  (************************)
  (***** Hive Methods *****)
  (************************)

  (* ### Part 3 Actions ### *)
  method private forfeit_honey n b =
    let stolen = min pollen n in
    pollen <- pollen - stolen ;
    self#danger b ;
    stolen

  (* ### TODO: Part 6 Custom Events ### *)

end

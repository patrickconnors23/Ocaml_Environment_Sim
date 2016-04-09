open WorldObject
open WorldObjectI

(* ### Part 2 Movement ### *)
let cow_inverse_speed = Some 1

(* ### Part 6 Custom Events ### *)
let max_consumed_objects = 100

(** Cows will graze across the field until it has consumed a satisfactory number
    of flowers *)
class cow p : world_object_i =
object (self)
  inherit world_object p as super

  (******************************)
  (***** Instance Variables *****)
  (******************************)

  (* ### Part 3 Actions ### *)
  val mutable consumed_objects = 0


  (***********************)
  (***** Initializer *****)
  (***********************)

  (* ### TODO: Part 3 Actions ### *)


  (**************************)
  (***** Event Handlers *****)
  (**************************)

  (* ### Part 3 Actions ### *)
  method private do_action =
    if consumed_objects < max_consumed_objects then
      let neighbors = World.get self#get_pos in
      List.iter begin fun o -> match o#smells_like_pollen with
        | Some _ -> print_string "*nom* " ; flush_all () ;
          o#die ;
          consumed_objects <- consumed_objects + 1
        | None -> ()
      end neighbors
  (* ### TODO: Part 6 Custom Events ### *)


  (********************************)
  (***** WorldObjectI Methods *****)
  (********************************)

  (* ### TODO: Part 1 Basic ### *)
(*
  method get_name = raise TODO

  method draw = raise TODO

  method draw_z_axis = raise TODO
*)

  (* ### TODO: Part 3 Actions ### *)

  (***************************)
  (***** Movable Methods *****)
  (***************************)

  (* ### TODO: Part 2 Movement ### *)
(*
  method next_direction = raise TODO
*)

  (* ### TODO: Part 6 Custom Events ### *)

end

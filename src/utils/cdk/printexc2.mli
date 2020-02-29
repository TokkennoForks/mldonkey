(* Copyright 2001, 2002 b8_bavard, b8_fee_carabine, INRIA *)
(*
    This file is part of mldonkey.

    mldonkey is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    mldonkey is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with mldonkey; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*)

(* Module [Printexc2]: facilities for printing exceptions *)

val to_string : exn -> string
(** [Printexc2.to_string e] returns a string representation of the exception [e]. *)

val catch : string -> ('a -> unit) -> 'a -> unit
val catch2 : string -> ('a -> 'b -> unit) -> 'a -> 'b -> unit
(** [catch msg f x] executes the function [f] and returns unit. If an 
    exception is raised during the execution of [f], the message [msg] is 
    printed on standard output with the exception using [printexn], and unit
    is returned. *)

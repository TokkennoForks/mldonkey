(* Copyright 2006 *)
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

module type SUI = sig
  val create_key : unit -> string
  val load_key : string -> string
  val create_signature : string -> int -> int64 -> int -> int64 -> string
  val verify_signature : string -> int -> string -> int -> int64 -> int -> int64 -> bool
end

module SUI : SUI = struct
  external create_key : unit -> string = "ml_createKey"
  external load_key : string -> string = "ml_loadKey"
  external create_signature : string -> int -> int64 -> int -> int64 -> string = "ml_createSignature"
  external verify_signature : string -> int -> string -> int -> int64 -> int -> int64 -> bool = "ml_verifySignature_bytecode" "ml_verifySignature"
end

let ext_lprintf_nl msg verb = 
  if !CommonOptions.verbose_unexpected_messages || not verb then Printf2.lprintf_nl ("%s") msg

let _ = Callback.register "ml_lprintf_nl" ext_lprintf_nl

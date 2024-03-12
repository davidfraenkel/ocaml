{
open Lexing
open Ast
open Parser

exception Lexing_error of string


  let kwd_tbl =
    ["for", FOR;
     "to", TO;
    ]

   let id_or_kwd =
    let h = Hashtbl.create 17 in
    List.iter (fun (s,t) -> Hashtbl.add h s t) kwd_tbl;
    fun s ->
      let s = String.lowercase_ascii s in
      try List.assoc s kwd_tbl with _ -> IDENT s
}


let letter = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']
let ident = (letter | '_') (letter | digit | '_')*
let integer = '0' | ['1'-'9'] digit*

rule token = parse
  | [' ' '\t']                 { token lexbuf }  (* Ignore white spaces *)
  | ident as id                { print_endline ("Identifier: " ^ id); id_or_kwd id }
  | '='                        { print_endline "Equal"; EQUAL }
  | integer as s                { CST (Cint(int_of_string s)) }
  | eof                        { print_endline "eof"; EOF }
  | _ as c  { raise (Lexing_error ("illegal character: " ^ String.make 1 c)) }

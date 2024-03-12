
(* The type of tokens. *)

type token = 
  | TO
  | IDENT of (string)
  | FOR
  | EQUAL
  | EOF
  | CST of (Ast.constant)

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.stmt)

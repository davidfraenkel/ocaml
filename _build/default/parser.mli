
(* The type of tokens. *)

type token = 
  | TO
  | INT of (int)
  | ID of (string)
  | FOR
  | EQUAL
  | EOF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)

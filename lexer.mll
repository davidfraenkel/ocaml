{
open Parser
open Lexing
exception Error of string
}


rule token = parse
  | [' ' '\t']                 { token lexbuf }  (* Ignore white spaces *)
  | "for"                      { FOR }
  | "to"                       { TO }
  | '='                        { EQUAL }
  | ['0'-'9']+ as num         { INT(int_of_string num) }
  | ['a'-'z' 'A'-'Z']+ as id   { ID(id) }
  | eof                        { EOF }
  | _                          { raise (Error "Lexer error") } (* Raise lexer error *)

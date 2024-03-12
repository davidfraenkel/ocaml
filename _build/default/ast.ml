type location = Lexing.position * Lexing.position

type ident = { loc: location; id: string; }

type binop = Blt

type constant =
  | Cnone
  | Cstring of string
  | Cint of int

type expr =
  | Ecst of constant
  | Eident of ident
  
  type stmt =
  | Sfor of ident * expr * expr

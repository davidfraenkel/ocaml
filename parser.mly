%{
  open Ast
%}

%token <Ast.constant> CST
%token EOF FOR TO EQUAL
%token <string> IDENT
%start main
%type <Ast.stmt> main
%%

main:
  | stmt EOF { $1 }
  ;

expr:
  | c = CST 
  { Ecst c }
  | id = ident
    { Eident id }
  ;

stmt:
  | FOR id = ident EQUAL expr TO expr {
      Sfor(id, $4, $6)
    }
  ;

ident:
  id = IDENT { { loc = ($startpos, $endpos); id } }
;

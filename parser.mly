%{
  open Ast
%}

%token EOF FOR TO EQUAL
%token <int> INT
%token <string> ID
%start main
%type <Ast.expr> main

%%

main:
  | stmt EOF { $1 }
  ;

stmt:
  | FOR ID EQUAL INT TO INT {
      For($2, $4, $6)
    }
  ;

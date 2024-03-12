open Printf
open Ast
open Lexer
open Parser
open Lexing
open Parsing

let rec eval_expr expr = 
  match expr with
  | Ecst (Cint i) -> i
  | _ -> failwith "Cannot evaluate non-integer expression"

  let interpret ast =
    match ast with
    | Sfor(ident, start_val, end_val) ->
        let start_val_int = eval_expr start_val in
        let end_val_int = eval_expr end_val in
        Printf.sprintf "for %s in range(%d, %d):" ident.id start_val_int end_val_int
    

  let _ =
    let filename = "for.txt" in
    try
      let channel = open_in filename in
      let lexbuf = Lexing.from_channel channel in
      let ast = Parser.main Lexer.token lexbuf in
      let result = interpret ast in
      close_in channel;
      let out_channel = open_out "for_result.txt" in
      fprintf out_channel "%s\n" result;
      close_out out_channel;
      printf "Successfully interpreted and wrote the result to for_result.txt\n"
    with
    | Sys_error msg ->
        printf "Error: %s\n" msg
    | Lexer.Lexing_error msg ->
        printf "Lexer error: %s\n" msg
    | Parser.Error ->
          let curr_token = symbol_start_pos () in
          let curr_line = curr_token.pos_lnum in
          let curr_col = curr_token.pos_cnum - curr_token.pos_bol in
          let error_msg = Printf.sprintf "Parser error: syntax error at line %d, column %d\n" curr_line curr_col in
          printf "%s" error_msg
    | End_of_file ->
        printf "End of file\n"
  
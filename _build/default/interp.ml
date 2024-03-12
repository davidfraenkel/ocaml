open Printf
open Ast
open Lexer
open Parser

let interpret ast =
  match ast with
  | For(var, start_val, end_val) ->
      Printf.sprintf "for %s = %d < %d" var start_val end_val

let _ =
  let filename = "for.txt" in
  let channel = open_in filename in
  try
    let lexbuf = Lexing.from_channel channel in
    let ast = Parser.main Lexer.token lexbuf in
    let result = interpret ast in
    close_in channel;
    let out_channel = open_out "for_result.txt" in
    fprintf out_channel "%s\n" result;
    close_out out_channel;
    printf "Successfully interpreted and wrote the result to for_result.txt\n"
  with
  | Lexer.Error msg ->
      close_in channel;
      printf "Lexer error: %s\n" msg
  | Parser.Error ->
      close_in channel;
      printf "Parser error\n"
  | End_of_file ->
      close_in channel;
      printf "End of file\n"

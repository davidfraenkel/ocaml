
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TO
    | INT of (
# 6 "parser.mly"
       (int)
# 16 "parser.ml"
  )
    | ID of (
# 7 "parser.mly"
       (string)
# 21 "parser.ml"
  )
    | FOR
    | EQUAL
    | EOF
  
end

include MenhirBasics

# 1 "parser.mly"
  
  open Ast

# 35 "parser.ml"

type ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Ast.expr) [@@unboxed]

let _menhir_action_1 =
  fun _1 ->
    (
# 14 "parser.mly"
             ( _1 )
# 47 "parser.ml"
     : (Ast.expr))

let _menhir_action_2 =
  fun _2 _4 _6 ->
    (
# 18 "parser.mly"
                            (
      For(_2, _4, _6)
    )
# 57 "parser.ml"
     : (Ast.expr))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | FOR ->
        "FOR"
    | ID _ ->
        "ID"
    | INT _ ->
        "INT"
    | TO ->
        "TO"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | FOR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | EQUAL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | INT _v_0 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | TO ->
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          (match (_tok : MenhirBasics.token) with
                          | INT _v_1 ->
                              let _tok = _menhir_lexer _menhir_lexbuf in
                              let (_6, _4, _2) = (_v_1, _v_0, _v) in
                              let _v = _menhir_action_2 _2 _4 _6 in
                              (match (_tok : MenhirBasics.token) with
                              | EOF ->
                                  let _1 = _v in
                                  let _v = _menhir_action_1 _1 in
                                  MenhirBox_main _v
                              | _ ->
                                  _eRR ())
                          | _ ->
                              _eRR ())
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

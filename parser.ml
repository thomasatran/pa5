open Sexplib.Sexp
module Sexp = Sexplib.Sexp
open Expr
open Printf


let boa_max = int_of_float(2.**62.) - 1;;
let boa_min = -int_of_float(2.**62.);;
let valid_id_regex = Str.regexp "[a-zA-Z][a-zA-Z0-9]*"
let number_regex = Str.regexp "^[+-]?[0-9]+"
let reserved_words = ["let"; "add1"; "sub1"; "isNum"; "isBool"; "if"; "set"; "while"; "def"; "print"]
let reserved_constants = ["true"; "false"; ]
let int_of_string_opt s =
  try Some(int_of_string s) with
  | _ -> None
  let parse_typ t = 
    (match t with 
    |"Num" -> TNum
    |"Bool" -> TBool
    |"Tup" -> TTup
    | _ -> failwith "type error")
  let rec parse_args a = 
    (match a with 
    |[]-> []
    |Atom(name)::Atom(":")::Atom(typ)::expr -> (name, parse_typ typ)::(parse_args expr)
    |_ -> failwith "Invalid"
    )


    
let rec parse (sexp : Sexp.t) =
  (match sexp with 
  |Atom("true") -> EBool(true)
  |Atom("false") -> EBool(false)
  |Atom(s) ->  if ((Str.string_match (valid_id_regex) (s) (0))) then
                        (match (s) with
                        | "let" -> failwith "Invalid"
                        | "set" -> failwith "Invalid"
                        | "while" -> failwith "Invalid"
                        | "print" -> failwith "Invalid"
                        | "add1"-> failwith "Invalid"
                        | "sub1"-> failwith "Invalid"
                        | "isNum"-> failwith "Invalid"
                        | "isBool"-> failwith "Invalid"
                        | "get" -> failwith "Invalid"
                        | "if"-> failwith "Invalid"
                        | "*" -> failwith "Invalid"
                        | "-" -> failwith "Invalid"
                        | "+" -> failwith "Invalid"
                        | _ ->  EId(s))
               else
                       if((Str.string_match (number_regex) (s) (0))) then
                        (match (int_of_string_opt s) with
                        | Some(x) ->  ENumber(x)
                        | None -> failwith "Non-representable number"
                                )
                       else 
                               failwith (sprintf "unknown %s" (s))
                               (* failwith "Not a valid number" *)
  |List(sexps) -> 
        (match sexps with
        |[Atom("print"); args]-> EPrim1(Print, parse args)
        |[Atom("sub1");args] -> EPrim1(Sub1, parse args)
        |[Atom("add1");args] -> EPrim1(Add1, parse args)
        |[Atom("isNull");args]-> EPrim1(IsNull, parse args)
        |Atom("while")::e1::args-> EWhile((parse e1), (List.map (parse) (args)))
        |[Atom("isNum");args] -> EPrim1(IsNum, parse args)
        |[Atom("isBool");args] -> EPrim1(IsBool, parse args)
        |[Atom("+");arg1;arg2] -> EPrim2(Plus, parse arg1, parse arg2)
        |[Atom("-");arg1;arg2] -> EPrim2(Minus, parse arg1, parse arg2)
        |[Atom("*");arg1;arg2] -> EPrim2(Times, parse arg1, parse arg2)
        |[Atom("<");arg1;arg2] -> EPrim2(Less, parse arg1, parse arg2)
        |[Atom(">");arg1;arg2] -> EPrim2(Greater, parse arg1, parse arg2)
        |[Atom("==");arg1;arg2] -> EPrim2(Equal, parse arg1, parse arg2)
        |[Atom("if");e1;  e2; e3] -> EIf(parse e1, parse e2, parse e3)
        |[Atom("get"); e1; e2] -> EGet(parse e1, parse e2)
        |[Atom("update"); e1; e2;e3] -> EUpdate(parse e1, parse e2, parse e3)
        |[Atom("set"); Atom(e1); e2] -> ESet(e1, (parse e2)) 
        |[Atom("null"); Atom(typ)] -> ENull(parse_typ typ)
        |Atom("let")::List(e1)::exprs -> ELet((List.map (parse_binding) (e1)), (List.map (parse) (exprs)))
        |Atom("tuple")::exprs ->  ETup(List.map (parse) (exprs))
        |Atom(s)::exprs -> (match s with 
                        | "get" -> failwith "Invalid"
                        | "let" -> failwith "Invalid"
                        | "set" -> failwith "Invalid"
                        | "while" -> failwith "Invalid"
                        | "print" -> failwith "Invalid"
                        | "add1"-> failwith "Invalid"
                        | "sub1"-> failwith "Invalid"
                        | "isNum"-> failwith "Invalid"
                        | "isBool"-> failwith "Invalid"
                        | "if"-> failwith "Invalid"
                        | "*" -> failwith "Invalid"
                        | "-" -> failwith "Invalid"
                        | "+" -> failwith "Invalid"
                        | _ ->EApp (s^"1", List.map (parse) (exprs)))
        | _ -> failwith "Invalid" ))
and parse_binding binding =
  (match binding with 
  |List([Atom("let");_]) -> failwith "Invalid"
  |List([Atom("sub1");_]) -> failwith "Invalid"
  |List([Atom("add1");_]) -> failwith "Invalid"
  |List([Atom("set");_]) -> failwith "Invalid"
  |List([Atom(s);ex]) -> (s, parse ex)
  |_ -> failwith "Invalid binding")

  let parse_def sexp =
    (match sexp with
     |List(Atom("def")::Atom(name)::List(e1):: 
                Atom(":")::Atom(ret_typ)::body) ->
                       (match body with 
                       |[] -> failwith "Invalid"
                       |_ ->  ( 
                        match name with 
                        | "get" -> failwith "Invalid"
                        | "let" -> failwith "Invalid"
                        | "set" -> failwith "Invalid"
                        | "while" -> failwith "Invalid"
                        | "print" -> failwith "Invalid"
                        | "add1"-> failwith "Invalid"
                        | "sub1"-> failwith "Invalid"
                        | "isNum"-> failwith "Invalid"
                        | "isBool"-> failwith "Invalid"
                        | "if"-> failwith "Invalid"
                        | "*" -> failwith "Invalid"
                        | "-" -> failwith "Invalid"
                        | "+" -> failwith "Invalid"
                        | _ -> DFun(name^"1",(parse_args) (e1), parse_typ ret_typ, (List.map (parse) (body)))
                        ))
     | _ -> failwith "Invalid"
     )

let rec parse_program sexps =
  match sexps with
  | [] -> failwith "Invalid: Empty program"
  | [e] -> ([], parse e)
  | e::es ->
     let parse_e = (parse_def e) in
     let defs, main = parse_program es in
     parse_e::defs, main

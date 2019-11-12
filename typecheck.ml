open Expr
open Printf

let rec find ls x =
  match ls with
  | [] -> None
  | (y,v)::rest ->
    if y = x then Some(v) else find rest x

type def_env = (string * (typ list * typ)) list

let build_def_env (defs : def list) : def_env =
  let get_typ (DFun(name, args, ret_typ, body)) = (name, ((List.map snd args), ret_typ)) in
  List.map get_typ defs

  let rec tc_n (e : expr) (env : (string * typ) list) (def_env : def_env) : typ =
    let tc_n e env = tc_n e env def_env in
    match e with
    | ENumber(_) -> TNum
    | EBool(_) -> TBool
    | EId(s) -> (match (find env s) with
                  | None -> failwith "Untyped variable"
                  | Some(g) -> (g))
    | ENull(typ) -> typ
    | ELet(ls, body) -> (match ls with
                          | []-> (match body with 
                                  | [] -> failwith "empty" 
                                  | [e1] -> tc_n e1 env
                                  | first::rest  ->let t = (tc_n first env) in
                                                  ( tc_n (ELet([], rest)) (env))
                                  )
                          | (x,e)::rest -> (match (find rest x) with
                                          | None -> (tc_n (ELet(rest,body)) ((x,(tc_n e env))::env))
                                          | _ -> failwith "Duplicate variable Elet"))
    | EWhile(cond, body) ->( let cond_t = (tc_n (cond) (env)) in
                            let tc_w (e_b: expr) = (tc_n (e_b) (env)) in
                            let tc_b = ( (List.map (tc_w) (body))) in
                            if (cond_t == TBool) then
                                  (
                                     TBool
                                  ) 
                            else (
                                  failwith "Type mismatch"                 )
                          )
    | EUpdate(e1, e2, e3) ->
      let t1 = tc_n e1 env in
      let t2 = tc_n e2 env in
      let t3 = tc_n e3 env in
      if (t1 == TTup) && (t2 == TNum) then 
      TTup else failwith "Type mismatch"
    | EGet(e1, e2, t) -> 
      let t1 = (tc_n e1 env) in 
      let t2 = (tc_n e2 env) in 
      if ((t1 ==TTup) && (t2 == TNum)) then
      t else failwith "Type mismatch"
    | ESet(name, expr) -> (let tc_b = (tc_n expr env) in 
                          match (find env name) with
                          | None -> failwith "unbound variable"
                          | Some(g) -> (if (g == tc_b) then 
                                           g else (
                                          failwith "Type mismatch"
                                  )
                                  )
                          )
    | EIf(e1, e2, e3) -> let t1 = (tc_n e1 env) in
                         let t2 = (tc_n e2 env) in
                         let t3 = (tc_n e3 env) in
                         if((t1== TBool) && (t2 == t3)) then
                                 t2 else (
                                 failwith "Type mismatch" )
    | EPrim1(op, e) -> ( match op with
                          | Add1 -> let t1 = (tc_n e env) in
                                    if (t1 == TNum) then 
                                        TNum    else (
                                        failwith "Type mismatch" )
                          | Sub1 -> let t1 = (tc_n e env) in
                                    if (t1 == TNum) then 
                                        TNum    else (
                                        failwith "Type mismatch" )
                          | IsBool -> TBool
                          | IsNum -> TNum
                          | IsNull -> TBool
                          | Print -> tc_n e env
   
                       )
    | EApp(name, arg)->    
      (match (find def_env name) with 
        |None -> failwith ("Unbound") 
        |Some(((saved_args), ret_typ)) -> (helper arg saved_args ret_typ env def_env))
        
    | ETup(body) -> 
      let tc_w (e_b: expr) = (tc_n (e_b) (env)) in
      let es = List.map (tc_w) (body) in
      TTup
    | EPrim2(op, e1, e2) -> (match op with
                                  |Plus -> let t1 = (tc_n e1 env) in
                                           let t2 = (tc_n e2 env) in
                                           if ((t1 == t2) && (t2 == TNum)) then
                                               TNum    else ( 
                                                       failwith "Type mismatch"
                                                     )
                                  |Minus -> let t1 = (tc_n e1 env) in
                                           let t2 = (tc_n e2 env) in
                                           if ((t1 == t2) && (t2 == TNum)) then
                                               TNum    else ( 
                                                       failwith "Type mismatch"
                                                     )
                                  | Times ->  let t1 = (tc_n e1 env) in
                                           let t2 = (tc_n e2 env) in
                                           if ((t1 == t2) && (t2 == TNum)) then
                                               TNum    else ( 
                                                       failwith "Type mismatch"
                                                     )
                                  | Greater ->  let t1 = (tc_n e1 env) in
                                           let t2 = (tc_n e2 env) in
                                           if ((t1 == t2) && (t2 == TNum)) then
                                               TBool    else ( 
                                                       failwith "Type mismatch"
                                                     )
                                  | Less ->  let t1 = (tc_n e1 env) in
                                           let t2 = (tc_n e2 env) in
                                           if ((t1 == t2) && (t2 == TNum)) then
                                               TBool    else ( 
                                                       failwith "Type mismatch"
                                                     )
                                  | Equal ->  let t1 = (tc_n e1 env) in
                                           let t2 = (tc_n e2 env) in
                                           if ((t1 == t2)) then
                                               TBool    else ( 
                                                       failwith "Type mismatch"
                                                     )
                            )
    | _ -> TBool
   
  and helper arg (s_t ) r_t env def_env= 
          match arg, s_t with
          | [], [] -> r_t
          | [], _ -> failwith "Type mismatch"
          | _, [] -> failwith "Type mismatch" 
          | [p_a], [(saved_t)] -> 
            let provided = (tc_n p_a env def_env) in 
            if provided == saved_t then r_t else failwith "Type mismatch"
          | first_arg::rest_a, (f_st)::rest_st -> 
            let provided = (tc_n first_arg env def_env) in
            if provided == f_st then (helper (rest_a) (rest_st) (r_t) env def_env) else failwith "Type mismatch" 
  
  
  let rec get_body_typ (e: expr list) (args) (def_env) = 
    (match e with
    | [] -> failwith "Empty def body"
    | [e1]-> tc_n e1 args def_env
    | e1::rest -> get_body_typ rest args def_env
    )
  let tc_def def_env (DFun(name, args, ret_typ, body)) =
    let body_typ = get_body_typ body args def_env in 
    if body_typ == ret_typ then true else failwith "Type mismatch"
  

let tc_p (defs, main) def_env : typ =
  begin ignore (List.map (tc_def def_env) defs); tc_n main [("input", TNum)] def_env end

open Printf
open Expr
open Asm
open Typecheck

let rec find ls x =
  match ls with
  | [] -> None
  | (y,v)::rest ->
    if y = x then Some(v) else find rest x

let rec find_def p x =
  match p with
  | [] -> None
  | (DFun(name, args, ret, body) as d)::rest ->
    if name = x then Some(d) else find_def rest x

let stackloc si = RegOffset(-8 * si, RSP)
let heaploc si = RegOffset(8 * si, R15) (* In the kickoff, we store the start of the heap in R15 *)

(* Suggested values for `true` and `false` to distinguish them from pointers *)
let true_const  = HexConst(0x0000000000000006L)
let false_const = HexConst(0x0000000000000002L)
let null_const = HexConst(0x0000000000000000L)

let rec well_formed_e (e : expr) (env : (string * int) list) : string list =
  match e with
  | ENumber(_) -> []
  | EBool(_) -> []
  | ENull (_) -> []
  | EId(s) -> (match find env s with 
                |None -> [sprintf "Variable identifier %s unbound" (s)] 
                |Some(_) -> [])
  | ELet(ls, body) -> (match ls with
                        | [] ->let wfe (e1: expr) = (well_formed_e e1 env) in
                               ( List.flatten(List.map (wfe) (body)))
                        | (x,e)::rest-> (match find rest x with
                                        | None -> (well_formed_e (e) (env)) @ (well_formed_e (ELet(rest, body)) ((x,1)::env)) (*NEED TO APPEND STILL*)
                                        | _ -> [sprintf "Multiple bindings for variable identifier %s" (x)] @ (well_formed_e e env) @ (well_formed_e (ELet(rest,body)) ((x,1)::env))
                                        ) 
                       )
  | EUpdate(e1, e2, e3) -> 
    let w1 = well_formed_e e1 env in 
    let w2 = well_formed_e e2 env in
    let w3 = well_formed_e e3 env in
    w1 @ w2 @ w3
  | ESet(name, e) -> (match (find env name) with
                        | None -> [sprintf "Variable identifier unbound %s" (name)]
                        | _ -> []) 
  | EGet(e1, e2, t1) -> let w1 = well_formed_e e1 env in 
                    let w2 = well_formed_e e2 env in
                    w1 @ w2
  | EWhile(cond, body) -> (let wf_w (e_i: expr) = (well_formed_e (e_i) (env)) in
                           ((well_formed_e cond env) @ (List.flatten(List.map (wf_w) (body))))
                          )
  | EIf(e1, e2, e3) -> ( (well_formed_e e1 env) @ (well_formed_e e2 env) @ (well_formed_e e3 env)
  )
  | EPrim1(op, e) -> (match op with 
                        | Add1 -> (well_formed_e e env)
                        | Sub1 -> (well_formed_e e env)
                        | IsBool -> (well_formed_e e env)
                        | IsNum -> (well_formed_e e env)
                        | IsNull -> (well_formed_e e env)
                        | Print -> (well_formed_e e env)
                        )
  | ETup(exprs) -> 
    (let wf_w (e_i: expr) = (well_formed_e (e_i) (env)) in
    List.flatten (List.map (wf_w) (exprs))
    )
  | EApp(name, e) -> 
    let wf_h e = well_formed_e e env in 
    List.flatten(List.map (wf_h) (e))
  |EPrim2(op, e1, e2) -> (match op with
                       | Plus -> (well_formed_e e1 env) @ (well_formed_e e2 env)
                       | Minus -> (well_formed_e e1 env) @ (well_formed_e e2 env)
                       | Times -> (well_formed_e e1 env) @ (well_formed_e e2 env)
                       | Less -> (well_formed_e e1 env) @ (well_formed_e e2 env)
                       | Greater -> (well_formed_e e1 env) @ (well_formed_e e2 env)
                       | Equal -> (well_formed_e e1 env) @ (well_formed_e e2 env)
                       )
  | _ -> ["behind"] 
  

let well_formed_def (DFun(name, args, ret, body)) =
  let rec arg_h arg_l =
    match arg_l with
    |[]-> []
    |(x,y)::rest-> (x, 0)::(arg_h rest)
    in
  let wf_e_h (e_i) = well_formed_e e_i (arg_h args) in
  List.flatten (List.map (wf_e_h) (body))

let well_formed_prog (defs, main) =
  let rec check_def d = 
    (match d with 
    | [] -> []
    | DFun(name, _, _, _)::rest -> 
      (match find_def rest name with
      | None -> check_def rest
      | Some(d) -> failwith "Multiple functions"
    )) in
    let checked_defs = (check_def defs) in
  (List.concat (List.map well_formed_def defs)) @ (well_formed_e main [("input", 1)])


let check p : string list =
  match well_formed_prog p with
  | [] -> []
  | errs -> failwith (String.concat "\n" errs)

  let rec compile_expr (e : expr) (si : int) (env : (string * int) list) (def_env) (hi : int)
  : instruction list =
  let compile_expr e si env = compile_expr e si env def_env hi in
  match e with
  | EBool(true) -> [IMov(Reg(RAX), true_const); IMov(Reg(RAX), true_const)]
  | EBool(false) -> [IMov(Reg(RAX), false_const)]
  | ENull(_) -> [IMov(Reg(RAX), null_const)]
  | ENumber(i) -> [IMov(Reg(RAX),Const64(Int64.of_int ((2*i)+1))); IJo("error_handle_of")]
  | EId(s) -> 
             ( match find env s with 
              | None -> failwith (sprintf "variable identifier %s unbound" (s))
              | Some(i) -> [IMov(Reg(RAX),(stackloc i))])
  | ETup(exprs) ->
    (let rec ex expressions ti= (match expressions with 
    | [] -> failwith "empty tuple body"
    | [e1] -> ( 
      let comp1 = (compile_expr e1 ti env) in
      comp1 @ [IMov((stackloc ti), Reg(RAX))]
    )
    | first::rest -> (
      let comp = (compile_expr first ti env) in 
      comp @ [IMov((stackloc ti), Reg(RAX))] @ (ex (rest) (ti+1) )
      )
     ) in 
     let rec placement sh target = 
      (if (sh == target) then 
        []
      else ([IMov(Reg(RAX), (stackloc sh));IMov((heaploc 0), Reg(RAX)); IAdd(Reg(R15), Const(8));] @ (placement (sh+1) (target)) )
      ) in
     (ex exprs (si+1)) @ [IMov((stackloc si), Reg(R15)); IMov(Reg(RAX),Const(List.length exprs));IMov((heaploc 0),Reg(RAX)); IAdd(Reg(R15), Const(8))] @ (placement (si+1) ((si+1) + (List.length exprs))) @ [IMov(Reg(RAX), (stackloc si))]
     )
  | EGet(e1, e2, _) -> 
      let c1 = compile_expr e1 (si+4) env in
      let c2 = compile_expr e2 (si+4) env in
      c1 @ [IMov((stackloc si), Reg(RAX))] @ c2 @ 
      [IMov((stackloc (si+1)), Reg(RAX)); ISar(Reg(RAX), Const(1)); ICmp(Reg(RAX), Const(0)); IJl("out_of_bounds");
      IMov((stackloc (si+2)), Reg(R15)); IMov(Reg(R15), (stackloc si));IMov(Reg(RAX), (stackloc (si+1))); ISar(Reg(RAX), Const(1));ICmp(Reg(RAX), (heaploc (0)));IJg("out_of_bounds");
      IMov(Reg(RAX),(stackloc (si+1))); ISar(Reg(RAX),Const(1)); IAdd(Reg(RAX),Const(1)) ;IMul(Reg(RAX), Const(8)); 
      IAdd(Reg(R15), Reg(RAX)); IMov(Reg(RAX), (heaploc 0)); IMov(Reg(R15), (stackloc (si+2)))]
  | EUpdate(e1, e2, e3)-> 
    let c1 = compile_expr e1 (si+4) env in
    let c2 = compile_expr e2 (si+4) env in
    let c3 = compile_expr e3 (si+4) env in
    c1 @ [IMov((stackloc si), Reg(RAX))] @ c2 @[IMov((stackloc (si+1)), Reg(RAX))]@ c3@
    [ IMov((stackloc (si+3)), Reg(RAX));IMov(Reg(RAX), (stackloc (si+1)));ICmp(Reg(RAX), Const(0)); IJl("out_of_bounds");
    IMov((stackloc (si+2)), Reg(R15)); IMov(Reg(R15), (stackloc si));IMov(Reg(RAX), (stackloc (si+1))); ISar(Reg(RAX), Const(1));ICmp(Reg(RAX), (heaploc (0)));IJg("out_of_bounds");
    IMov(Reg(RAX),(stackloc (si+1))); ISar(Reg(RAX),Const(1)); IAdd(Reg(RAX),Const(1)) ;IMul(Reg(RAX), Const(8)); 
    IAdd(Reg(R15), Reg(RAX)); IMov(Reg(RAX), (stackloc (si+3))); IMov((heaploc 0),Reg(RAX)) ; IMov(Reg(R15), (stackloc (si+2))); IMov(Reg(RAX),(stackloc si))]
  | ELet( ls, body) -> 
                  (match ls with 
                  | [] -> let comp (es: expr) = (compile_expr es si env) in
                          let map_body = (List.map (comp) (body)) in
                                  (List.flatten map_body)
                  | (x,e)::rest ->
                                 (match find rest x with
                                 |None->  
                                         ((compile_expr e si env ) @ [IMov( (stackloc si), Reg(RAX))] @
                                         (compile_expr (ELet(rest, body)) (si+1) ((x,si)::env)))
                                 |_ -> failwith "Duplicate binding"
                                 )                              
                  )
  | EApp(name, body)-> 
    (match body with 
    | [] -> let gen_l = (gen_temp "after_call") in
    [IMov(Reg(RAX), Label(gen_l)); IMov((stackloc si), Reg(RAX));
     IMov((stackloc (si+1)), Reg(RSP));ISub(Reg(RSP), (Const((si-1)*8)));
     ICall(name);ILabel((gen_l));IMov(Reg(RSP), (stackloc (2)))]
    | first::rest -> 
      let instr = compile_expr (first) (si) (env) in
      instr @ [IMov((stackloc si), Reg(RAX))] @ compile_expr (EApp(name, rest)) (si+1) (env))
  | EWhile(e1, body) -> let cond = (compile_expr e1 si env) in 
                        let map_f (e_e: expr) = (compile_expr e_e si env) in
                        let cond_l = (gen_temp "while_cond") in 
                        let end_l = (gen_temp "end_while") in 
                        [ILabel(cond_l)] @ cond @ [ICmp(Reg(RAX), true_const);IJne(end_l)] @
                        (List.flatten (List.map (map_f) (body))) @ [IJmp(cond_l);ILabel(end_l)]
  | ESet(name, e) -> let ev_e = (compile_expr e si env) in
                     let n_loc = (find env name) in
                     (match n_loc with 
                      | None-> failwith "error in set"
                      |Some(s) -> ev_e @ [IMov((stackloc s), Reg(RAX))]
 ) 
                     
  | EIf(e1, e2, e3) -> ( let ne_l = (gen_temp "if_ne") in
                         let end_if = (gen_temp "Iend_if") in
                        (compile_expr e1 si env) @ [IMov((stackloc si), Reg(RAX))] @ 
                        [IShl(Reg(RAX), Const(1)); IAnd(Reg(RAX), true_const);ICmp(Reg(RAX), true_const); IJe("error_handle_bool")] (*type check bool*)
                        @ [IMov( Reg(RAX),(stackloc si)); ICmp(Reg(RAX), true_const); IJne(ne_l)] @ (compile_expr e2 (si+1) env)
                        @ [IJmp(end_if); ILabel(ne_l)] @ (compile_expr e3 (si +1) env) @ [ILabel(end_if)]
  )
  | EPrim1(op, e) -> (compile_prim1 op e si env def_env hi)
  | EPrim2(op, e1, e2) -> compile_prim2 op e1 e2 si env def_env hi
  | _ -> failwith "asdf"

and compile_prim1 op e si env def_env hi : instruction list=
  let compile_expr e si env = compile_expr e si env def_env hi in 
  let num_check = [IAnd(Reg(RAX),Const(1)); IShl(Reg(RAX), Const(2)); IAdd(Reg(RAX), Const(2)); ICmp(Reg(RAX), true_const);IJne("error_handle_num")] in
  match op with 
        | Add1 ->  (compile_expr e si env) @[IMov((stackloc si), Reg(RAX))] @ num_check
        @ [IMov(Reg(RAX), (stackloc si)); IAdd(Reg(RAX), Const(2)); IJo("error_handle_of")]
        | Sub1 ->  (compile_expr e si env) @[IMov((stackloc si), Reg(RAX))] @ num_check
        @ [IMov(Reg(RAX), (stackloc si));ISub(Reg(RAX), Const(2));IJo("error_handle_of")]
        | IsNum -> (compile_expr e si env) @ [IAnd(Reg(RAX),Const(1)); IShl(Reg(RAX), Const(2)); IAdd(Reg(RAX), Const(2))]
        | IsNull -> 
        let end_if = (gen_temp "fend_if") in
        let ne_l = (gen_temp "fif_ne") in 
        (compile_expr e si env) @ [ICmp(Reg(RAX), null_const); IJne(ne_l); IMov(Reg(RAX), true_const); IJmp(end_if); ILabel(ne_l); IMov(Reg(RAX), false_const);ILabel(end_if)]
        | IsBool ->
        let end_if = (gen_temp "fend_if") in
        let ne_l = (gen_temp "fif_ne") in 
        (compile_expr e si env) @ [IAnd(Reg(RAX),Const(3));ICmp(Reg(RAX), Const(2)); IJne(ne_l); IMov(Reg(RAX), true_const); 
                                    IJmp(end_if);ILabel(ne_l); IMov(Reg(RAX), false_const); ILabel(end_if)]
        | Print -> 
            let compiled_e = (compile_expr e si env) in
            compiled_e @ [IMov(Reg(RDI), Reg(RAX)); ISub(Reg(RSP), Const(8*si));ICall("print");IAdd(Reg(RSP),Const(si*8))] 
        | _ -> failwith "Invalid Prim1 Type"

and compile_prim2 op e1 e2 si env def_env hi =
  let compile_expr e si env = compile_expr e si env def_env hi in 

  let overflow_check = [IJo("error_handle_of")] in
  let num_check = [IAnd(Reg(RAX),Const(1)); IShl(Reg(RAX), Const(2)); IAdd(Reg(RAX), Const(2)); ICmp(Reg(RAX), true_const);IJne("error_handle_num")] in
        (match op with
        | Plus -> 
               (  ((compile_expr e1 si env) @ [IMov((stackloc si),Reg(RAX))] @ num_check@
                                         
                                         [IMov(Reg(RAX), (stackloc si));IXor(Reg(RAX), Const(1));IMov( (stackloc si), Reg(RAX))]
                                        @ (compile_expr e2 (si+1) env) @ [IMov((stackloc (si+1)), Reg(RAX))] @ num_check @
                                         [IMov(Reg(RAX), (stackloc (si)))]@ 
                                         [IAdd(Reg(RAX), (stackloc (si+1)))])
                                         @ overflow_check (*overflow check*)
               )                          
        | Minus -> 
                  ((compile_expr e1 si env) @ [IMov((stackloc si),Reg(RAX))]  @num_check
                    @ (compile_expr e2 (si+1) env) @ [IMov((stackloc (si+1)), Reg(RAX))] @num_check
                  @ [IMov(Reg(RAX), (stackloc si));ISub( Reg(RAX), (stackloc (si+1)));IAdd(Reg(RAX), Const(1))] @ overflow_check (*overflow check*)
                  )
        | Times -> 
              ( (compile_expr e1 si env) @ [IMov((stackloc si),Reg(RAX))]  @ num_check @
                [IMov(Reg(RAX), (stackloc si));ISar(Reg(RAX), Const(1));IMov((stackloc si), Reg(RAX))] @
                 (compile_expr e2 (si+1) env) @ [IMov((stackloc (si+1)), Sized(DWORD_PTR, Reg(RAX)));ISub((stackloc (si+1)), Sized(DWORD_PTR,Const(1)))]
                 @ num_check @ [IMov(Reg(RAX),(stackloc si));IMul(Reg(RAX), (stackloc (si+1)));IAdd(Reg(RAX), Const(1));] @ overflow_check (*overflow*)
                 
              )
        | Greater -> ( (compile_expr e2 si env) @ [IMov((stackloc si),Reg(RAX))] @  num_check@
                        [IMov(Reg(RAX), (stackloc si));IAnd(Reg(RAX), HexConst(0xFFFFFFFFFFFFFFFEL));IMov(Reg(RAX), (stackloc si))] @ 
                        (compile_expr e1 (si+1) env) @ [IMov((stackloc (si+1)), Reg(RAX))] @ num_check @
                        [IMov(Reg(RAX),(stackloc si));ISub( Reg(RAX), (stackloc (si+1)))] @overflow_check @  (*overflwo check*)
                        [IShr(Reg(RAX), Const(61)); IAnd(Reg(RAX), Const(4)); IAdd(Reg(RAX),false_const)]

              )
        | Less ->  ( (compile_expr e1 si env) @ [IMov((stackloc si),Reg(RAX))] @ 
                        num_check @
                        [IMov(Reg(RAX), (stackloc si));ISub(Reg(RAX), Const(1));IMov(Reg(RAX), (stackloc si))] @ 
                        (compile_expr e2 (si+1) env) @ [IMov((stackloc (si+1)), Reg(RAX))] @ num_check @
                        [IMov((Reg(RAX), (stackloc si)));ISub( (Reg(RAX)), (stackloc (si+1)))] @ overflow_check @  
                        [IShr(Reg(RAX), Const(61)); IAnd(Reg(RAX), Const(4)); IAdd(Reg(RAX),false_const)]

              )
        | Equal -> ( let ne_t = (gen_temp "eNe") in  
                     let end_if = (gen_temp "end_if") in
                (compile_expr e1 si env) @ [IMov((stackloc si), Reg(RAX))] @ (compile_expr e2 (si+1) env) 
                     @ [ICmp(Reg(RAX), (stackloc si)); IJne(ne_t);IMov(Reg(RAX), true_const);IJmp(end_if);ILabel(ne_t);IMov(Reg(RAX), false_const);ILabel(end_if)]
        )
        | _ -> failwith "Invalid Prim2 Type")

and compile_def (DFun(name, args, ret, body)) def_env =
  let rec gen_arg_env (args) (count: int) = 
    match args with
    | [] -> []
    | (name, typ)::rest -> (name, -count)::(gen_arg_env (rest) (count-1)) in
  let arg_env = (gen_arg_env (args) (List.length args)) in
  let cmp_e_map (e)= (compile_expr (e) (2) (arg_env) (def_env) 0) in 
  let instrs = List.flatten (List.map (cmp_e_map) (body)) in
  [ILabel(name)] @ instrs @ [IRet]


let compile_to_string ((defs, main) as prog : Expr.prog) =
  let _ = check prog in
  let def_env = build_def_env defs in
  let _ = tc_p prog def_env in
  let compiled_defs = List.concat (List.map (fun d -> compile_def d defs) defs) in
  let compiled_main = compile_expr main 2 [("input", 1)] defs 0 in
  let prelude = "  section .text\n" ^
                "  extern error\n" ^
                "  extern print\n" ^
                "  extern heap_alloc\n" ^
                "  global our_code_starts_here\n" in
  let kickoff = "our_code_starts_here:\n" ^
                "push rbx\n" ^
                "  mov r15, rdi\n" ^       (* rdi and r15 contain a pointer to the start of the heap *)
                "  mov [rsp - 8], rsi\n" ^ (* rsi and [rsp-8] contain the input value *)
                to_asm compiled_main ^
                "\n  pop rbx\nret\n" in
  let postlude = [IRet] in
  let out_of_bounds = [ILabel("out_of_bounds"); IMov(Reg(RDI), Const(3)); IPush(Const(0));ICall("error")] in
  let error_handle_num = [ILabel("error_handle_num"); IMov(Reg(RDI),Const(0)); IPush(Const(0));ICall("error")] in
  let error_handle_bool = [ILabel("error_handle_bool"); IMov(Reg(RDI),Const(1)); IPush(Const(0));ICall("error")] in
  let error_handle_of = [ILabel("error_handle_of"); IMov(Reg(RDI),Const(2)); IPush(Const(0));ICall("error")] in
  let as_assembly_string = (to_asm (compiled_defs  @error_handle_num @ error_handle_bool @ error_handle_of @ out_of_bounds)) in
  sprintf "%s%s\n%s\n" prelude as_assembly_string kickoff

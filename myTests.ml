open Runner
open Expr
open Printf
open OUnit2

(* Fill in `myTestList` with your own tests. There are two ways to add a test:
 *
 * (1) By adding the code of the program as a string. In this case, add an entry
 *     of this form in `myTestList`:
 *
 *     t <test_name> <program_code> <result>
 *
 * (2) By adding a test inside the 'input/' folder and adding an entry for it
 *     in `myTestList`. The entry in this case should be:
 *
 *     t_file <test_name> <file_name> <result>
 *     
 *     Where name is the name of the file inside 'input/' with the extension
 *     ".ana". For example:
 *
 *     t_file "myTest" "mytest.ana" "6";
 *)

let t_i name program expected args = name>::test_run program name expected args
let t name program expected = name>::test_run program name expected []
let terr_i name program expected args = name>::test_err program name expected args
let t_err name program expected = name>::test_err program name expected []
let t_parse name program expected =
  name>::(fun _ -> assert_equal expected (Runner.parse_string_full program));;

let myTestList =
  [ (* Fill in your tests here: *)
    t "detect_t" "(tuple 19 1 23 14 1515)" "( 19 1 23 14 1515 )";
    t "nested_tuple" "(tuple 19 1 23 14 1515 (tuple 19 (tuple 19 1 23 14 1515) 1 23 14 1515))" "( 19 1 23 14 1515 ( 19 ( 19 1 23 14 1515 ) 1 23 14 1515 ) )";
    t "simple_get" "(get (tuple 1 2 3) 0 Num)" "1"; 
    t "dif_get" "(get (tuple 19 1 23 14 1515 (tuple 19 (tuple 19 1 23 14 1515) 1 23 14 1515)) 5 Tup)" "( 19 ( 19 1 23 14 1515 ) 1 23 14 1515 )";
    t "update_1" "(update (tuple 19 1 23 14 1515) 3 (tuple 19 1 23 14 1515))" "( 19 1 23 ( 19 1 23 14 1515 ) 1515 )";
    t "isnull" "(isNull (null Num))" "true";
    t "isnull2" "(isNull (isNull (null Num)))" "false";
    t "simple_ex" "(let ((x (tuple 19 1 23 14 1515))) 
    (print (get (tuple 19 1 23 14 1515 (tuple 19 x 1 23 14 1515)) 5 Tup))
    (update x 3 5)
    (print x)
    (print (get x 4 Num))
    (print (+ (get x 1 Num) (get x 2 Num)))
    (update x 0 true)
    (print x)
    (get (update x 0 false) 0 Bool)
    ) " "( 19 ( 19 1 23 14 1515 ) 1 23 14 1515 )\n( 19 1 23 5 1515 )\n1515\n24\n( true 1 23 5 1515 )\nfalse";
    t "err1" "(let ((x (tuple 19 1 23 14 1515))) (+ (get x 1 Num) (get x 2 Tup)))" "Compile error: Type mismatch";
    t "err2" "(let ((x (tuple 19 1 23 14 1515))) (get x 15 Num))" "Index out of bounds exception";
    t "points" "(def p (x : Num y : Num) : Tup (tuple x y)) (let ((x (p 5 6))) x)" "( 5 6)";

    
    ]
;;

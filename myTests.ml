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
    t "simple_get" "(get (tuple 1 2 3) 0)" "1"; 
    t "dif_get" "(get (tuple 19 1 23 14 1515 (tuple 19 (tuple 19 1 23 14 1515) 1 23 14 1515)) 5)" "( 19 ( 19 1 23 14 1515 ) 1 23 14 1515 )";
    t "update_1" "(update (tuple 19 1 23 14 1515) 3 (tuple 19 1 23 14 1515))" "( 19 1 23 ( 19 1 23 14 1515 ) 1515 )";
    t "isnull" "(isNull (null Num))" "true";
    t "isnull2" "(isNull (isNull (null Num)))" "false";
    ]
;;

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
    (* t "weird_add1" "(let ((x (tuple 1 true 3 4))) (add1 (get x 1 Num)))" ""; *)
    t "simple_ex" "(let ((x (tuple 19 1 23 14 1515))) 
    (print (get (tuple 19 1 23 14 1515 (tuple 19 x 1 23 14 1515)) 5 Tup))
    (update x 3 5)
    (print x)
    (print (get x 4 Num))
    (print (+ (get x 1 Num) (get x 2 Num)))
    (update x 0 true)
    (print x)
    (get (update x 0 false) 0 Bool)
    (update x 0 (tuple 1 2))
    ) " "( 19 ( 19 1 23 14 1515 ) 1 23 14 1515 )\n( 19 1 23 5 1515 )\n1515\n24\n( true 1 23 5 1515 )\n( ( 1 2 ) 1 23 5 1515 )";
    (* t "em1" "(let ((x (tuple 19 1 23 14 1515))) (+ (get x 1 Num) (get x 2 Tup)))" "Compile error: Type mismatch";
    t "er2" "(let ((x (tuple 19 1 23 14 1515))) (get x 15 Num))" "Index out of bounds exception";
    t "em3" "(let ((x (tuple 19 1 true 14 1515))) (+ (get x 2 Num) 4))" ""; *)
    t "pz" "(def p (x : Num y : Num) : Tup (tuple x y))
    (def pPlus (x : Tup y : Tup) : Tup (tuple (+ (get x 0 Num) (get y 0 Num)) (+ (get x 1 Num) (get y 1 Num))))
     (let ((x (pPlus (p 5 6) (p 1 18)))) 
     (print x)
     (pPlus x (pPlus (p 5 6) (p 8 29)))
     )" "( 6 24 )\n( 19 59 )";
     t "bt123" "(def createBst (x : Num) : Tup (tuple x (null Tup) (null Tup))) 
     (def addBst (x : Num y : Tup) : Tup (let ((val (get y 0 Num)) (left (get y 1 Tup)) (right (get y 2 Tup))) 
     (if (== val x) 
      y 
      (if (< val x)
        (if (isNull right)
          (update y 2 (tuple x (null Tup) (null Tup))) 
          (addBst x right)
        )
        (if (isNull left)
          (let ((emptyP1 0))
            (update y 1 (tuple x (null Tup) (null Tup)))
            y
          ) 
          (addBst x left)) 
      ) 
     )
     ))
     (def inBst (x : Num y : Tup) : Bool 
      (let ((val (get y 0 Num)) (left (get y 1 Tup)) (right (get y 2 Tup))) 
        (if (== val x) 
          true 
          (if (< val x)
            (if (isNull right)
              false 
              (inBst x right)
            )
            (if (isNull left)
              false 
              (inBst x left)
            ) 
          ) 
        )
      )
     )
     (let ((x (createBst 2))) 
     (print x)
     (addBst 4 x )
     (print (inBst -3 x))
     (print x)
     (addBst 16 x)
     (addBst -3 x)
     (addBst -59 x)
     (print x)
     (print (inBst -3 x))
     (print (inBst 400 x))
     (print (inBst 16 x))
     )" "( 2 null null )\nfalse\n( 2 null ( 4 null null ) )\n( 2 ( -3 ( -59 null null ) null ) ( 4 null ( 16 null null ) ) )\ntrue\nfalse\ntrue\ntrue";
    t "linked_list" "(def initList () : Tup (tuple (null Num) (null Tup)))
    (def addBeg (val : Num head : Tup) : Tup (let ((prevf (get head 1 Tup))) (update head 1 (tuple val prevf))) )
    (def addEnd (val : Num head : Tup) : Tup 
      (let ((nextf (get head 1 Tup))) 
        (if (isNull nextf)
          (update head 1 (tuple val (null Tup)))
          (addEnd val (get head 1 Tup)) 
        ) 
      )
    )
    (def getVal (index : Num head : Tup ct : Num) : Num
      (let ((holder 0))
        (if (isNull head)
          (null Num)
          (if (== index ct)
            (get head 0 Num)
            (getVal index (get head 1 Tup) (+ ct 1))
          )
        )
      )
    )
    (def createLLto (size : Num) : Tup 
      (let ((x (initList)))
        (createLLhelp size  x 0)
        x
      )
    )
    (def createLLhelp (size : Num head : Tup ct : Num) : Tup
      (let ((x 0))
        (if (== size ct )
          (update head 1 (tuple ct (null Tup)))
          (let ((dud 0))
            (update head 1 (tuple ct (null Tup)))
            (createLLhelp size (get head 1 Tup) (+ ct 1))
          )
        )
      )
    )
    (let ((x (initList)) (y (createLLto 18)))
      (print x)
      (addBeg 90 x)
      (addBeg 80 x)
      (addBeg 70 x)
      (addBeg 60 x)
      (addBeg 50 x)
      (print x)
      (addEnd 80 x)
      (addEnd 70 x)
      (addEnd 60 x)
      (addEnd 50 x)
      (addEnd 80 x)
      (addEnd 70 x)
      (addEnd 60 x)
      (addEnd 50 x)
      (print x)
      (print (getVal 13 x 0))
      (print y)
      (addEnd 80 y)
      (addBeg 60 y)
      (print y)
      (createLLto 7)
    )" "( null null )
( null ( 50 ( 60 ( 70 ( 80 ( 90 null ) ) ) ) ) )
( null ( 50 ( 60 ( 70 ( 80 ( 90 ( 80 ( 70 ( 60 ( 50 ( 80 ( 70 ( 60 ( 50 null ) ) ) ) ) ) ) ) ) ) ) ) ) )
50
( null ( 0 ( 1 ( 2 ( 3 ( 4 ( 5 ( 6 ( 7 ( 8 ( 9 ( 10 ( 11 ( 12 ( 13 ( 14 ( 15 ( 16 ( 17 ( 18 null ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) )
( null ( 60 ( 0 ( 1 ( 2 ( 3 ( 4 ( 5 ( 6 ( 7 ( 8 ( 9 ( 10 ( 11 ( 12 ( 13 ( 14 ( 15 ( 16 ( 17 ( 18 ( 80 null ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) )
( null ( 0 ( 1 ( 2 ( 3 ( 4 ( 5 ( 6 ( 7 null ) ) ) ) ) ) ) ) )";
    
    ]
;;

#lang scheme

(lambda (x) (* x 2))
((lambda (x) (* x 2)) 10)

(define rev
  (lambda (lst)
    (if (null? lst)
        '()
        (append (rev (cdr lst)) (list (car lst))))))
(rev '(1 2 3 4 5))

(define len
  (lambda (lst)
    (if (or (not (list? lst)) (null? lst))
        0
        (+ 1 (len (cdr lst))))))

(define crazylist '(10 hello world (1 2 3 4) "csc" "240" (x y z w)))
(define crazierlist '(10 hello world (1 (2 3) 4) "csc" "240" (a (b c) (d) (e))))
(len crazylist)

; Count all elements in a list and its sub-lists
(define element-count
  (lambda (lst)
    (cond
      ((null? lst) 0)
      ((not (pair? lst)) 1)
      (else (+ (element-count (car lst)) (element-count (cdr lst)))))))
(element-count crazylist)
(element-count crazierlist)
(element-count 1)
(element-count '(a))
(element-count '(1 . 2))
(element-count '((1 . 2) . (3 4 5)))

"Multiply-all"
(define multiply-all
  (lambda (lst)
    (if (= (len lst) 1)
        (car lst)
        (* (car lst) (multiply-all (cdr lst))))))
(multiply-all '(1 2 3 4))

(newline)
"Reduce"
(define red
  (lambda (operator base-case lst)
    (if (null? lst)
        base-case
        (operator (car lst) (red operator base-case(cdr lst))))))

(red * 1 '(1 2 3 4))
(red + 0 '(1 2 3 4))

(define sum-all
  (lambda (lst)
    (red + 0 lst)))

(define mult-all
  (lambda (lst)
    (red * 1 lst)))

(define lst0 '(5 6 7 8))
(sum-all lst0)
(mult-all lst0)

;length
(red (lambda (x y) (+ 1 y)) 0 lst0)
;square-list
(red (lambda (x y) (cons (* x x) y)) '() lst0)
;get-odds
(red (lambda (x y) (if (= 0 (remainder x 2)) y (cons x y))) '() lst0)
;reverse
(red (lambda (x y) (append y (list x))) '() lst0)



(define lst '(1 2 3 4 5 6 7 8 9 10 11 12 13))
(define lstn '(0 -1 2 -3 4 -5 6 -7 8 -9 10 -11 12 -13))
(define badlst (list "CGCC" 1 'a + 10 'hello lst '(1 2 3) '(a . b) red 8 6 -3))

(newline)
"Higher order functions - apply"
(apply + lst)   ; (+ 1 2 3 4 5 6 7 8 9 10 11 12 13)
(apply + lstn)
(apply * lst)
(apply * lstn)

(newline)
"Higher-order functions - map"
(map (lambda (x) (* x x)) lst)
(map (lambda (x) (* x x)) lstn)
(map (lambda (x) (if (> x 0) x (* -1 x))) lstn)
(map (lambda (x) (if (>= x 0) #t #f)) lstn)
(map string? badlst)

(newline)
"Higher-order functions - filter"
(filter (lambda (x) (if (>= x 0) #t #f)) lstn)
(filter string? badlst)
(filter pair? badlst)
(filter (lambda (x) (not (pair? x))) badlst)
; sum the squares of the numbers in badlst
(filter number? badlst)
(map (lambda (x) (* x x)) (filter number? badlst))
(apply + (map (lambda (x) (* x x)) (filter number? badlst)))

; function to calculate the sum of the squares of numbers in a list
(define sum-num-square
  (lambda (lst)
    (apply + (map (lambda (x) (* x x)) (filter number? lst)))))
(sum-num-square lst)
(sum-num-square badlst)

; numbers in badlst which < 8 when incremented
badlst
(filter (lambda(x) (< x 8))
        (map (lambda (x) (+ x 1))
             (filter number? badlst)))
; correct - filter with increment
(filter (lambda (x) (< (+ x 1) 8))
        (filter number? badlst))

(newline)
"Define a polynomial"
(define quad
  (lambda (a b c)
    (lambda (x)
      (+ (* a x x) (* b x) c))))
(define f1 (quad 1 1 1))   ;f(x) = x^2 + x + 1
(define f2 (quad 1 2 3))   ; f(x) = x^2 + 2x + 3
(define f3 (quad 2 4 2))   ; f(x) = 2x^2 + 4x + 2
(define f4 (quad 1 (/ 1 2) (/ 1 4))) ; f(x) = x^2 + 1/2 x + 1/4
f1
(f1 2)
(f1 -2)
(f2 2)
(f3 2)
(f4 2)

(newline)
"Towers of Hanoi"
(define hanoi
  (lambda (n source center destination)
    (if (= n 1)  ; stopping conditionkj
      (list 'Move source destination)
      (list (hanoi (- n 1) source destination center)
            (hanoi 1 source center destination)
            (hanoi (- n 1) center source destination)))))
(hanoi 3 'red 'yellow 'green)

(newline)
"Let structures (scope)"
(define a 100)
a

(let
    ((a 4)
     (b 3))
  (+ a b))

(let
    ((a 4)
     (b (+ a 1)))   ; a comes from the outer scope
  (+ a b))

(let
    ((a 4))
  (let
      ((b (+ a 1))) ; a comes from the inner scope
    (+ a b)))

; You can make things confusing
(let
    ((x 9))
  (let
      ((x 3)
       (y (* 5 x)))
    (+ x y)))

(define let-test
  (lambda (x)
    (let
        ((a (* 2 x))
         (b (+ 1 x))
         (c 10))
      (+ x a b c))))
(let-test 10)

(define habitat-material
  (lambda (height radius thickness)
    (let
        ( (pi 3.14159265) )
          (let
              ( (cylinder_volume
                 (lambda (r h)
                   (* h (* pi (* r r))))))
            (- 
             (cylinder_volume radius height)
             (cylinder_volume (- radius thickness) (- height (* 2 thickness))))))))
(habitat-material 10 5 1)

(let
    ((+ 10)
     (- 4)
     (* -))
  (* + -))

(newline)
"lambda->let, let->lambda)"
(let
    ((a 4)
     (b 5))
  (+ a b))
((lambda (a b) (+ a b)) 4 5)

((lambda (x y) (+ (* x x) (* y y))) 3 4)
(let
    ((x 3)
     (y 4))
  (+ (* x x) (* y y)))

(require "scheme3inc.scm")
(fib-tail 10)
;(fib 10)

(newline)
"Advanced topics - not required for project or final"
(define hello
  (case-lambda
    (() "Hello, World")
    ((name) (string-append "Hello, " name))))
(hello)
(hello "John")

(define multiple-of-2-and-5
  (lambda (n)
    (match (list (remainder n 2) (remainder n 5))
      ((list 0 0) #t) ; both remainders are 0
      ((list _ 0) "Divisible only by 5")
      ((list 0 _) "Divisible only by 2")
      (_ #f))))
(multiple-of-2-and-5 20)
(multiple-of-2-and-5 15)
(multiple-of-2-and-5 17)
(multiple-of-2-and-5 8)
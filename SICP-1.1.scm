; #Excersize 1.1
10
12
8
3
6
;
;
19
#f
4
16
6
16

; #Excersize 1.2

(/ (+ 5 1/2
   (- 2
      (- 3
         (+ 6 1/3))))
   (* 3 (- 6 2) (- 2 7)))

; #Excersize 1.3
(define (sq_2_larg x y z)
  (define (square x) (* x x))
  (define sorted_list (sort (list x y z) >))
  (+ (square (cadr sorted_list)) (square (car sorted_list))))

(define (square x)
  (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (sq_2_larg x y z)
  (cond ((and (<= x y) (<= x z)) (sum-of-squares y z))
        ((and (<= y x) (<= y z)) (sum-of-squares x z))
        (else (sum-of-squares x y))))

(define (sq_2_larg x y z)
  (define (max x y)
    (if (> x y) x y))
  (define (min x y)
    (if (< x y) x y))
  (define (square x) (* x x))
  (+ (square(max x y)) (square(max (min x y) z))))

; #Exersize 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 1 2)
  ((if (> 2 0) + -) 1 2)
  (+ 1 2)
  3

(a-plus-abs-b 1 -2)
  ((if (> -2 0) + -) 1 -2)
  (- 1 -2)
  3

; #Exersize 1.5
; normal-order evaluation "fully expand and then reduce"
; applicative-order evaluation "evaluate the arguments and then apply" method that the interpreter actually uses


; normal-order evaluation:
(test 0 (p))
  (if (= 0 0) ; fully expand
    0
    (p))) ; -> 0

; applicative-order evaluation:
(test 0 (p)) ; Evaluates (p)
  (if (= 0 0)
    0
    (p))) ; -> loops forever


;Exersize 1.6
; Fails due to applicative-order evaluation
; normal if uses normal-order evaluation

;Exersize 1.7
(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (/ (- (improve guess x) guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter guess x)))

(define (sqrt1 x)
  (sqrt-iter 0 1 x))

;Exersize 1.8

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

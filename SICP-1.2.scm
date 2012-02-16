; Exercise 1.9
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc(+ 1 5))))
(inc (inc (inc(inc (+ 0 5)))))
(inc (inc (inc(inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9 ;recursive

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9 ;iterative

;Exercise 1.10
(A 0 512); => 1024
(A 2 4); => 65536
(A 3 3); => 65536

f(n) = 2n
g(n) = 2^n
h(n) = 2 ^ ( 2 ^ ( 2 ^ ...) (n times))

;Exercise 1.11
;f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))


; x <- y
; y <- z
; z <- (+ z (* 2 y) (* 3 x))
(define (f n)
  (define (f-iter x y z count)
    (if (= count 0)
      x
      (f-iter y z (+ z (* 2 y) (* 3 x)) (- count 1))))
  (f-iter 0 1 2 n))

(f 4)

;Exercise 1.12
;(n k) = (- n 1) (- k 1) + (-n 1) k)

(define (pascal x y)
  (cond ((> y x) 0)
        ((< y 0) 0)
        ((= y 1) 1)
        (else
         (+ (pascal (- x 1) (- y 1))
            (pascal (- x 1) y)))))

; Prints it out...
(define (line x y)
  (print (pascal x y))
  (if (= y x) "\n"
        (line x (+ y 1))))

(define (rows x start)
  (print (line start 1))
  (if (= start x) "\n"
      (rows x (+ start 1))))

(rows 5 1)

;Exercise 1.13
(define phi (/ (+ 1 (sqrt 5)) 2))
(define psi (/ (- 1 (sqrt 5)) 2))

(define (new-fib x)
  (/ (- (expt phi x) (expt psi x)) (sqrt 5)))

(new-fib 10) ;-> 55

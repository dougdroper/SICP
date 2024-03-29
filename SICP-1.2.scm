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


;f(n) = f(n) + 2f(n - 1) + 3f(n - 2)
; x <- y
; y <- z
; z <- (+ z (* 2 y) (* 3 x))
(define (f n)
  (define (f-iter x y z count)
    (if (= count 0)
      x
      (f-iter y z (+ z (* 2 y) (* 3 x)) (- count 1))))
  (f-iter 0 1 2 n))

;Exercise 1.12
;(n k) = (- n 1) (- k 1) + (-n 1) k)
;|1|0|0|0|0
;|1|1|0|0|0
;|1|2|1|0|0
;|1|3|3|1|0
;|1|4|6|4|1
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


;Exercise 1.13, not really proof
(define phi (/ (+ 1 (sqrt 5)) 2))
(define psi (/ (- 1 (sqrt 5)) 2))

(define (new-fib x)
  (/ (- (expt phi x) (expt psi x)) (sqrt 5)))

(new-fib 10) ;-> ~ 55

;Exercise 1.14
(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

                                                 cc 11 5
                                                   |
                                    cc 11 4 +  --------- cc (11 - 50) 5
                                        |                       |
                                   ------                        ---- 0
                                  |
                     cc 11 3 + ------- cc (11 - 25) 4
                          |                   |
                      ---- ----                ---- 0
                      |       |
        cc 11 2 + ----         ---- cc (11 - 10) 3
             |                             |
         ---- ----                          ---- 1
        |         |
  etc----          ---- cc (11 - 5) 2
                             |
                              ---- cc 6 2
                                     |
                                 ---- ----
                                |         |
                            cc 6 1 +       -------- cc (6 - 5) 2
                                |                          |
                        etc ---- ---- cc (6 - 1) 1          ---- cc 1 2
                                            |                       |
                                             etc                ---- ----
                                                              |         |
                                                         cc 1 1         cc 1 5
                                                           |               |
                                                       ---- ----            etc
                                                      |         |
                                                  cc 1 0      cc (1 - 1) 0
                                                     |              |
                                                     0              1

; Exercise 1.16
(define (fast-expt a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt a (square b) (/ n 2)))
        (else (fast-expt (* a b) b (- n 1)))))

;(fast-expt 1 2 3)
;(fast-expt 2 2 2)
;(fast-expt 2 4 1)
;(fast-expt 8 4 0)
;8

; Exercise 1.17
;(define (* a b)
;  (if (= b 0)
;      0
;      (+ a (* a (- b 1)))))

(define (double i)
  (+ i i))

(define (halve i)
  (/ i 2))

(define (fast-multi a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-multi (double a) (halve b)))
        (else
        (+ a (fast-multi a (- b 1))))))

; Exercise 1.18
(define (iml a b c)
   (cond ((= c 0) a)
         ((even? c) (iml a (double b) (halve c)))
         (else
           (iml (+ a b) b (- c 1)))))

; (iml 0 2 3)
; (iml 2 2 2)
; (iml 2 4 1)
; (iml 6 4 0)
; 6

; Exercise 1.19
; b = (bp + aq)
; b' = p(bp + aq) + q(bq + aq + ap)
; b' = bpp + apq + bqq + aqq + apq
; b' = bpp + 2apq + bqq + aqq
; b' = b(pp + qq) + a(2pq + qq)

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))


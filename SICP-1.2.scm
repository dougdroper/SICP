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


(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))
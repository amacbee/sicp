;; -*- coding: utf-8 -*-

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)                      ;; 3.00009155413138
(sqrt (+ 100 37))             ;; 11.704699917758145
(sqrt (+ (sqrt 2) (sqrt 3)))  ;; 1.7739279023207892
(square (sqrt 1000))          ;; 1000.000369924366

(sqrt 2)       ;; 1.4142156862745097
(sqrt 2.0e-6)  ;; 0.0312713096020622
(sqrt 2.0e24)  ;; 終わらない


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 改善してみた
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (sqrt x)
    (sqrt-iter 1.0 100.0 x))

(define (good-enough? guess x)
 (< (/ (abs (- guess x)) guess) 0.001))

(define (sqrt-iter guess pre_guess x)
  (if (good-enough? guess pre_guess)
      guess
      (sqrt-iter (improve guess x)
		 guess x)))

(sqrt 2.0e-6)  ;; 0.0014142135626178485
(sqrt 2.0e24)  ;; 1.4142135624174238e12

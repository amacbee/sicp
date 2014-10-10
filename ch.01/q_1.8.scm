;; -*- coding: utf-8 -*-

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))

(define (cubic x)
    (cubic-iter 1.0 100.0 x))

(define (good-enough? guess x)
 (< (/ (abs (- guess x)) guess) 0.001))

(define (cubic-iter guess pre_guess x)
  (if (good-enough? guess pre_guess)
      guess
      (cubic-iter (improve guess x)
		 guess x)))

(cubic 8)
(cubic 2.0e-6)
(cubic 2.0e24)

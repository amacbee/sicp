;; -*- coding: utf-8 -*-

;; 1.1.7 例: Newton法による平方根
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

;; new-if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(new-if (= 2 3) 0 5)  ;; 5
(new-if (= 1 1) 0 5)  ;; 0


;; Q. 平方根を計算するのに以下を利用するとどうなるか
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))

;; A. 無限ループになる
;;    ifは述語式を最初に評価し，その結果が帰結式と代替式のいずれを評価するかを決める
;;    これに対しcondは
(sqrt 9)

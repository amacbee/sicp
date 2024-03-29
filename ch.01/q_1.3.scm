;; -*- coding: utf-8 -*-

;; Q. 三つの数を引数としてとり，大きい二つの数の二乗の和を返す手続きを定義せよ

(define (f x y z)
  (cond ((and (< x y) (< x z)) (+ (* y y) (* z z)))
        ((and (< y z) (< y x)) (+ (* z z) (* x x)))
        (#t (+ (* x x) (* y y))))
  )

(f 1 2 3)  ;; 13
(f 2 1 3)
(f 3 2 1)

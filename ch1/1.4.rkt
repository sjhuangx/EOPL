#lang eopl

;; Exercise 1.4

;;---------------------------------------------------------
; Write a derivation from list-of-Int to (-7 . (3 . (14 . ())))

; List-of-Int
; => (Int . List-of-Inf)
; => (-7 . List-of-Int)
; => (-7 . (Int . List-of-Int))
; => (-7 . (3 . List-of-Int))
; => (-7 . (3 . (Int . List-of-Int)))
; => (-7 . (3 . (14 . List-of-Int)))
; => (-7 . (3 . (14 . ())))

;; Another derivation
; => List-of-Int
; => (Int . List-of-Int)
; => (Int . (Int . List-of-Int))
; => (Int . (Int . (Int .List-of-Int)))
; => (Int . (Int . (Int . ())))
; =? (Int . (Int . (14 . ())))
; => (Int . (3 . (14 . ())))
; => (-7 . (3 . (14 . ())))
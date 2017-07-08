#lang eopl

;; Exercise
;
; with a reversed order, nth-element would try to take the car
; of the empty list when called with a list which is 1 element
; too short.
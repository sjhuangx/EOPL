#lang eopl

(require "../../utils.rkt")

(define in-S?
    (lambda (n)
        (if (= n 0)
            #t
            (if (< n 3)
                #f
                (in-S? (- n 3))))))

(equal?? (in-S? 3) #t)
(equal?? (in-S? 4) #f)

;; 1.2.1 list-length
(define list-length
    (lambda (lst)
        (if (null? lst)
            0
            (+ 1 (list-length (cdr lst))))))

(equal?? (list-length '(a (b c) d)) 3)

;; 1.2.2 nth-element
;; List x Int -> SchemeVal
(define nth-element
    (lambda (lst n)
        (if (null? lst)
            (report-list-too-short n)
            (if (zero? n)
                (car lst)
                (nth-element (cdr lst) (- n 1))))))

(define report-list-too-short
    (lambda (n)
        (eopl:error 'nth-element
            "List too short by ~s elements.~%" (+ n 1))))

(define report-list-too-short-detail
    (lambda (lst n)
        (eopl:error 'nth-element
            "List ~s does not have ~s elements.~%" lst n)))

(equal?? (nth-element '(a b c d) 2) 'c)

;; 1.2.3 remove-first
;; Sym x Listof(Sym) -> Listof(Sym)
(define remove-first
    (lambda (s los)
        (if (null? los)
            '()
            (if (eqv? (car los) s)
                (cdr los)
                (cons (car los) (remove-first s (cdr los)))))))

(equal?? (remove-first 'a '(a b c)) '(b c))
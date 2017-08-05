#lang eopl

(require "../libs/utils.rkt")

; Exercise 1.23

(define list-index-ref
    (lambda (pred lst ref)
        (if (null? lst)
            #f
            (if (pred (car lst))
                ref
                (list-index-ref pred (cdr lst) (+ ref 1))))))

(define list-index
    (lambda (pred lst)
        (list-index-ref pred lst 0)))

(equal?? (list-index number? '(a 2 (1 3) b 7)) 1)
(equal?? (list-index symbol? '(a (b c) 17 foo)) 0)
(equal?? (list-index symbol? '(1 2 (a b) 3)) #f)
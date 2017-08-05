#lang eopl

(require "../libs/utils.rkt")

; Exercise 1.24

(define every?
    (lambda (pred lst)
        (if (null? lst)
            #t
            (if (pred (car lst))
                (every? (cdr lst))
                #f))))

(equal?? (every? number? '(a b c 3 e)) #f)
(equal?? (every? number? '(a b c d e 3)) #f)
(equal?? (every? number? '(a b c d e)) #f)
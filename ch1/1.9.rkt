#lang eopl

(require "../libs/utils.rkt")

;; Exercise 1.9

(define remove
    (lambda (s los)
        (if (null? los)
            '()
            (if (eqv? s (car los))
                (remove s (cdr los))
                (cons (car los) (remove s (cdr los)))))))

(equal?? (remove 'a '(a b c a e f)) '(b c e f))
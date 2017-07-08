#lang eopl

(require "../utils.rkt")

;; Exercise 1.15

(define duple
    (lambda (n x)
        (if (= n 0)
            '()
            (cons x (duple (- n 1) x)))))

(equal?? (duple 2 3) '( 3 3))
(equal?? (duple 4 '(ha ha)) '((ha ha) (ha ha) (ha ha) (ha ha)))
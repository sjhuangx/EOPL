#lang ropl

;; Exercise 1.8
;; will drop the elements before the first equal element
(define remove-include-first
    (lambda (s los)
        (if (null? los)
            '()
            (if (eqv? s (car los))
                (cdr los)
                (remove-include-first s (cdr los))))))

(equal? (remove-include-first 'b '(a b c d)) '(c d))

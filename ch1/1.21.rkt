#lang eopl

(require "../libs/utils.rkt")

;; Exercise 1.21

(define product-sym
    (lambda (s sos)
        (if (null? sos)
            '()
            (cons
                (list s (car sos))
                (product-sym s (cdr sos))))))

(define product
    (lambda (sos1 sos2)
        (if (null? sos1)
            '()
            (append
                (product-sym (car sos1) sos2)
                (product (cdr sos1) sos2)))))

(equal?? (product '(a b) '(x y))
    '((a x) (a y) (b x) (b y)))
(equal?? (product '(a b c) '(x y z))
    '((a x) (a y) (a z) (b x) (b y) (b z) (c x) (c y) (c z)))
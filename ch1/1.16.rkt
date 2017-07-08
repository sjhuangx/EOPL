#lang eopl

(require "../utils.rkt")

;; Exercise
(define invert-2-list
    (lambda (lst)
        (list (cadr lst) (car lst))))

(define invert
    (lambda (lst)
        (if (null? lst)
            '()
            (cons
                (invert-2-list (car lst))
                (invert (cdr lst))))))

(equal?? (invert '((a 1) (b 2) (1 b) (3 c)))
    '((1 a) (2 b) (b 1) (c 3)))
(equal?? (invert '((a 2))) '((2 a)))
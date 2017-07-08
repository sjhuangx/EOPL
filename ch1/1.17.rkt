#lang eopl

(require "../utils.rkt")

;; Exercise 1.17

(define down
    (lambda (lst)
        (if (null? lst)
            '()
            (if (not (pair? lst))
                (list lst)
                (cons (down (car lst))
                    (down (cdr lst)))))))

(equal?? (down '(1 2 3)) '((1) (2) (3)))
(equal?? (down '((a) (fine) (idea)))
    '(((a)) ((fine)) ((idea))))
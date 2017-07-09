#lang eopl

(require "../utils.rkt")

; Exercise 1.27

(define flatten
    (lambda (slist)
        (cond
            ((null? slist) '())
            ((not (pair? slist)) (list slist))
            (else (append (flatten (car slist))
                    (flatten (cdr slist)))))))

(equal?? (flatten '(a b c)) '(a b c))
(equal?? (flatten '(b ())) '(b))
(equal?? (flatten '((a b) c)) '(a b c))
(equal?? (flatten '(a b (() (c)))) '(a b c))
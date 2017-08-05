#lang eopl

(require "../libs/utils.rkt")

; Exercise 1.29
(define insert
    (lambda (lst elem)
        (if (null? lst)
            (list elem)
            (if (< elem (car lst))
                (cons elem lst)
                (cons (car lst)
                    (insert (cdr lst) elem))))))

(define sort-rec
    (lambda (prev now)
        (if (null? now)
            prev
            (sort-rec (insert prev (car now))
                (cdr now)))))

(define sort
    (lambda (loi)
        (sort-rec '() loi)))

(equal?? (sort '()) '())
(equal?? (sort '(1 2 3 4)) '(1 2 3 4))
(equal?? (sort '(4 3 2 1)) '(1 2 3 4))
(equal?? (sort '(1 4 5 2 3)) '(1 2 3 4 5))
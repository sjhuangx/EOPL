#lang eopl

(require "../libs/utils.rkt")

;; Exercise 1.30

(define insert
    (lambda (lst elem pred)
        (if (null? lst)
            (list elem)
            (if (pred elem (car lst))
                (cons elem lst)
                (cons (car lst)
                    (insert (cdr lst) elem pred))))))

(define sort-rec
    (lambda (prev now pred)
        (if (null? now)
            prev
            (sort-rec (insert prev (car now) pred)
                (cdr now) pred))))

(define sort/predicate
    (lambda (pred loi)
        (sort-rec '() loi pred)))

(equal?? (sort/predicate < '(1 2 3 4)) '(1 2 3 4))
(equal?? (sort/predicate > '(1 2 3 4)) '(4 3 2 1))
(equal?? (sort/predicate < '(8 2 5 2 3)) '(2 2 3 5 8))
(equal?? (sort/predicate > '(8 2 5 2 3)) '(8 5 3 2 2))
#lang eopl

(require "../libs/utils.rkt")

(provide interior-node leaf leaf? lson rson contents-of)

;; Exercise 1.31
(define interior-node
    (lambda (content lnode rnode)
        (list content lnode rnode)))

(define leaf
    (lambda (content)
        content))

(define leaf?
    (lambda (bintree)
        (not (pair? bintree))))

(define lson cadr)

(define rson caddr)

(define contents-of
    (lambda (bintree)
        (if (leaf? bintree)
            bintree
            (car bintree))))
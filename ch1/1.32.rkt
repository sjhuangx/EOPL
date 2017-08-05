#lang eopl

(require "../libs/utils.rkt")
(require "1.31.rkt")

; Exercise 1.32

(define double-tree
    (lambda (bintree)
        (if (leaf? bintree)
            (* 2 bintree)
            (interior-node (contents-of bintree)
                (double-tree (lson bintree))
                (double-tree (rson bintree))))))

(equal?? (double-tree (interior-node 'red
    (interior-node 'bar
        (leaf 26)
        (leaf 12))
    (interior-node 'red
        (leaf 11)
        (interior-node 'quux
            (leaf 117)
            (leaf 14)))))
    '(red (bar 52 24) (red 22 (quux 234 28))))
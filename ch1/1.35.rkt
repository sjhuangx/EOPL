#lang eopl

(require "../libs/utils.rkt")

(define leaf (lambda (n) n))
(define leaf? number?)
(define interior-node list)
(define interior-node? list?)
(define left cadr)
(define right caddr)

; Exercise 1.35

(define number-leaves-from
    (lambda (btree n)
        (cond
            ((null? btree) (list btree n))
            ((interior-node? btree)
                (let* ([lt (number-leaves-from (left btree) n)]
                    [rt (number-leaves-from (right btree) (cadr lt))])
                    (list (interior-node (car btree) (car lt) (car rt)) (cadr rt))))
            ((leaf? btree) (list n (+ n 1))))))

(define number-leaves
    (lambda (btree)
        (car (number-leaves-from btree 0))))

(equal?? (number-leaves 
    (interior-node 'foo
        (interior-node 'bar
            (leaf 26)
            (leaf 12))
        (interior-node 'baz
            (leaf 11)
            (interior-node 'quux
                (leaf 117)
                (leaf 14)))))
    '(foo
        (bar 0 1)
        (baz 2 (quux 3 4))))
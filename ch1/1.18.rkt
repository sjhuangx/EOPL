#lang eopl

(require "../libs/utils.rkt")

;; Exercise 1.18

(define swapper
    (lambda (s1 s2 lst)
        (if (null? lst)
            '()
            (let ((now (car lst)))
                (if (symbol? now)
                    (cond
                        ((equal? now s1)
                            (cons s2 (swapper s1 s2 (cdr lst))))
                        ((equal? now s2)
                            (cons s1 (swapper s1 s2 (cdr lst))))
                        (else
                            (cons now (swapper s1 s2 (cdr lst)))))
                    (cons
                        (swapper s1 s2 now)
                        (swapper s1 s2 (cdr lst))))))))

(equal?? (swapper 'a 'd '(a b c d)) '(d b c a))
(equal?? (swapper 'a 'd '(a d () c d))
    '(d a () c a))
(equal?? (swapper 'x 'y '((x) y (z x)))
    '((y) x (z y)))
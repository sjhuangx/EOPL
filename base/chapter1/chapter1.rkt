#lang eopl

(define in-S?
    (lambda (n)
        (if (= n 0)
            #t
            (if (< n 3)
                #f
                (in-S? (- n 3))))))
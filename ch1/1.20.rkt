#lang eopl

(require "../utils.rkt")

;; Exercise 1.20

(define count-occurrences
    (lambda (s slist)
        (cond
            ((null? slist) 0)
            ((symbol? slist)
                (if (equal? s slist) 1 0))
            (else (+ (count-occurrences s (car slist))
                (count-occurrences s (cdr slist)))))))

(equal?? (count-occurrences 'x '((f x) y (((x z) x)))) 3)
(equal?? (count-occurrences 'x '((f x) y (((x z) () x)))) 3)
(equal?? (count-occurrences 'w '((f x) y (((x z) x)))) 0)
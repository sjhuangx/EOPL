#lang eopl

(require "../../libs/utils.rkt")


;; Unary representation
(let ()
    (define zero (lambda () '()))
    (define is-zero? (lambda (n) (null? n)))
    (define successor (lambda (n) (cons #t n)))
    (define predecessor (lambda (n) (cdr n)))

    (define (plus x y)
        (if (is-zero? x)
            y
            (successor (plus (predecessor x) y))))

    (define (scheme-int->my-int n)
        (if (zero? n) (zero)
            (successor (scheme-int->my-int (- n 1)))))

    (define (my-int->scheme-int x)
        (if (is-zero? x) 0
            (+ 1 (my-int->scheme-int (predecessor x)))))

    (equal??
        (my-int->scheme-int
            (plus
                (scheme-int->my-int 3)
                (scheme-int->my-int 7)))
        10)

    (func-test (zero))
    (report-unit-tests-completed 'unary-representation)
)

;; scheme number representation
(let ()
    (define zero (lambda () 0))
    (define is-zero? (lambda (n) (= n 0)))
    (define successor (lambda (n) (+ n 1)))
    (define predecessor (lambda (n) (- n 1)))

    (define plus
        (lambda (x y)
            (if (is-zero? x)
                y
                (plus (predecessor x) (successor y)))))

    (equal?? (plus 3 7) 10)
    (report-unit-tests-completed 'scheme-number-representation)
)

;; bignum representation
(let ()
    (define zero (lambda () 7))
    (define is-zero? (lambda (n) (= n 7)))
    (define successor (lambda (n) (+ n 7)))
    (define predecessor (lambda (n) (- n 7)))

    (define plus
        (lambda (x y)
            (if (is-zero? x)
                y
                (plus (predecessor x) (successor y)))))

    (define scheme-int->my-int
        (lambda (n)
            (if (= n 0)
                (zero)
                (successor (scheme-int->my-int (- n 1))))))

    (define my-int->scheme-int
        (lambda (n)
            (if (is-zero? n)
                0
                (+ 1 (my-int->scheme-int (predecessor n))))))

    (equal??
        (my-int->scheme-int
            (plus
                (scheme-int->my-int 6)
                (scheme-int->my-int 5)))
        11)
    
    (report-unit-tests-completed 'bignum-respresentation)
)
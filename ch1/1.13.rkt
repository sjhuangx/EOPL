#lang eopl

(require "../libs/utils.rkt")

;; Exercise 1.13

(define subst-in-s-exp
    (lambda (new old sexp)
        (if (symbol? sexp)
            (if (eqv? old sexp) new sexp)
            (subst new old sexp))))

(define subst
    (lambda (new old slist)
        (if (null? slist)
            '()
            (map (lambda (item) (subst-in-s-exp new old item)) slist))))

(equal?? (subst 'a 'b '(a b c d)) '(a a c d))
(equal?? (subst 'a 'b '(a b b c)) '(a a a c))
(equal?? (subst 'a 'b '(b a c b f b)) '(a a c a f a))
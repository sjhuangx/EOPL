#lang eopl

(require "../libs/utils.rkt")

;; Exercise 1.12

(define subst
    (lambda (new old slist)
        (if (null? slist)
            '()
            (cons
                (let ((sexp (car slist)))
                    (if (symbol? sexp)
                        (if (eqv? sexp old)
                            new
                            sexp)
                        (subst new old sexp)))
                (subst new old (cdr slist))))))

;; test
(equal?? (subst 'a 'b '(a b c d)) '(a a c d))
(equal?? (subst 'a 'b '(a b b c)) '(a a a c))
(equal?? (subst 'a 'b '(b a c b f b)) '(a a c a f a))
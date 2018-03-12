#lang eopl

(define identifier? symbol?)

(define-datatype lc-exp lc-exp?
  (var-exp
   (var identifier?))
  (lambda-exp
   (bound-var identifier?)
   (body lc-exp?))
  (app-exp
   (rator lc-exp?)
   (rand lc-exp?)))

(define occurs-free?
  (lambda (search-var exp)
    (cases lc-exp exp
           (var-exp (var) (eqv? var search-var))
           (lambda-exp (bound-var body)
                       (and
                        (not (eqv? search-var bound-var))
                        (occurs-free? search-var body)))
           (app-exp (rator rand)
                    (or
                     (occurs-free? search-var rator)
                     (occurs-free? search-var rand))))))

(define-datatype s-list s-list?
  (empty-s-list)
  (non-empty-s-list
   (first s-exp?)
   (rest s-list?)))

(define-datatype s-exp s-exp?
  (symbol-s-exp
   (sym symbol?))
  (s-list-s-exp
   (slist s-list?)))

(define-syntax while
  (syntax-rules ()
    ((_ condition . body)
     (let loop ()
       (cond (condition
	      (begin . body)
	      (loop)))))))

(define h (make-hash))

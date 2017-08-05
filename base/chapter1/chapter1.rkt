#lang eopl

(require "../../libs/utils.rkt")

(define in-S?
    (lambda (n)
        (if (= n 0)
            #t
            (if (< n 3)
                #f
                (in-S? (- n 3))))))

(equal?? (in-S? 3) #t)
(equal?? (in-S? 4) #f)

;; 1.2.1 list-length
(define list-length
    (lambda (lst)
        (if (null? lst)
            0
            (+ 1 (list-length (cdr lst))))))

(equal?? (list-length '(a (b c) d)) 3)

;; 1.2.2 nth-element
;; List x Int -> SchemeVal
(define nth-element
    (lambda (lst n)
        (if (null? lst)
            (report-list-too-short n)
            (if (zero? n)
                (car lst)
                (nth-element (cdr lst) (- n 1))))))

(define report-list-too-short
    (lambda (n)
        (eopl:error 'nth-element
            "List too short by ~s elements.~%" (+ n 1))))

(define report-list-too-short-detail
    (lambda (lst n)
        (eopl:error 'nth-element
            "List ~s does not have ~s elements.~%" lst n)))

(equal?? (nth-element '(a b c d) 2) 'c)

;; 1.2.3 remove-first
;; Sym x Listof(Sym) -> Listof(Sym)
(define remove-first
    (lambda (s los)
        (if (null? los)
            '()
            (if (eqv? (car los) s)
                (cdr los)
                (cons (car los) (remove-first s (cdr los)))))))

(equal?? (remove-first 'a '(a b c)) '(b c))

;; occurs-free?
(define occurs-free?
    (lambda (var exp)
        (cond
            ((symbol? exp) (eqv? var exp))
            ((eqv? (car exp) 'lambda)
             (and
                (not (eqv? var (car (cadr exp))))
                (occurs-free? var (caddr exp))))
            (else
              (or
                (occurs-free? var (car exp))
                (occurs-free? var (cadr exp)))))))
    
(equal?? (occurs-free? 'x 'x) #t)
(equal?? (occurs-free? 'y 'x) #f)
(equal?? (occurs-free? 'x '(lambda (x) (x y))) #f)
(equal?? (occurs-free? 'x '(lambda (y) (x y))) #t)
(equal?? (occurs-free? 'x '((lambda (x) x) (x y))) #t)
(equal?? (occurs-free? 'x '(lambda (y) (lambda (z) (x (y z))))) #t)

;;subst
(define subst
    (lambda (new old slist)
        (if (null? slist)
            '()
            (cons
                (subst-in-s-exp new old (car slist))
                (subst new old (cdr slist))))))

(define subst-in-s-exp
    (lambda (new old sexp)
        (if (symbol? sexp)
            (if (eqv? sexp old) new sexp)
            (subst new old sexp))))

(equal?? (subst 'a 'b '(a b c d)) '(a a c d))
(equal?? (subst 'a 'b '(a b b c)) '(a a a c))
(equal?? (subst 'a 'b '(b a c b f b)) '(a a c a f a))

;; number-element-from
(define number-element-from
    (lambda (lst n)
        (if (null? lst)
            '()
            (cons
                (list n (car lst))
                (number-element-from (cdr lst) (+ n 1))))))
(define number-elements
    (lambda (lst)
        (number-element-from lst 0)))

(equal?? (number-elements '(a b c d)) '((0 a) (1 b) (2 c) (3 d)))
(equal?? (number-elements '(a b c)) '((0 a) (1 b) (2 c)))

;; list-sum
(define list-sum
    (lambda (loi)
        (if (null? loi)
            0
            (+ (car loi)
                (list-sum (cdr loi))))))
(equal?? (list-sum '(1 2 3 4)) 10)
(equal?? (list-sum '(5 6 7)) 18)

;; vector-sum
(define partial-vector-sum
    (lambda (v n)
        (if (zero? n)
            (vector-ref v 0)
            (+ (vector-ref v n)
                (partial-vector-sum v (- n 1))))))

(define vector-sum
    (lambda (v)
        (let ((n (vector-length v)))
            (if (zero? n)
                0
                (partial-vector-sum v (- n 1))))))

(equal?? (vector-sum (vector 1 2 3 4 5)) 15)
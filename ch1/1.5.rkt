#lang eopl

;; Exercise 1.5

;;------------------------------------------------------
; LxExp ::= Identifier
;       ::= (lambda (Identifier) LcExp)
;       ::== (LcExp LcExp)
;
; 1) if e is the form Identifier
;       There 0 parentheses, therefore they are balanced
; 2) if e ss the form (lambda (Identifier) LcExp)
;       LcExp has n opening/closing parentheses, then e has n+2 
;       opening/closing parentheses, therefore they are balanced
; 3) if e ss the form (LcExp LcExp)
;       If the first LcExp has n opening/closing parentheses and
;       the second LcExp has m opening/closing parentheses, e has
;       n+m+1 parentheses opensing/closing parentheses.
; So we can proof that if e is LcExp, then there are the same number
; of left and right parentheses in e.
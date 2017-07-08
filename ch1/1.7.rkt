#lang eopl

;; Exercise
; following is the new report preducure which
; can show more information about error.
(define report-list-too-short-detail
    (lambda (lst n)
        (eopl:error 'nth-element
            "List ~s does not have ~s elements.~%" lst n)))
#lang eopl
;; define util for eopl

(provide equal?? func-test report-unit-tests-completed)

;; show detail when not equal?
(define-syntax equal??
    (syntax-rules ()
        ((_ test-exp correct-ans)
         (let ((observed-ans test-exp))
            (when (not (equal? observed-ans correct-ans))
                (eopl:printf "~s returned ~s, should have returned ~s~%"
                    'test-exp
                    observed-ans
                    correct-ans))))))

(define func-test
    (lambda (exp)
        (let ((ans exp))
            (eopl:printf "func ~a result: ~a~%" exp ans))))

(define report-unit-tests-completed
    (lambda (fn-name)
        (eopl:printf "unit tests completed: ~s~%" fn-name)))
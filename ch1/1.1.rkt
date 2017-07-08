#lang eopl

;; Exercise 1.1

;;--------------------------------------------------------
; exercise 1.1.1
; {3n+2 | n in N} = {2, 5, 8, ...}
;
; top-down: A natural number n is in S if and only if
;   1) n = 2 or
;   2) n - 3 in S
;
; bottom-up: Define the set of S to be the smallest set
; contained in N and statisfying the following 2 conditions:
;   1) 2 in S, and
;   2) if n in S, then n+3 in S
;
; rules of inference
;                n in S
;  ---------   -----------
;   2 in S      n-3 in S

;;----------------------------------------------------------
; exercise 1.1.2
; {2n+3m+1 | n, m in N} =  {1, 3, 5, 7, ...
;                           4, 6, 8, 10, ...}
; top-down: A natural number in S if and only if
;   1) 1 in S, or
;   2) n-2 in S, or
;   3) n-3 in S
;
; bottom-up: Define the set of S to be the smallest set
; contained in N and statisfying the following 3 conditions
;   1) 1 in S
;   2) if n in S, then n+2 in S
;   3) if n  in S, then n+3 in S
;
; rules of reference
;                n in S        n in S
;  -------     ---------     ----------
;   1 in S      n-2 in S      n-3 in S

;;---------------------------------------------------------
; exercise 1.1.3
; {(n, 2n+1) | n in N} = {(0,1), (1,3), (,2,5), (3,7), (4,9), ...}
;
; top-down: A pair of natural number (n,m) in S if and only if
;   1) (n,m) = (0,1), or
;   2) (n-1, m-2) in S
;
; bottom-up: Define the set S to be the smallest set contained in N
; and statisfying the following 2 conditions
;   1) (0,1) in S
;   2) if (n,m) in S, then (n+1, m+2) in S
;
; rules of reference
;                   (n,m) in S
;  -----------  -----------------
;   (0,1) in S   (n-1, m-2) in S

;;-----------------------------------------------------------
; exercise 1.1.4
; {(n,n^2) | n in N} = {(0,0), (1,1), (2,4), (3,9), ...}
;
; top-down: A pair of natural number (n,m) in S if and only if
;   1) (0,0) in S
;   2) (n-1, m-2n+1) in S
; bottom-up: Define the set S to be the smallest set contained
; in N and statisfying the following 2 conditions:
;   1) (0,0) in S, and
;   2) if (n, m) in S, then (n+1, m+2n+1) in S
; rules of reference
;                       (n,m) in S
;  ------------    --------------------
;   (0,0) in S      (n-1, m-2n+1) in S
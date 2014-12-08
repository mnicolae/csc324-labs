#lang racket
; Non-recursive macro for "or"
(define-syntax my-or
  (syntax-rules ()
    [(my-or p q)
     (if p #t q)]))

; Macro for "and"
(define-syntax my-and
  (syntax-rules ()
    [(my-and p q)
     (if p (if q #t #f) #f)]))

; Recursive macro for "or"
(define-syntax my-or-rec
  (syntax-rules ()
    [(my-or-rec p) p]
    [(my-or-rec p q ...)
     (if p #t (my-or-rec q ...))]))

; Recursive macro for "cond"
; Recall the cond syntax
; (cond [c1 x]
;       [c2 y]
;       [c3 z]
;       [else w])
(define-syntax my-cond
  (syntax-rules (else)
    [(my-cond [else val]) val]
    [(my-cond [test val]) (if (test val) (void))]
    [(my-cond [test val] next-pair ...)
     (if test val (my-cond next-pair ...))]))

; Tests
;(my-or (> 10 3) (/ 1 0))
;(my-and (> 10 3) (> 1 0))
;(my-or-rec (< 10 3) (< 1 0) (> 1 0))
;(my-cond [(< 1 0) 3] [(= 3 (string-length "hello")) 2] [else 1])

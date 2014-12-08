#lang racket
(define-syntax my-or
  (syntax-rules ()
    [(my-or p q)
     (if p #t q)]))

; Write a macro for "my-and"
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

; Tests
;(my-or (> 10 3) (/ 1 0))
;(my-and (> 10 3) (> 1 0))
;(my-or-rec (< 10 3) (< 1 0) (> 1 0))

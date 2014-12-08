#lang racket
(define-syntax my-or
  (syntax-rules ()
    [(my-or p q)
     (if p #t q)]))

(my-or (> 10 3) (/ 1 0))


; Write a macro for "my-and"



; Recursive macro for "or"
(define-syntax my-or-rec
  (syntax-rules ()
    [(my-or-rec p) p]
    [(my-or-rec p q ...)
     (if p #t (my-or-rec q ...))]))

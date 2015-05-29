; e. 2.17 last-pair
; @iterative
(define (last-pair items)
  (if (null? (cdr items))
    items
    (last-pair (cdr items))))

; e. 2.18 reverse.
; @iterative
(define (reverse items)
  (define (iter orig reversed)
    (if (null? orig)
      reversed
      (iter (cdr orig)
            (cons (car orig) reversed))))
  (iter items '()))


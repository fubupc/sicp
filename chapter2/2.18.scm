; e. 2.18 reverse.
; @iterative
(define (reverse items)
  (define (iter orig reversed)
    (if (null? orig)
      reversed
      (iter (cdr orig)
            (cons (car orig) reversed))))
  (iter items '()))

; recursive
(define (remove-last items)
  (if (null? (cdr items))
    '()
    (cons (car items)
          (remove-last (cdr items)))))

(define (reverse items)
  (if (null? items)
    '()
    (cons (car (last-pair items))
          (reverse (remove-last items)))))


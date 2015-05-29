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

; exec. 2.20
(define (even? n)
  (= 0 (modulo n 2)))


(define (same-parity x . w)
  (define (iter even items)
    (if (null? items)
      '()
      (if (eq? even (even? (car items)))
        (cons (car items)
              (iter even (cdr items)))
        (iter even (cdr items)))))

  (iter (even? x) w))

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

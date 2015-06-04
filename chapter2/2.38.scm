(define (fold-left op initial seq)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op (car items) result)
            (cdr rest))))
  (iter seq initial))


; 2.38
(fold-right / 1 (list 1 2 3)) ; 2 / 3
(fold-left / 1 (list 1 2 3)) ; 1 / 6

(fold-right list nil (list 1 2 3)); (list 1 (list 2 (list 3 '()))) => (1 (2 (3 ())))
(fold-left list nil (list 1 2 3));  (list (list (list 1 '()) 2) 3) => (((1 ()) 2) 3)

; should satisfy left-associative = right-associative



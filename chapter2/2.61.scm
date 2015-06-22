(define (adjoint-set x set)
  (if (null? set)
    (list x)
    (let ((first (car set)))
        (cond ((= x first) set)
              ((< x first) (cons x set))
              (else (cons first (adjoint-set x (cdr set))))))))


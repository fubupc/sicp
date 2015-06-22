(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
    '()
    (let ((v1 (car set1))
          (v2 (car set2)))
      (cond ((= v1 v2) (cons v1 (intersection-set (cdr set1) (cdr set2))))
            ((< v1 v2) (intersection-set (cdr set1) set2))
            ((> v1 v2) (intersection-set set1 (cdr set2)))))))


(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
          (let ((v1 (car set1))
                (v2 (car set2)))
            (cond ((= v1 v2) (cons v1 (union-set (cdr set1) (cdr set2))))
                  ((< v1 v2) (cons v1 (union-set (cdr set1) set2)))
                  ((> v1 v2) (cons v2 (union-set set1 (cdr set2)))))))))

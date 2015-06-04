(define (reverse seq)
  (fold-left (lambda (result item) (cons item result)) '() seq))

(define (reverse seq)
  (fold-right (lambda (item rest) (append rest (list item))) '() seq))


(define (fold-left op initial seq)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest))))
  (iter initial seq))

(define (fold-right op initial seq)
  (if (?null seq)
    initial
    (op (car seq)
        (fold-right (cdr seq)))))


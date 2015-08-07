(define (memoize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((found (lookup x table)))
        (or found
            (let ((result (f x)))
              (insert! x result table)
              result))))))

; naive version.
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else
          (+ (fib (- n 1))
             (fib (- n 2))))))

(define memo-fib (memoize fib))

; version 1
(define memo-fib
  (memoize
    (lambda (n)
      (cond ((= n 0) 0)
            ((= n 1) 1)
            (else
              (+ (memo-fib (- n 1))
                 (memo-fib (- n 2))))))))


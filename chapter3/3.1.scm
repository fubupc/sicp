(define (make-accumulator sum)
  (lambda (n)
    (begin (set! sum (+ sum n))
           sum)))


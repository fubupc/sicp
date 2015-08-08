(define (make-zero-crossings s)
  (define (iter last s)
    (cons-stream (sign-change-detector last (stream-car s))
                 (iter (stream-car s) (stream-cdr s))))

  (cons-stream 0 (iter (stream-car s) (stream-cdr s))))


(define zero-crossings
  (stream-map sign-change-detector
              sense-data
              (cons-stream 0 sense-data)))


(define (stream-map proc . argsstreams)
  (if (empty-stream? (car argsstreams))
    the-empty-stream
    (cons-stream
      (apply proc (map stream-car argsstreams))
      (apply stream-map
             (cons proc (map stream-cdr argsstreams))))))


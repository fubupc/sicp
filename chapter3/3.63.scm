(define (improve-guess guess x)
  (/ (+ guess
        (/ x guess))
     2))


(define (sqrt-square x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess) (improve-guess guess x))
                             guesses)))
  guesses)


(define (sqrt-square x)
  (cons-stream 1.0 (stream-map (lambda (guess) (improve-guess guess x))
                               (sqrt-square x))))


(apply proc (stream-car (sqrt-square x)))

(stream-map proc (stream-cdr (sqrt-square x)))

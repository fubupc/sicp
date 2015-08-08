(define integers
  (cons-stream 1 (stream-map (lambda (n) (+ n 1)) integers)))

(define (sum-pair pair)
  (+ (square (car pair)) (square (cadr pair))))

(define pair-sums
  (stream-map sum-pair (weighted-pairs integers integers sum-pair)))

(define square-sum
  (consecutive-equal pair-sums 3))



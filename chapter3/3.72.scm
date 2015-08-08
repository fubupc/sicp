(define integers
  (cons-stream 1 (stream-map (lambda (n) (+ n 1)) integers)))

(define (sum-pair pair)
  (+ (square (car pair)) (square (cadr pair))))

(define square-sums
  (stream-map (lambda (seq)
                (cons (sum-pair (car seq)) seq))
              (consecutive-equal (weighted-pairs integers integers sum-pair) sum-pair 3)))


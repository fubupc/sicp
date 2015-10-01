(define (averager a b c)
  (let ((m (make-connector)) (n (make-connector)))
    (adder a b m)
    (multiplier c n m)
    (constant n 2)))


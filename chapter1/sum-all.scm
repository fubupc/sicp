(define (sum-all fn x y _step)
  (define (iter a b)
    (if (> a b)
      0
      (+ (fn a)
         (iter (+ a _step) b))))
  (iter x y))

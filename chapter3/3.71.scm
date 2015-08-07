(define (power x n)
  (if (= n 0)
    1
    (* x (power x (- n 1)))))

(define (calc pair)
  (+ (power (car pair) 3)
     (power (cadr pair) 3)))

(define (ramanujan-numbers)
  (define cube-sums
    (weighted-pairs integers
                    integers
                    calc))
  (consecutive-equal (stream-map calc cube-sums) 2))


(define (consecutive-equal s repeat)
  (define (iter current count s)
    (let ((next (stream-car s)))
      (if (= current next)
        (iter current (+ count 1) (stream-cdr s))
        (if (>= count repeat)
          (cons-stream current
                       (iter next 1 (stream-cdr s)))
          (iter next 1 (stream-cdr s))))))

  (iter (stream-car s) 1 (stream-cdr s)))


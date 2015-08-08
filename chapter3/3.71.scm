(define (power x n)
  (if (= n 0)
    1
    (* x (power x (- n 1)))))

(define (cube-sum pair)
  (+ (power (car pair) 3)
     (power (cadr pair) 3)))

(define (ramanujan-numbers)
  (define ordered-pairs
    (weighted-pairs integers
                    integers
                    cube-sum))
  (stream-map (lambda (seq)
                (cons (cube-sum (car seq)) seq))
              (consecutive-equal ordered-pairs cube-sum 2)))


(define (consecutive-equal stream calc repeat-times)
  (define (iter current seq count s)
    (let ((next (stream-car s)))
      (if (= current (calc next))
        (iter current (cons next seq) (+ count 1) (stream-cdr s))
        (if (>= count repeat-times)
          (cons-stream seq
                       (iter (calc next) (list next) 1 (stream-cdr s)))
          (iter (calc next) (list next) 1 (stream-cdr s))))))

  (iter (calc (stream-car stream)) (list (stream-car stream)) 1 (stream-cdr stream)))


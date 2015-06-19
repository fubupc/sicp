; iterative.
(define (f n)
	(f-iter 2 1 0 n))

(define (f-iter x y z count)
	(if (= count 0)
		z
		(f-iter (+ x
				   (* y 2)
				   (* z 3))
		        x
		        y
		        (- count 1))))

; recursive
(define (f n)
	(cond ((= n 0) 0)
		  ((= n 1) 1)
		  ((= n 2) 2)
          (else (+ (f (- n 1))
          	       (* 2 (f (- n 2)))
          	       (* 3 (f (- n 3)))))))

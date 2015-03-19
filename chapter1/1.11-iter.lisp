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
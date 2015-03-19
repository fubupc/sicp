(define (sqrt-iter guess x)
	(if (good-enough? guess (improve guess x))
		guess
		(sqrt-iter (improve guess x)
			       x)))

(define (abs x)
	(if (> x 0)
		x
		(- 0 x)))
 
(define (improve guess x)
	(/ (+ guess (/ x guess))
	   2))

(define (good-enough? guess improved-guess)
		(< (/ (abs (- improved-guess guess))
		      guess)
	       0.001))
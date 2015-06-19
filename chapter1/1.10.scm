; (define (f n) (A 0 n)) => f(n) = 2 * n

; (define (g n) (A 1 n))
;   -> (A (- 1 1) (A 1 (- n 1)))
;   -> (A 0 (A 1 (- n 1)))
;   -> (* 2 (A 1 (- n 1))
;   -> (* 2 2 ... 2 (A 1 0))
;   -> (expt 2 n)

; (define (h n) (A 2 n)) 
;   -> (A (- 2 1) (A 2 (- n 1)))
;   -> (A 1 (A 2 (- n 1)))
;   -> (expt 2 (A 2 (- n 1)))
;   -> (expt 2 (expt 2 ... (expt 2 (A 2 1))))
;   -> (expt 2 (expt 2 ... (expt 2 2)))

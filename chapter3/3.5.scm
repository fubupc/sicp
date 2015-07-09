(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral predicate x1 y1 x2 y2 trials)
  (define (rect-area x1 y1 x2 y2)
    (* (- x1 x2) (- y1 y2)))

  (define (iter)
    (let ((x (random-in-range x2 x1))
          (y (random-in-range y2 y1)))
      (predicate x y)))

  (* (rect-area x1 y1 x2 y2)
     (monte-carlo trials iter)))

(define (unit-circle x y)
  (<= (+ (* x x) (* y y)) 1))

(define (estimate-pi trials)
  (estimate-integral unit-circle 1 1 -1 -1 trials))


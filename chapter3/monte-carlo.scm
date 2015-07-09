(define (monte-carlo trials experiment)
  (define (iter remaining passed)
    (if (= remaining 0)
      (/ passed trials)
      (let ((result (experiment)))
        (if result
          (iter (- remaining 1) (+ passed 1))
          (iter (- remaining 1) passed)))))
  (iter trials 0))


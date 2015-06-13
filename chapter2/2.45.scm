(define (split first second)
  (define (inner painter n)
    (if (= n 0)
      painter
      (let (quart (inner painter (- n 1)))
        (first painter (second quart quart)))))
  inner)

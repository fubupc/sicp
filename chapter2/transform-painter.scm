; counterclockwise 90 deg.

(define rotate-90
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 1 1)
                     (make-vect 0 0)))

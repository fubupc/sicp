
(define (square x y)
        (+ (* x x)
           (* y y)))

(define (bigsquare x y z)
        (if (> x y)
            (if (> y z)
                (square x y)
                (square x z))
            (if (> x z)
                (square x y)
                (square y z))))

(define (bigsquare2 x y z)
        (cond ((and (> x z)
                    (> y z)) (square x y))
              ((and (> x y)
                    (> z y)) (square x z))
              ((and (> y x)
                    (> z x)) (square y z))))


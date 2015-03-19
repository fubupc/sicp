
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


1.5


normal-order evaluation:
-> (if (= x 0)
       0
       y)

-> (if (= 0 0)
       0
       (p))
-> 0


applicative-order evaluation:
-> (test 0 p)
-> (if (= 0 0)
       0
       p)
-> 0


1.6 
infinite recursive
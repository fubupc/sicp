(define (merge-weighted s t weight)
  (cond ((empty-stream? s) t)
        ((empty-stream? t) s)
        (else
          (if (< (weight (stream-car s))
                 (weight (stream-car t)))
            (cons-stream (stream-car s)
                         (merge-weighted (stream-cdr s) t weight))
            (cons-stream (stream-car t)
                         (merge-weighted s (stream-cdr t) weight))))))

(define (weighted-pairs s t weight)
  (cons-stream (list (stream-car s)
                     (stream-car t))
               (merge-weighted
                 (stream-map (lambda (j) (list (stream-car s) j))
                             (stream-cdr t))
                 (weighted-pairs (stream-cdr s)
                                 (stream-cdr t)
                                 weight)
                 weight)))

; a. the stream of all pairs of positive integers (i,j) with i <= j ordered according to the sum i + j.
(define sum-order
  (weighted-pairs
    integers
    integers
    (lambda (pair) (+ (car pair) (cadr pair)))))

; b.
(define (divisible? x y)
  (= 0 (remainder x y)))


(define not-divisible-by-235
  (stream-filter (lambda (x) 
                   (and (not (divisible? x 2))
                        (not (divisible? x 3))
                        (not (divisible? x 5))))
                 integers))

(define b-series
  (weighted-pairs
    not-divisible-by-235
    not-divisible-by-235
    (lambda (pair)
      (+ (* 2 (car pair))
         (* 3 (cadr pair))
         (* 5 (car pair) (cadr pair))))))



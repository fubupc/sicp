(define integers
  (cons-stream 1
               (stream-map (lambda (n) (+ 1 n)) integers)))

(define (interleave s t)
  (cons-stream (stream-car s)
               (interleave t (stream-cdr s))))

(define (pairs S T)
  (cons-stream (list (stream-car S)
                     (stream-car T))
               (interleave
                 (stream-map (lambda (j)
                               (list (stream-car S) j))
                             (stream-cdr T))
                 (pairs (stream-cdr S)
                        (stream-cdr T)))))

(define (triple S T U)
  (cons-stream (list (stream-car S)
                     (stream-car T)
                     (stream-car U))
               (interleave
                 (stream-map (lambda (pair)
                               (cons (stream-car S) pair))
                             (stream-cdr (pairs T U)))
                 (triple (stream-cdr S)
                         (stream-cdr T)
                         (stream-cdr U)))))

(define pythagoreans
  (stream-filter (lambda (t)
                   (= (+ (square (car t))
                         (square (cadr t)))
                      (square (caddr t))))
                 (triple integers integers integers)))

;; PS: above solution seems very inefficient.
;; in Windows 7. mit-scheme report out-of-memory error when
;; evaluate (stream-ref pythagoreans 5)


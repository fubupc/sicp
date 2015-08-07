(define integers
  (cons-stream 1
               (stream-map (lambda (x) (+ 1 x))
                           integers)))

(define (interleave . streams)
  (cons-stream (stream-car (car streams))
               (apply interleave 
                      (append (cdr streams)
                              (list (stream-cdr (car streams)))))))


(define (pairs S T)
  (cons-stream (list (stream-car S)
                     (stream-car T))
               (interleave
                 (stream-map (lambda (j) (list (stream-car S) j))
                             (stream-cdr T))
                 (stream-map (lambda (i) (list i (stream-car T)))
                             (stream-cdr S))
                 (pairs (stream-cdr S) (stream-cdr T)))))


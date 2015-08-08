
(define (smooth stream)
  (stream-map (lambda (x y) (/ (+ x y) 2))
              stream
              (cons-stream 0 stream)))


(define (make-zero-scrossings smooth input-stream)
  (stream-map sign-change-detector
              (smooth input-stream)
              (cons-stream 0 (smooth input-stream))))


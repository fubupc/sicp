(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product w v)) m))

; wrong!
(define (matrix-*-matrix m n)
  (map (lambda (v) (matrix-*-vector m v))
       (transpose n)))

(define (transpose m)
  (if (null? (car m))
    '()
    (cons (map (lambda (v) (car v)) m)
          (transpose (map (lambda (v) (cdr v)) m)))))


(define (matrix-*-matrix m n)
  (if (null? (car n))
    '()
    (cons (matrix-*-vector m (map (lambda (v) (car v)) n))
          (matrix-*-matrix m (map (lambda (v) (cdr v)) n)))))



; new
(define (transpose mat)
  (accumulate-n list '() mat))


(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector cols v)) m)))


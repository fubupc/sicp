; recursive
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

; iterative
(define (accumulate op initial sequence)
  (define (acc-iter items result)
    (if (null? items)
      result
      (acc-iter (cdr items)
                (op (car items) result))))
  (acc-iter sequence initial))

; 2.33
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

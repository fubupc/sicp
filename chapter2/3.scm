; e.2.21

(define (square-list items)
  (if (null? items)
    '()
    (cons ((lambda (x) (* x x)) (car items))
          (square-list (cdr items)))))

(define (square-list2 items)
  (define (iter items result)
    (if (null? items)
      result
      (iter (cdr items)
            (cons ((lambda (x) (* x x)) (car items))
		  result))))
  (iter items '()))


(define (count-pairs seq)

  (define (lst-in? lst records)
    (cond ((null? records) false)
          ((eq? (car records) lst) true)
          (else (lst-in? lst (cdr records)))))

  (define (count-iter counted lst)
    (cond ((not (pair? lst)) 0)
          ((lst-in? counted lst) 0)
          (else
            (+ (count-iter (cons lst counted) (car lst))
               (count-iter (cons lst counted) (cdr lst))
               1))))

  (count-iter '() seq))

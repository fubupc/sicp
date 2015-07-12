(define (has-cycle? seq)

  (define (lst-in? lst records)
    (cond ((null? records) false)
          ((eq? (car records) lst) true)
          (else (lst-in? lst (cdr records)))))

  (define (has-cycle-1? processed lst)
    (cond ((not (pair? lst)) false)
          ((lst-in? lst processed) true)
          (else
            (or (has-cycle-1? (cons lst processed) (car lst))
                (has-cycle-1? (cons lst processed) (cdr lst))))))

  (has-cycle-1? '() seq))

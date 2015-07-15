(define (make-table compare)
  (let ((table (list '*table*)))
    (define (assoc key table)
      (cond ((null? table) false)
            ((compare key (caar table)) (car table))
            (else
              (assoc key (cdr table)))))

    (define (lookup key)
      (let ((record (assoc key (cdr table))))
        (if record
          (cdr record)
          false)))


    (define (insert key value)
      (let ((record (assoc key (cdr table))))
        (if record
          (set-cdr! record value)
          (set-cdr! table
                    (cons (cons key value)
                          (cdr table))))))

    (define (dispatch m)
      (cond ((eq? m 'insert) insert)
            ((eq? m 'lookup) lookup)
            (else (error "error command" m))))

    dispatch))

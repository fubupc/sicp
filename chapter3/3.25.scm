(define (make-table) (list '*table*))

(define (equal? x y)
  (cond ((and (symbol? x) (symbol? y)) (eq? x y))
        ((and (number? x) (number? y)) (= x y))
        ((and (null? x) (null? y)) true)
        ((and (pair? x) (pair? y))
         (and (equal? (car x) (car y))
              (equal? (cdr x) (cdr y))))
        (else false)))


(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (caar records))
         (car records))
        (else
          (assoc key (cdr records)))))


(define (lookup keys table)
  (define (lookup-1 keys table)
    (if (null? keys)
      table
      (let ((subtable (assoc (car keys) table)))
        (if subtable
          (lookup-1 (cdr keys) (cdr subtable))
          false))))

  (lookup-1 keys (cdr table)))

(define (insert keys value table)
  (cond ((null? keys) (error "keys empty"))
        ((= (length keys) 1)
         (let ((subtable (assoc (car keys) (cdr table))))
           (if subtable
             (set-cdr! subtable value)
             (set-cdr! table (cons (cons (car keys) value)
                                   (cdr table))))))
        (else
          (let ((subtable (assoc (car keys) (cdr table))))
            (if subtable
              (insert (cdr keys) value subtable)
              (let ((new-table (cons (car keys) '()))) 
                (set-cdr! table (cons new-table (cdr table)))
                (insert (cdr keys) value new-table)))))))





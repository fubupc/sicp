(define (make-table) (list '*table*))

(define (equal? x y)
  (cond ((and (symbol? x) (symbol? y)) (eq? x y))
        ((and (number? x) (number? y)) (= x y))
        ((and (null? x) (null? y)) true)
        ((and (pair? x) (pair? y))
         (and (equal? (car x) (car y))
              (equal? (cdr x) (cdr y))))
        (else false)))


(define (assoc key table)
  (cond ((null? table) false)
        ((equal? key (caar table))
         (car table))
        ((else
           (assoc key (cdr table))))))


(define (lookup keys table)
  (define (lookup-1 keys table)
    (if (null? keys)
      table
  0)

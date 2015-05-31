; exercise 2.32

(define (sub-sets items)
  (if (null? (cdr items))
    (list '() items)
    (append (sub-sets (cdr items))
            (map (lambda (sub-set)
                   (cons (car items) sub-set))
                 (sub-sets (cdr items))))))

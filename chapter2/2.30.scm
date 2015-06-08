; 2.30 directly
(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

; 2.30 map & recursion
(define (square-tree tree)
  (map (lambda (items)
         (if (not (pair? items))
           (* items items)
           (square-tree items)))
       tree))


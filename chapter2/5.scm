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


; 2.31

(define (tree-map fn tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (tree-map sub-tree)
           (fn sub-tree)))))

(define (sqaure-tree tree) (tree-map square tree))

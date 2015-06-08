; 2.31

(define (tree-map fn tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (tree-map sub-tree)
           (fn sub-tree)))))

(define (sqaure-tree tree) (tree-map square tree))

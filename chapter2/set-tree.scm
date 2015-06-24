(define (entry tree) (car tree))
(define (left-tree tree) (cadr tree))
(define (right-tree tree) (caddr tree))

; order of growth
(define (tree->list1 tree)
  (if (null? tree)
    '()
    (append (tree->list1 (left-tree tree))
            (cons (entry tree) (tree->list1 (right-tree tree))))))

; order of growth: 3n + 1
(define (tree->list2 tree)
  (define (copy-to-list tree result)
    (if (null? tree)
      result
      (copy-to-list (left-tree tree)
                    (cons (entry tree)
                          (copy-to-list (right-tree tree)
                                        result)))))
  (copy-to-list tree '()))


(define t1 '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))
(define t2 '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ())))))
(define t3 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))


(tree->list1 t1)
(tree->list2 t1)
(tree->list1 t2)
(tree->list2 t2)
(tree->list1 t3)
(tree->list2 t3)

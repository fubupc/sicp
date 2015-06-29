; leaf: ('leaf symbol weight)
; tree: (left-tree right-tree symbols weight)
(define (encode-symbol symb tree)
  (if (leaf? tree)
    (cond ((eq? (leaf-symbol tree) symb)
    (if (eq? (leaf-symbol tree) symb) 0 1)
    (let ((l-tree (left-tree tree))
          (r-tree (right-tree tree)))
      (let ((left-symbols (tree-symbols l-tree)))
        (if (element-of-set? symb left-symbols)
          (cons 0 (encode-symbol symb l-tree))
          (cons 1 (encode-symbol symb r-tree)))))))



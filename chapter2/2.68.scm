; leaf: ('leaf symbol weight)
; tree: (left-tree right-tree symbols weight)

(define (element-of-set? symb seq)
  (if (null? seq)
    false
    (if (eq? symb (car seq))
      true
      (element-of-set? symb (cdr seq)))))

(define (encode-symbol symb tree)
  (if (leaf? tree)
    '()
    (let ((l-tree (left-tree tree))
          (r-tree (right-tree tree)))
      (let ((left-symbols (symbols l-tree)))
        (if (element-of-set? symb left-symbols)
          (cons 0 (encode-symbol symb l-tree))
          (cons 1 (encode-symbol symb r-tree)))))))


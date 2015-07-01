; leaf: ('leaf symbol weight)
; tree: (left-branch right-branch symbols weight)

(define (element-of-set? symb seq)
  (if (null? seq)
    false
    (if (eq? symb (car seq))
      true
      (element-of-set? symb (cdr seq)))))

(define (encode-symbol symb tree)
  (if (leaf? tree)
    (if (eq? symb (symbol-leaf tree))
      '()
      (error "encoding error"))
    (let ((l-tree (left-branch tree))
          (r-tree (right-branch tree)))
      (let ((left-symbols (symbols l-tree)))
        (if (element-of-set? symb left-symbols)
          (cons 0 (encode-symbol symb l-tree))
          (cons 1 (encode-symbol symb r-tree)))))))

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
          (encode (cdr message) tree))))


(define (select-branch bit tree)
  (cond ((= bit 0) (left-branch tree))
        ((= bit 1) (right-branch tree))
        (else (error "bit must be 0 or 1."))))

(define (decode-iter bits current-branch origin-tree)
  (cond ((null? bits) '())
        ((leaf? current-branch)
         (cons (symbol-leaf current-branch)
               (decode-iter bits origin-tree origin-tree)))
        (else
          (decode-iter (cdr bits) 
                       (select-branch (car bits) current-branch)
                       origin-tree))))

(define (decode bits tree)
  (decode-iter bits tree tree))


(define (make-tree entry left right)
  (list entry left right))

(define (get-by-index index seq)
  (if (= index 0)
    (car seq)
    (get-by-index (- index 1) (cdr seq))))

(define (get-sub-list start len seq)
  (cond ((or (< start 0) (< len 0)) (error "start must be non-negtive"))
        ((> start 0) (get-sub-list (- start 1) len (cdr seq)))
        ((= start 0)
         (if (= len 0)
           '()
           (cons (car seq) (get-sub-list 0 (- len 1) (cdr seq)))))))

; naive version...
(define (list->tree seq)
  (if (null? seq)
    '()
    (let ((tree-size (length seq)))
      (let ((left-size (quotient (- tree-size 1) 2)))
        (let ((right-size (- (- tree-size 1) left-size)))
          (let ((left-tree (if (= left-size 0) '() (list->tree (get-sub-list 0 left-size seq))))
                (right-tree (if (= right-size 0) '() (list->tree (get-sub-list (+ left-size 1) right-size seq)))))
            (make-tree (get-by-index left-size seq) left-tree right-tree)))))))

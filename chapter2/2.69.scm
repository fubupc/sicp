
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-sets pairs)))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set)))
         (cons x set))
        (else
          (cons (car set) (adjoin-set x (cdr set))))))

; iterative.
(define (make-leaf-sets pairs)
  (define (iter result pairs)
    (if (null? pairs)
      result
      (let ((pair (car pairs)))
        (iter (adjoin-set 
                (make-leaf (car pair)
                           (cadr pair))
                result)
              (cdr paris)))))
  (iter '() pairs))

; recursive.
(define (make-leaf-sets pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair)
                             (cadr pair))
                  (make-leaf-sets (cdr pairs))))))


(define (successive-merge tree-list)
  (let ((len (length tree-list)))
    (cond ((= len 0) '())
          ((= len 1) (car tree-list))
          (else
            (let ((first (car tree-list))
                  (second (cadr tree-list))
                  (rest (cddr tree-list)))
              (successive-merge
                (adjoin-set (make-code-tree first second) rest)))))))

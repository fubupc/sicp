(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (symbol-leaf x)
  (cadr x))

(define (weight-leaf x)
  (caddr x))

(define (leaf? object)
  (eq? 'leaf (car object)))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (left-branch tree)
  (if (leaf? tree)
    (error "leaf node has no left-branch")
    (car tree)))

(define (right-branch tree)
  (if (leaf? tree)
    (error "leaf node has no right-branch")
    (cadr tree)))

; deprecated. see 2.69.scm for better solution.
(define (order-pairs pairs)
  (define (weight-pair pair) (cadr pair))

  (define (min-iter min-pair result rest)
    (if (null? rest)
      (list min-pair result)
      (let ((next (car rest)))
        (cond ((null? min-pair) (min-iter next result (cdr rest)))
              ((< (weight-pair next) (weight-pair min-pair))
               (min-iter next (cons min-pair result) (cdr rest)))
              (else (min-iter min-pair (cons next result) (cdr rest)))))))

  (if (null? pairs)
    '()
    (let ((result (min-iter '() '() pairs)))
      (let ((min-pair (car result))
            (rest (cadr result)))
        (cons min-pair (order-pairs rest))))))


; deprecated. see 2.69.scm for better solution.
(define (pairs->leaf-list pairs)
  (if (null? pairs)
    '()
    (let ((next (car pairs)))
      (cons (make-leaf (car next) (cadr next))
            (pairs->leaf-list (cdr pairs))))))

; deprecated. see 2.69.scm for better solution.
(define (insert-tree tree ordered-list)
  (if (null? ordered-list)
    (list tree)
    (let ((next (car ordered-list)))
      (if (< (weight tree) (weight next))
        (cons tree ordered-list)
        (cons next (insert-tree tree (cdr ordered-list)))))))

; deprecated. see 2.69.scm for better solution.
(define (generate-huffman-tree pairs)
  (define (iter tree-list)
    (let ((len (length tree-list)))
      (cond ((= len 0) '())
            ((= len 1) (car tree-list))
            (else
              (let ((first (car tree-list))
                    (second (cadr tree-list))
                    (rest (cddr tree-list)))
                (iter (insert-tree (make-code-tree first second) rest)))))))

  (let ((ordered-pairs (order-pairs pairs)))
    (let ((leaf-list (pairs->leaf-list ordered-pairs)))
      (iter leaf-list))))


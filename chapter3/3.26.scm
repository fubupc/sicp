(define (make-tree entry left right) (list entry left right))

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (cadr tree))


(define (make-record key value) (cons key value))
(define (key record) (car record))
(define (value record) (cdr record))

(define (assoc k tree)
  (if (null? tree)
    false
    (let ((record (entry tree)))
      (let ((rec-key (key record)))
        (cond ((= k rec-key) record)
              ((< k rec-key)
               (assoc k (left-branch tree)))
              ((> k rec-key)
               (assoc k (right-branch tree))))))))

(define (make-table) (list '*table*))

(define (insert keys value table)
  (let ((current-key (car keys))
        (remain-keys (cdr keys))
        (subtable (assoc (car keys) (cdr table))))
    (if subtable
      (if (null? remain-keys)
        (set-cdr! subtable value)
        (insert remain-keys value subtable))
      (let ((new-table (list current-key)))
        (set-cdr! table (cons new-table (cdr table)))
        (if (null? remain-keys)
          (set-cdr! new-table value)
          (insert remain-keys value new-table))))))

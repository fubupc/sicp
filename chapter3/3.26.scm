(define (make-tree entry left right) (list entry left right))

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caadr tree))

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

(define (lookup keys table)
  (let ((current-key (car keys))
        (remain-keys (cdr keys))
        (tree (cdr table)))
    (if (pair? tree)
      (let ((subtable (assoc current-key tree)))
        (if subtable
          (if (null? remain-keys)
            (cdr subtable)
            (lookup remain-keys subtable))
          false))
      false)))

;; version 1: insert with re-constructing whole tree approach
(define (insert-to-tree key value tree)
  (if (null? tree)
    (make-tree (make-record key value) '() '())
    (let ((current-entry (entry tree)))
      (let ((current-key (key current-entry)))
        (cond ((= key current-key)
               (make-tree (make-record key value)
                          (left-branch tree)
                          (right-branch tree)))
              ((< key current-key)
               (make-tree current-entry
                          (insert-to-tree key value (left-branch tree))
                          (right-branch tree))
              ((> key current-key)
               (make-tree current-entry
                          (left-branch tree)
                          (insert-to-tree key value (right-branch tree))))))))))

(define (insert keys value table)
  (let ((current-key (car keys))
        (remain-keys (cdr keys))
        (subtable (assoc (car keys) (cdr table))))
    (if subtable
      (if (null? remain-keys)
        (set-cdr! subtable value)
        (insert remain-keys value subtable))
      (if (null? remain-keys)
        (set-cdr! table (insert-to-tree current-key value (cdr table))
        (let ((new-tree (insert-to-tree current-key '() (cdr table))))
          (set-cdr! table new-tree)
          (let ((record (assoc current-key new-tree))) ;; record should be exist because it's inserted just above.
            (insert remain-keys value record))))))))

;; minor improvement.
;; using an record(composed of key and value) instead of key/value as parameters.
;; so that record can be regarded as an pointer.
;; no need to search record against to the key. 
(define (insert-to-tree new-entry tree)
  (if (null? tree)
    (make-tree new-entry '() '())
    (let ((current-entry (entry tree)))
      (let ((current-key (key current-entry))
            (new-key (key new-entry)))
        (cond ((= new-key current-key)
               (make-tree new-entry
                          (left-branch tree)
                          (right-branch tree)))
              ((< new-key current-key)
               (make-tree current-entry
                          (insert-to-tree new-entry (left-branch tree))
                          (right-branch tree)))
              ((> new-key current-key)
               (make-tree current-entry
                          (left-branch tree)
                          (insert-to-tree new-entry (right-branch tree)))))))))

(define (insert keys value table)
  (let ((current-key (car keys))
        (remain-keys (cdr keys)))
    (let ((subtable (assoc current-key (cdr table))))
      (if subtable
        (if (null? remain-keys)
          (set-cdr! subtable value)
          (insert remain-keys value subtable))
        (let ((new-record (make-record current-key '())))
          (set-cdr! table (insert-to-tree new-record (cdr table)))
          (if (null? remain-keys)
            (set-cdr! new-record value)
            (insert remain-keys value new-record)))))))



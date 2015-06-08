(define (append list1 list2)
  (if (null? list1)
    list2
    (append (remove-last list1)
            (cons (get-last list1) list2))))

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1)
          (append (cdr list1) list2))))


; e. 2.17 last-pair
; @iterative
(define (last-pair items)
  (if (null? (cdr items))
    items
    (last-pair (cdr items))))


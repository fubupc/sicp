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



(define (last-pair list1)
  (if (null? (cdr list1))
    list1
    (last-pair (cdr list1))))


(define (reverse list1)
  (if (null? list1)
    '()
    (cons (last-pair list1)
          (reverse (remove-last list1)))))


(define (reverse _list)
  (define (iter list1 list2)
    (if (null? list1)
      list2
      (iter (cdr list1)
            (cons list2 (car list1))))))

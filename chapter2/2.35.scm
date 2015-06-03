
(define (count-leaves tree)
  (accumulate + 0 (map (lambda (x) (1)) (enum-tree tree))))

(define (count-leaves tree)
  (accumulate (lambda (item rest) (+ 1 rest)) 0 (enum-tree tree)))


(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))


(define (enum-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enum-tree (car tree))
                      (enum-tree (cdr tree))))))


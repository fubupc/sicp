(define (count-leaves items)
  (cond ((null? items) 0)
        ((not (pair? items)) 1)
        (else (+ (count-leaves (car items))
                 (count-leaves (cdr items))))))


; 2.25

(define t1 (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr t1)))))

(define t2 (list (list 7)))
(car (car t2))

(define t3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr t3))))))))))))

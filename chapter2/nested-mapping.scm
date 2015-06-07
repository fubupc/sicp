(define (num-seq start end)
  (if (> start end)
    '()
    (cons start
          (num-seq (+ start 1) end))))

(define (make-pairs n)
  (if (= n 1)
    '()
    (append (map (lambda (i) (list i n)) (num-seq 1 (- n 1)))
            (make-pairs (- n 1)))))
    

(define (make-pairs n)
  (if (= n 1)
    '()
    (append (fold-right 
              (lambda (i rest)
                (cons (list i n) rest))
              '()
              (num-seq 1 (- n 1)))
            (make-pairs (- n 1)))))


(define (make-paris n)
  (fold-right
    append nil (map (lambda (i)
                      (map (lambda (j) (list i j)) 
                           (num-seq 1 (- i 1))))
                    (num-seq 1 n))))


(define (make-permutations set)
  (if (null? set)
    (list '())
    (accumulate
      append nil (map (lambda (i)
                        (map (lambda (j) (cons i j))
                             (make-permutations (remove i set))))
                      set))))


(define (flatmap proc seq)
  (fold-right
    append nil 
    (map proc seq)))

(define (make-permutations set)
  (if (null? set)
    (list '())
    (flatmap (lambda (x)
               (map (lambda (p) (cons x p))
                    (make-permutations (remove x set))))
             set)))

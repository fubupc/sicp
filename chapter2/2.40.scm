(define (enumerate-number start end)
  (if (> start end)
    '()
    (cons start (enumerate-number (+ start 1) end))))

(define (unique-pairs n)
  (fold-right 
    append '()
    (map (lambda (i)
           (map (lambda (j)
                  (list i j))
                (enumerate-number 1 (- i 1))))
         (enumerate-number 1 n))))

; stupid prime test
(define (prime? num)
  (define (int-divide? num divider)
    (= 0 (modulo num divider)))
  (define (prime-iter divider)
    (if (= divider num)
      true
      (if (int-divide? num divider)
        false
        (prime-iter (+ divider 1)))))
  (prime-iter 2))

(define (sum-pair pair)
  (+ (car pair) (cadr pair)))

(define (make-sum-pair pair)
  (list (car pair) (cadr pair) (sum-pair pair)))

(define (prime-sum? pair)
  (prime? (sum-pair pair)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))



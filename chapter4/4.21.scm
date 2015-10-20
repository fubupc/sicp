;; Y combinator
(define (Y f)
  ((lambda (g) (g g))
   (lambda (h)
     (lambda (n)
       (f (h h) n)))))


;; define fact using Y combinator
(define fact (Y (lambda (ft n)
                  (if (= n 0)
                    1
                    (* n (ft (- n 1)))))))

;; a. fib
((lambda (n)
   ((lambda (g) (g g n))
    (lambda (fib n)
      (cond ((= n 0) 0)
            ((= n 1) 1)
            (else
              (+ (fib fib (- n 1))
                 (fib fib (- n 2))))))))
 10)


;; b. even? and odd?

(define (f x)
  ((lambda (even? odd?) (even? even? odd? x))
   (lambda (ev? od? n)
     (if (= n 0) true (od? ev? od? (- n 1))))
   (lambda (ev? od? n)
     (if (= n 0) false (ev? ev? od? (- n 1))))))


(f 10)
(f 9)

(load "D:/work/sicp/chapter4/helper.scm")

(define (let? exp) (tagged-list? exp 'let))
(define (named-let? exp)
  (and (let? exp)
       (variable? (cadr exp))))

(define (let-defs exp) 
  (if (named-let? exp)
    (caddr exp)
    (cadr exp)))

(define (let-body exp)
  (if (named-let? exp)
    (cdddr exp)
    (cddr exp)))

(define (let-name exp) (cadr exp))

(define (def-name def) (car def))
(define (def-value def) (cadr def))

(define (let->combination exp)
  (if (named-let? exp)
    (make-begin
      (list
        (make-define (let-name exp) (make-lambda (get-names (let-defs exp)) (let-body exp)))
        (make-application (let-name exp) (get-values (let-defs exp)))))
    (make-application
      (make-lambda (get-names (let-defs exp)) (let-body exp))
      (get-values (let-defs exp)))))

(define (get-names defs)
  (if (null? defs)
    nil
    (cons (def-name (car defs))
          (get-names (cdr defs)))))

(define (get-values defs)
  (if (null? defs)
    nil
    (cons (def-value (car defs))
          (get-values (cdr defs)))))


;; test
(define test-fib
  (list 'define '(fib n)
        (let->combination 
          '(let fib-iter ((a 1)
                          (b 0)
                          (count n))
             (if (= count 0)
               b
               (fib-iter (+ a b) a (- count 1)))))))

(eval test-fib user-initial-environment)
(fib 5)


(define (let? exp) (tagged-list? exp 'let))

(define (let-defs exp) (cadr exp))
(define (let-body exp) (cddr exp))

(define (def-name def) (car def))
(define (def-value def) (cadr def))

(define (let->combination exp)
  (make-application
    (make-lambda (get-names (let-defs exp)) (let-body exp))
    (get-values (let-defs exp))))

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

(define (make-application operator operands)
  (cons operator operands))

(define (make-lambda args body)
  (cons 'lambda (cons args body)))


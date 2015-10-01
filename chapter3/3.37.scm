(define (c/ x y)
  (let ((z (make-connector)))
    (adder (y z x))
    z))

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c- x y)
  (let ((z (make-connector)))
    (adder y z x)
    z))

(define (cv val)
  (let ((z (make-connector)))
    (constant z val)
    z))


(define nil '())

(define (variable? exp) (symbol? exp))

(define (tagged-list? lst tag)
  (and (pair? lst)
       (not (null? lst))
       (eq? (car lst) tag)))

(define (last-exp? seq) (null? (cdr seq)))
(define (first-ext seq) (car seq))
(define (rest-exps seq) (cdr seq))

(define (sequence->exp seq)
  (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))))

(define (make-begin seq)
  (cons 'begin seq))

(define (make-application operator operands)
  (cons operator operands))

(define (make-lambda args body)
  (cons 'lambda (cons args body)))

(define (make-define name value)
  (list 'define name value))

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))


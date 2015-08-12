; a. set! and define would be considered normal procedure which will cause "name XXX not bound" error.

; b. changing syntax of procedure application.
;
(define (application? exp) 
  (and (pair? exp)
       (eq? (car exp) 'call)))

; better
(define (application? exp)
  (tagged-list? exp 'call))

(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))


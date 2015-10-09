(define (let*? exp) (tagged-list? exp 'let*))
(define (let*-defs exp) (cadr exp))
(define (let*-body exp) (cddr exp))

(define (let*->nested-lets exp)
  (expand-defs (let*-defs exp) (let*-body exp)))

(define (expand-defs defs body)
  (if (null? defs)
    (sequence->exp body)
    (make-let (list (car defs))
              (list (expand-defs (cdr defs) body)))))

(define (make-let defs body)
  (cons 'let (cons defs body)))


(define (last-exp? seq) (null? (cdr seq)))
(define (first-ext seq) (car seq))
(define (rest-exps seq) (cdr seq))

(define (sequence->exp seq)
  (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))))

(define (make-begin seq)
  (cons 'begin seq))

;; I think (eval (let*->nested-lets exp) env) should be sufficient.

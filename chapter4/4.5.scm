(define (tagged-list? lst tag) (eq? (car lst) tag))

(define (cond? exp) (tagged-list? exp 'cond))
(define (cond-clauses exp) (cdr exp))

(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))
(define (cond-fn-exp clause)
  (if (not (= (length clause) 3))
    (error "Ill-formed => clause:" clause)
    (caddr clause)))

(define (cond-else-clause? clause) (eq? (cond-predicate clause) 'else))
(define (cond-arrow-clause? clause) (eq? (car (cond-actions clause)) '=>))


(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))
(define (last-exp? seq) (null? (cdr seq)))

(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))

(define (sequence->exp seq)
  (cond ((null? seq) seq)
        ((last-exp? seq) (first-exp seq))
        (else (make-begin seq))))

(define (make-begin seq)
  (cons 'begin seq))

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

(define (make-let defs body)
  (list 'let defs body))

(define (make-apply fn-exp args)
  (cons fn-exp args))

(define (make-if-arrow predicate fn-exp alternative)
  (make-let (list (list 'result predicate))
            (make-if 'result 
                     (make-apply fn-exp '(result))
                     alternative)))

(define (expand-clauses seq)
  (if (null? seq)
    'false
    (let ((first (first-exp seq))
          (rest (rest-exps seq)))
      (cond ((cond-else-clause? first)
             (if (null? rest)
               (sequence->exp (cond-actions first))
               (error "Else must be last")))
            ((cond-arrow-clause? first)
             (make-if-arrow (cond-predicate first)
                            (cond-fn-exp first)
                            (expand-clauses rest)))
            (else
              (make-if (cond-predicate first)
                       (sequence->exp (cond-actions first))
                       (expand-clauses rest)))))))


(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        (else
            (let ((sp (get 'eval (car exp))))
              (if sp
                (sp exp env)
                (apply (eval (operator exp) env)
                       (list-of-values (operands exp) env)))))))


(define (if-pack)
  (define (predicate exp) (cadr exp))
  (define (consequent exp) (caddr exp))
  (define (alternative exp)
    (if (null? (cdddr exp))
      'false
      (cadddr exp)))

  (define (eval-if exp env)
    (if (true? (eval (predicate exp) env))
      (eval (consequent exp) env)
      (eval (alternative exp) env)))

  (put 'eval 'if eval-if))

(define (lambda-pack)
  (define (lambda-params exp) (cadr exp))
  (define (lambda-body exp) (caddr exp))

  (define (eval-lambda exp env)
    (make-procedure
      (lambda-params exp)
      (lambda-body exp)
      env))

  (put 'eval 'lambda eval-if))

(define (begin-pack)
  (define (expression-sequence exp) (cdr exp))
  (define (eval-seq seq env)
    (if (null? (cdr seq))
      (eval (car seq) env)
      (begin (eval (car seq) env)
             (eval-seq (cdr seq) env))))

  (define (eval-begin exp env)
    (eval-seq (expression-sequence exp) env))

  (put 'eval 'begin eval-begin))


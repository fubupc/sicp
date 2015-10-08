;; and related procedures
(define (logic-and? exp) (eq? (car exp) 'and))
(define (and-exps exp) (cdr exp))
(define (eval-and exp env)
  (eval-and-seq (and-exps exp)))
(define (eval-and-seq seq env)
  (cond ((null? seq) 'true)
        ((last-exp? seq) (eval (first-exp seq) env))
        (else
          (let ((result (eval (first-exp seq) env)))
            (if (true? result)
              (eval-and-seq (rest-exp seq) env)
              'false)))))

;; or related procedures
(define (logic-or? exp) (eq? (car exp) 'or))
(define (or-exps exp) (cdr exp))
(define (eval-or exp env)
  (eval-or-seq (or-exps exp)))
(define (eval-or-seq seq env)
  (cond ((null? seq) 'false)
        (else
          (let ((result (eval (first-exp seq) env)))
            (if (true? result)
              result
              (eval-and-seq (rest-exp seq)))))))


;; derived expression
(define (make-let defs body)
  (list 'let defs body))

(define (make-if predicate consequent alternative)
  (list 'if predicate consequent alternative))

(define (make-if-2 predicate alternative)
  (make-let (list (list 'result predicate))
            (make-if 'result 'result alternative)))

;; helper
(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))
(define (last-exp? seq) (null? (rest-exps seq)))

;; and
(define (and->if exp)
  (expand-and (and-exps exp)))

(define (expand-and seq)
  (cond ((null? seq) 'true)
        ((last-exp? seq)
         (make-if-2 (first-exp seq) 'false))
        (else
          (make-if (first-exp seq) (expand-and (rest-exps seq)) 'false))))

;; or
(define (or->if exp)
  (expand-or (or-exps exp)))

(define (expand-or seq)
  (cond ((null? seq) 'false)
        (else
          (make-if-2 (first-exp seq)
                     (expand-or (rest-exps seq))))))


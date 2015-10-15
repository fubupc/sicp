;; load helper
(load "helper.scm")

;; 4.16
;; a. Change lookup-variable-value (Section 4.1.3) to sig-nal an error if 
;;    the value it finds is the symbol *unassigned* .
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-envrionment env)))
            ((eq? var (car vars))
             (if (eq? (car vals) '*unassigned*)
               (error "Variable <" var "> value unassigned yet.")
               (car vals)))
            (else
              (scan (cdr vars) (cdr vals)))))

    (if (eq? env the-empty-environment)
      (error "Unbound variable")
      (let ((frame (first-frame (env))))
        (scan (frame-variables frame)
              (frame-values frame)))))
  (env-loop env))


;; b. Write a procedure scan-out-defines that takes a procedure body and 
;;    returns an equivalent one that has no internal definitions, by making 
;;    the transformation described above.
(define (make-binding var val) (list var val))
(define (make-assignment var val) (list 'set! var val))
(define (make-let bindings body) (list 'let bindings body))

;; note: because body is an expression sequence, so maybe bettter to 
;; wrap the result in a list.
(define (scan-out-defines body)
  (define (scan bindings exps seq)
    (if (null? seq)
      (make-let (reverse bindings) (reverse exps))
      (let ((first (car seq)))
        (if (define? first)
          (scan (cons (make-binding (define-variable first) ''*unassignment*) bindings)
                (cons (make-assignment (define-variable first) (define-value first)) exps)
                (cdr seq))
          (scan bindings (cons first exps) (cdr seq))))))

  (scan '() '() body))


;; c. Install scan-out-defines in the interpreter, either in make-procedure 
;;    or in procedure-body (see Section 4.1.3). Which place is better? Why?
;; A: make-procedure is better. because make-procedure only execute once,
;;    but procedure-body may be called many times.

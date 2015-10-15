
(define (make-define var val)
  (list 'define var val))

(define (make-assignment var val)
  (list 'set! var val))
;; 
(define (scan-out-defines body)
  (define (scan defs exps seq)
    (if (null? seq)
      (append (reverse defs) (reverse exps))
      (let ((first (car seq)))
        (if (define? first)
          (scan (cons (make-define (define-variable first) ''*unassignment*) defs)
                (cons (make-assignment (define-variable first) (define-value first)) exps)
                (cdr seq))
          (scan defs (cons first exps) (cdr seq))))))

  (scan '() '() body))


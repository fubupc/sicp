; evaluate oprands from left to right
(define (list-of-values exp env)
  (if (no-oprands? exp)
    '()
    (let ((first (eval (first-oprand exp) env)))
      (cons first (list-of-values (rest-oprands exp) env)))))


; evaluate oprands from right to left
(define (list-of-values exp env)
  (if (no-oprands? exp)
    '()
    (let ((rest (list-of-values (rest-oprands exp) env)))
      (cons (eval (first-oprand exp) env) rest))))


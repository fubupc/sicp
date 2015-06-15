(define (exponentiation? e)
  (and (pair? e)
       (eq? (car e) '**)))

(define (make-exponentiation base exponent)
  (define (calc-exp base exponent)
    (if (= exponent 0)
      1
      (* base (calc-exp base (- exponent 1)))))
  (cond ((eq? base 1) 1)
        ((eq? base 0) 0)
        ((= exponent 0) 1)
        ((= exponent 1) base)
        ((number? base) (calc-exp base exponent))
        (else (list '** base exponent))))

(define (base e)
  (cadr e))

(define (exponent e)
  (caddr e))


; import for test.
(define (make-sum v1 v2)
  (cond ((eq? v1 0) v2)
        ((eq? v2 0) v1)
        ((and (number? v1) (number? v2))
         (+ v1 v2))
        (else (list '+ v1 v2))))

(define (make-multiplication v1 v2)
  (cond ((eq? v1 0) 0)
        ((eq? v2 0) 0)
        ((eq? v1 1) v2)
        ((eq? v2 1) v1)
        ((and (number? v1) (number? v2)) (* v1 v2))
        (else (list '* v1 v2))))

(define (sum? e)
  (and (pair? e)
       (eq? '+ (car e))))

(define (multiplication? e)
  (and (pair? e)
       (eq? '* (car e))))

(define (addend e)
  (cadr e))

(define (augend e)
  (caddr e))

(define (multiplier e)
  (cadr e))

(define (multiplicand e)
  (caddr e))

(define (variable? var)
  (symbol? var))

(define (same-variable? v1 v2)
  (eq? v1 v2))

(define (deriv exp var)
  (cond ((variable? exp) (if (same-variable? exp var) 1 0))
        ((number? exp) 0)
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((multiplication? exp)
         (make-sum (make-multiplication (multiplier exp)
                                        (deriv (multiplicand exp) var))
                   (make-multiplication (multiplicand exp)
                                        (deriv (multiplier exp) var))))
        ((exponentiation? exp)
         (make-multiplication 
           (make-multiplication 
             (exponent exp)
             (make-exponentiation (base exp) (- (exponent exp) 1)))
           (deriv (base exp) var)))
        (else
          (error "wrong exp"))))


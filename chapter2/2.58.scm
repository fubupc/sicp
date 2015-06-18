; a. infix expression always take two parameters and fully parenthesized.
; e.g. (x + (3 * (x + (y + 2))))
(define (make-sum v1 v2)
  (list v1 '+ v2))

(define (sum? e)
  (eq? (cadr e) '+))

(define (addend e)
  (car e))

(define (augend e)
  (caddr e))


(define (make-product v1 v2)
  (list v1 '* v2))

(define (product? e)
  (eq? (cadr e) '*))

(define (multiplier e)
  (car e))


(define (multiplicand e)
  (caddr e))


; b. loose infix expression 
; e.g. (x + 3 * (x + y + 2))
(define (sum? e)
  (cond ((not (pair? e)) false)
        ((< (length e) 3) false)
        (else
          (let ((rest (cddr e)))
            (if (or (= (length rest) 1)
                    (eq? (cadr e) '+))
              true
              (sum? rest))))))
; anther sum
(define (slice seq num)
  (cond ((< num 0) (error "num must positive."))
        ((< (length seq) num) (error "num out of range."))
        ((= num 0) '())
        (else (cons (car seq) (slice (cdr seq) (- num 1))))))

(define (sum? e)
  (display e)
  (newline)
  (if (or (not (pair? e)) (< (length e) 3))
    false
    (let ((rest (cddr e)))
      (if (eq? (cadr e) '+)
        true
        (sum? (cons (slice e 3) (cdddr e)))))))

(define (addend e)
  (define (iter result e)
    (if (eq? '+ (cadr e))
      (append result (list (car e)))
      (iter (append result 
                    (list (car e) (cadr e)))
            (cddr e))))
  (let ((res (iter '() e)))
    (if (= (length res) 1)
      (car res)
      res)))

(define (augend e)
  (let ((rest (cddr e)))
    (if (eq? '+ (cadr e))
      (if (= (length rest) 1)
        (car rest)
        rest)
      (augend rest))))

(define (product? e)
  (cond ((not (pair? e)) false)
        ((< (length e) 3) false)
        ((not (eq? (cadr e) '*)) false)
        (else 
          (let ((rest (cddr e)))
            (if (= (length rest) 1)
              true
              (product? rest))))))

(define (multiplier e)
  (car e))

(define (multiplicand e)
  (let ((rest (cddr e)))
    (if (= (length rest) 1)
      (car rest)
      rest)))


(define (make-account balance password)

  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      (error "Insuffient funds")))

  (define (deposit amount)
    (begin (set! balance (+ balance amount))
           balance))

  (define (dispatch pwd command)
    (if (eq? pwd password)
      (cond ((eq? command 'withdraw) withdraw)
            ((eq? command 'deposit) deposit)
            (else
              (error "wrong command on account:"
                     command)))
      (error "Incorrect password")))

  dispatch)

(define (make-account balance password)
  (let ((wrong-count 0))
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
        (begin (set! wrong-count 0)
               (cond ((eq? command 'withdraw) withdraw)
                     ((eq? command 'deposit) deposit)
                     (else
                       (error "wrong command on account:"
                              command))))
        (begin (set! wrong-count (+ wrong-count 1))
               (if (> wrong-count 7)
                 (error "call-the-cops")
                 (error "Incorrect password, tried " wrong-count " times")))))

    dispatch))

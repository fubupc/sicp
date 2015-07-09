(define (make-account balance password)
  (let ((password-list (list password)))

    (define (withdraw amount)
      (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        (error "Insuffient funds")))

    (define (deposit amount)
      (begin (set! balance (+ balance amount))
             balance))

    (define (search-password pwd)
      (define (iter seq)
        (if (null? seq)
          false
          (if (eq? pwd (car seq))
            true
            (iter (cdr seq)))))
      (iter password-list))

    (define (dispatch pwd command)
      (if (search-password pwd)
        (cond ((eq? command 'make-joint) make-joint)
              ((eq? command 'withdraw) withdraw)
              ((eq? command 'deposit) deposit)
              (else
                (error "wrong command on account:"
                       command)))
        (error "Incorrect password")))

    (define (make-joint pwd)
      (set! password-list (cons pwd password-list)))

    dispatch))


(define (make-joint acc old-pass new-pass)
  ((acc old-pass 'make-joint) new-pass)
  acc)


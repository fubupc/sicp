(define (squarer a b)
  (define (process-new-value)
    (if (has-value? b)
      (if (< (get-value b) 0)
        (error "square less than 0:" (get-value b))
        (set-value! a (sqrt (get-value b)))
        (if (has-value? a)
          (set-value! b (square (get-value a)))))))

  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    (process-new-value))

  (define (me message)
    (cond ((= message 'i-have-a-value) process-new-value)
          ((= message 'i-lost-no-value) process-forget-value)
          (else
            (error "Unknow message:" message))))

  (connect a me)
  (connect b me)
  me)


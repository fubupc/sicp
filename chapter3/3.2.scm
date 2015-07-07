(define (make-monitored f)
  (let ((count 0))
    (lambda (i)
      (cond ((eq? i 'how-many-calls?) count)
            ((eq? i 'reset-count) (set! count 0))
            (else
              (begin (set! count (+ count 1))
                     (f i)))))))

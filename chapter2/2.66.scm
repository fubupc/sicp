(define (lookup given-key set-of-records)
  (if (null? set-of-records)
    false
    (let ((rec (car set-of-records)))
      (let ((rec-key (key rec)))
        (cond ((equal? rec-key given-key) rec)
              ((< rec-key given-key) (cadr set-of-records))
              (else (caddr set-of-records)))))))

        

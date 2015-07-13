(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (empty?)
      (null? front-ptr))

    (define (front)
      (if (empty?)
        (error "Front called on empty queue.")
        (car front-ptr)))

    (define (insert item)
      (let ((new-pair (cons item '())))
        (cond ((empty?)
               (set! front-ptr new-pair)
               (set! rear-ptr new-pair)
               front-ptr)
              (else
                (set-cdr! rear-ptr new-pair)
                (set! rear-ptr new-pair)
                front-ptr))))

    (define (delete)
      (cond ((empty?)
             (error "Delete called on empty queue."))
            (else
              (set! front-ptr (cdr front-ptr)))))


    (define (dispatch m)
      (cond ((eq? m 'empty?) (empty?))
            ((eq? m 'front) (front))
            ((eq? m 'insert) insert)
            ((eq? m 'delete) (delete))
            (else (error "Dispatch error"))))

    dispatch))


(define (insert-queue! q item)
  ((q 'insert) item))

(define (delete-queue! q)
  (q 'delete))

(define (empty-queue? q)
  (q 'empty?))

(define (front-queue q)
  (q 'front))




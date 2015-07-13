(define (make-queue)
  (define queue '())
  (define last-pair '())

  (define (empty?)
    (null? queue))

  (define (insert item)
    (if (null? queue)
      (begin
        (set! last-pair (list item))
        (set! queue last-pair)
        queue)
      (let ((last (list item)))
        (set-cdr! last-pair last)
        (set! last-pair last)
        queue)))

  (define (delete)
    (if (empty?)
      (error "empty queue!")
      (begin (set! queue (cdr queue))
             queue)))

  (define (front)
    (if (empty?)
      (error "empty!")
      (car queue)))

  (define (dispatch m)
    (cond ((eq? m 'insert) insert)
          ((eq? m 'delete) (delete))
          ((eq? m 'empty?) (empty?))
          ((eq? m 'front) (front))
          (else (error "Not supported method."))))
  dispatch)


(define (insert-queue! q item)
  ((q 'insert) item))

(define (delete-queue! q)
  (q 'delete))

(define (empty?-queue? q)
  (q 'empty?))

(define (front-queue q)
  (q 'front))

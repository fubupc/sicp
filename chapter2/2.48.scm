(define (make-segment v1 v2)
  (make-vect v1 v2))

(define (start-segment segment)
  (xcor-vect segment))

(define (end-segment segment)
  (ycor-vect segment))

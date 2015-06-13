(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (xcor-vect v)
  (cadr v))


(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (vcor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (xcor-vect v2))))


(define (scale-vect factor v)
  (make-vect (* factor (xcor-vect v))
             (* factor (ycor-vect v))))

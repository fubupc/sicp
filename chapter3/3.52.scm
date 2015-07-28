(define sum 0)
; sum = 0

(define (accum x) (set! sum (+ x sum)) sum)
; sum = 0

(define seq
  (stream-map accum (stream-enumerate-interval 1 20)))
; sum = 1
; seq = (1 ...)


(define (stream-filter predicate s)
  (cond ((empty-stream? s) the-empty-stream)
        ((predicate (stream-car s))
         (cons-stream (stream-car s)
                      (stream-filter predicate (stream-cdr s))))
        (else
          (stream-filter predicate (stream-cdr s)))))

(define y (stream-filter even? seq))
; 1 of seq is 1(sum), not even, stream-cdr, sum = 1 + 2
; 2 of seq is 3(sum), not even, stream-cdr, sum = 3 + 3
; 3 of seq is 6(sum), even, over.
; y = (6 ...)


(define z
  (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
; because of memoization of stream. seq can now be considered (1 3 6 ...)
; 1 of seq is 1, false, next(memo)
; 2 of seq is 3, false, next(memo)
; 3 of seq is 6, false, next(stream-cdr, sum = 6 + 4)
; 4 of seq is 10, true, over.
; z = (10 ...)


(stream-ref y 7)
; 1 stream-cdr of y, 1 stream-cdr of seq: (10 ...)
; 2 stream-cdr of y:
;   sum = 10 + 5, not even
;   sum = 15 + 6, not even
;   sum = 21 + 7, even
;
; 3 stream-cdr of y:
;   sum = 28 + 8, even
;
; 4 stream-cdr of y:
;   sum = 36 + 9, not even
;   sum = 45 + 10, not even
;   sum = 55 + 11, even
;
; 5 stream-cdr of y:
;   sum = 66 + 12, not even
;
; 6 stream-cdr of y:
;   sum = 78 + 13, not even
;   sum = 91 + 14, not even
;   sum = 105 + 15, even
;
; 7 stream-cdr of y:
;   sum = 120 + 16, even
;
; => 136


; stream-for-each will enforce stream evaluation.
(define (stream-for-each proc s)
  (if (empty-stream? s)
    'done
    (begin (proc (stream-car s))
           (stream-for-each proc (stream-cdr s)))))

(define (display-line x) (newline) (display x))
(define (display-stream s) (stream-for-each display-line s))

(display-stream z)
; 10
; 15
; 45
; 105
; 120
; 170


;; if we has implemented (delay <exp>) simply as (lambda () <exp>) instead of memo-proc.
;; then result will be very different.
;; because every time iterate the stream, element of stream will be re-evaluated.
;; so every (stream-ref y 7) evaluation will be different value.

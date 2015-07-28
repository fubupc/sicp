(define (display-line o) (display o) (newline))
(define (show x) (display-line x) x)

(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream low (stream-enumerate-interval (+ low 1) high))))

(define x (stream-map show (stream-enumerate-interval 0 10)))
;; => 0
;; => Value XX: (0 . #[promise xx])
;;

(define (stream-ref s index)
  (if (= index 0)
    (stream-car s)
    (stream-ref (stream-cdr s) (- index 1))))

;; (stream-ref x 5)
;; => 1
;; => 2
;; => 3
;; => 4
;; => 5
;; => Value XX: 5

;; (stream-ref x 7)
;; because of memoization 1-5 won't be printed again.
;; => 6
;; => 7
;; => Value XX: 7

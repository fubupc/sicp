;; rand-update placeholder
(define random-init 1000)

(define (rand-update x)
  (display x)
  (random 1000))

(define rand
  (let ((x random-init))
    (define (generate)
      (begin (set! x (rand-update x))
             x))

    (define (reset new)
      (set! x new))

    (define (dispatch m)
      (cond ((eq? m 'generate) (generate))
            ((eq? m 'reset) reset)
            (else error "error message")))

    dispatch))

(define (rand-generator init)
  (let ((x init))
    (define (generate)
      (begin (set! x (rand-update x))
             x))

    (define (reset new)
      (set! x new))

    (define (dispatch m)
      (cond ((eq? m 'generate) (generate))
            ((eq? m 'rest) reset)
            (else error "no cmd")))

    dispatch))

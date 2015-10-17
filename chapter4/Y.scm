;; method 1
(define (g f)
  (lambda (n)
    (if (= n 0)
      1
      (* n ((f f) (- n 1))))))

((g g) 5)

;; method 2
(define (g f n)
  (if (= n 0)
    1
    (* n (f f (- n 1)))))

(g g 5)


;; Y combinator (method 1)
(define (Y g)
  (define (h f)
    (lambda (n)
      (g (f f) n)))
  (h h))

;; Y combinator (method 2)
(define (Y g)

  (define (h f n)
    (g (lambda (n) (f f n)) n))

  (lambda (n) (h h n)))

;; test
(define (fact-partial fact n)
  (if (= n 0)
    1
    (* n (fact (- n 1)))))

((Y fact-partial) 5)



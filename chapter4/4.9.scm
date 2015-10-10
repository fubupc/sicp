(load "helper.scm")

(define (while? exp) (tagged-list? exp 'while))
(define (while-predicate exp) (cadr exp))
(define (while-body exp) (cddr exp))

(define (while->combination exp)
  (make-begin
    (list
      (make-define
        '(inner-iter)
        (make-if (while-predicate exp)
                 (sequence->exp
                   (append (while-body exp)
                           (list (make-application 'inner-iter '()))))
                 ''ok))
      (make-application 'inner-iter '()))))


;; test

(define test '(while (> i 0) (display i) (set! i (- i 1))))
(define i 5)
(eval (while->combination test) user-initial-environment)


;; Exercise 4.28: eval uses actual-value rather than eval
;; to evaluate the operator before passing it to apply, in order
;; to force the value of the operator. Give an example that
;; demonstrates the need for this forcing.
;;
;; Solution: high-order functions
(define (high fn)
  (fn))

(high (lambda () (display 'hello)))

;; at first, the lambda expression is wrapped into a thunk object.
;; then when evaluate (high fn), the thunk object (aka. fn) is 
;; forced into a real function.

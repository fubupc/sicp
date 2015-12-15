(define (square x) (* x x))
;;; L-Eval input:
(square (id 10))
;;; L-Eval value:
; 100
;
;;; L-Eval input:
count
;;; L-Eval value:
; 1 ; for memoization
; 2 ; for non-memoization
;

(define f (let ((x 1))
            (lambda (n) (set! x (- x n)) x)))


; left-to-right.
; (f 0) => 1
; (f 1) => 0

; left-to-right.
; (f 1) => 0
; (f 0) => 0

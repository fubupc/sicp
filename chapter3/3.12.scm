(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
; z => (a b c d)
; (cdr x) => ('b)
(define w (append! x y))
; (cdr x) => ('b 'c 'd)
;

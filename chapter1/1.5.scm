; ex. 1.5
; normal-order evaluation:
; -> (if (= x 0)
;        0
;        y)
; 
; -> (if (= 0 0)
;        0
;        (p))
; -> 0
; 
; 
; applicative-order evaluation:
; -> (test 0 p)
; -> (if (= 0 0)
;        0
;        p)
; -> 0

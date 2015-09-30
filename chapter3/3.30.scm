;; s-delay = max((and-delay + invert-delay), or-delay) + and-delay
;; c-delay = and-delay
(define (half-adder a b s c)
  (let ((m (make-wire))
        (n (make-wire)))
    (or-gate a b m)
    (and-gate a b c)
    (inverter c n)
    (and-gate m n s))
  'ok)

;; sum = 2 * (max((a + i), o) + a)
;; c-out = max((a + i), o) + 2 * a + o
;; sum >= c-out
(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out))
  'ok)

;; S = (n - 1) * c-out + sum
;; C = n * c-out
;; S >= C
(define (ripple-carry-adder A B S C)
  (cond ((null? A)
         (set-signal! C 0)
         'ok)
        (else
          (let ((uplink (make-wire)))
            (full-adder (car A) (car B) uplink (car S) C)
            (ripple-carry-adder cdr A) (cdr B) (cdr S) uplink))))


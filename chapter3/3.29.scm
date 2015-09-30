;; construct or-gate as compound device, using only and-gates and inverters.
;;
(define (or-gate a1 a2 output)
  (let ((c1 (make-wire))
        (c2 (make-wire))
        (c3 (make-wire)))
    (inverter a1 c1)
    (inverter a2 c2)
    (and-gate c1 c2 c3)
    (inverter c3 output)
    'ok))
;; delay time of or-gate is (and-gate-delay + 2 * inverter-delay)

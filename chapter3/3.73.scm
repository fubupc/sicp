(define (RC resistance capacity)
  (define (voltages currents init-volt)
    (define volts
      (cons-stream init-volt
                   (add-streams
                     (add-streams (scale-stream currents (* dt (/ 1.0 capacity)))
                                  volts)
                     (scale-stream currents resistance)))))
  voltages)


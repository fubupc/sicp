; a. outline of frame painter
(define frame-outline
  (let ((origin (make-vect 0 0))
        (tl (make-vect 0 1))
        (tr (make-vect 1 1))
        (br (make-vect 1 0)))
    (segments->painter
      (list (make-segment origin tl)
            (make-segment tl tr)
            (make-segement tr br)
            (make-segement br origin)))))

; b. "X"
(define cross-hair
  (let ((origin (make-vect 0 0))
        (tl (make-vect 0 1))
        (tr (make-vect 1 1))
        (br (make-vect 1 0)))
    (segments->painter
      (list (make-segment origin tr)
            (make-segment tl br)))))

; c. diamond
(define diamond
  (let ((left-mid (make-vect 0 0.5))
        (top-mid (make-vect 0.5 1))
        (right-mid (make-vect 1 0.5))
        (bottom-mid (make-vect 0.5 0)))
    (segments->painter
      (list (make-segment left-mid top-mid)
            (make-segment top-mid right-mid)
            (make-segment right-mid bottom-mid)
            (make-segment bottom-mid left-mid)))))

; d. the wave painter.. really?

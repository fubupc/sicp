(define (enumerate-number start end)
  (if (> start end)
    '()
    (cons start (enumerate-number (+ start 1) end))))

(define (flatmap proc seq)
  (fold-right append '() (map proc seq)))

(define (triple-pairs n)
  (flatmap (lambda (pair)
             (map (lambda (i)
                    (cons i pair))
                  (enumerate-number 1 n)))
           (flatmap (lambda (j)
                      (map (lambda (k) (cons j (list k)))
                           (enumerate-number 1 n)))
                    (enumerate-number 1 n))))


(define (distinct-triple? triple)
  (and (not (= (car triple) (cadr triple)))
       (not (= (car triple) (caddr triple)))
       (not (= (cadr triple) (caddr triple)))))


(define (triple-sum triple)
  (+ (car triple) (cadr triple) (caddr triple)))



(define (sum-given-triples n s)
  (filter (lambda (triple)
            (and (distinct-triple? triple)
                 (= s (triple-sum triple))))
          (triple-pairs n)))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (symbol-leaf leaf)
  (cadr leaf))

(define (weight-leaf leaf)
  (caddr leaf))

(define (leaf? tree)
  (eq? (car tree) 'leaf))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (choose-branch bit tree)
  (cond ((= bit 0) (left-branch tree))
        ((= bit 1) (right-branch tree))
        (else (error "bit error"))))

(define (decode bits tree)
  (define (inner bits current-branch)
    (if (leaf? current-branch)
      (cons (symbol-leaf current-branch) (inner bits tree))
      (if (null? bits)
        '()
        (inner (cdr bits) (choose-branch (car bits) current-branch)))))
  (inner bits tree))

(define (decode bits tree)
  (define (inner bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
          (cons (symbol-leaf next-branch) (inner (cdr bits) tree))
          (inner (cdr bits) next-branch)))))
  (inner bits tree))


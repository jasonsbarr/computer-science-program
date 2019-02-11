(define (square x)
  (* x x))

(define (hypotenuse x y)
  (sqrt (+ (square x) (square y))))

(define (f x)
  (g x 6))

(define (g x y)
  (+ x y))

(define pi 3.141592654)

(define song '(I am the walrus))

;(define (roots a b c)
;  (se (/ (+ (- b) (sqrt (- (* b b) (* 4 a c))))
;         (* 2 a))
;      (/ (- (- b) (sqrt (- (* b b) (* 4 a c))))
;         (* 2 a))))

;(define (roots a b c)
;  (let ((discriminant (sqrt (- (* b b) (* 4 a c)))))
;    (se (/ (+ (- b) discriminant) (* 2 a))
;        (/ (- (- b) discriminant) (* 2 a)))))

(define (roots a b c)
  (let ((discriminant (sqrt (- (* b b) (* 4 a c))))
        (minus-b (- b))
        (two-a (* 2 a)))
    (se (/ (+ minus-b discriminant) two-a)
        (/ (- minus-b discriminant) two-a))))
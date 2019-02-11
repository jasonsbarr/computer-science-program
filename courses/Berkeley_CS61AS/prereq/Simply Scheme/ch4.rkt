(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (hypotenuse a b)
  (sqrt (+ (square a) (square b))))

(define pi 3.14159265358979)

(define (fahrenheit-to-celsius temp)
  (* (/ 5 9) (- temp 32)))

(define (celsius-to-fahrenheit temp)
  (+ (* (/ 9 5) temp) 32))

(define (fourth x)
  (* x x x x))

(define (fourth x)
  (square (square x)))

(define (abs x)
  (sqrt (square x)))

(define (scientific base tens)
  (* base (expt 10 tens)))

(define (discount original percentage)
  (* original (/ (- 100 percentage) 100)))

(define (raw-tip price)
  (* 0.15 price))

(define (tip-total price)
  (+ price (raw-tip price)))

(define (tip price)
  (+ (raw-tip 25.95)
     (- (ceiling (tip-total 25.95)) (tip-total 25.95))))

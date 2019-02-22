; double
(define (double wd)
  (word wd wd))

; downup
(define (downup wd)
  (if (= (count wd) 1)
      (se wd)
      (se wd (downup (bl wd)) wd)))

; get nth fibonacci number
(define (fib n)
  (if (<= n 2) 1
      (+ (fib (- n 1))
         (fib (- n 2)))))

; my addition - get sequence of fibonacci numbers to nth
(define (fib-sequence n)
  (if (= n 0) '()
      (se (fib-sequence (- n 1)) (fib n))))
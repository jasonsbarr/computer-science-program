; chapter examples
; reverse
(define (reverse wd)
  (if (empty? wd) ""
      (word (last wd) (reverse (bl wd)))))

; factorial
(define (factorial num)
  (if (= num 0) 1
      (* num (factorial (- num 1)))))

; downup
(define (downup wd)
  (if (= (count wd) 1)
      (se wd)
      (se wd (downup (bl wd)) wd)))

; get even words of sentence
(define (evens sent)
  (if (<= (count sent) 1) '()
      (se (first (bf sent))
          (evens (bf (bf sent))))))

; fixing the square sentence function
(define (square x)
  (* x x))

(define (square-sent sent)
  (if (empty? sent) '()
      (se (square (first sent))
          (square-sent (bf sent)))))

; get number to nth power
(define (pow base exp)
  (if (= exp 0) 1
      (* base (pow base (- exp 1)))))

; add sequence of numbers
(define (addup nums)
  (if (empty? nums) 0
      (+ (first nums) (addup (bf nums)))))

; fix acronym function
(define (acronym sent)
  (if (empty? sent) ""
      (word (first (first sent))
            (acronym (bf sent)))))

; what does f do?
; reverses the sentence
(define (f sent)
  (if (empty? sent) '()
      (se (f (butfirst sent)) (first sent))))
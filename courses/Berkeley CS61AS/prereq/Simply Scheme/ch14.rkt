; necessary helper functions
(define (square x)
  (* x x))

(define (vowel? c)
  (member? c 'aeiou))

; common patterns in recursive functions

; every - performs an operation on every
; member of a sequential data structure
(define (square-sent sent)
  (if (empty? sent) '()
      (se (square (first sent))
          (square-sent (bf sent)))))

; keep - filter out elements of a sequential
; data structure that meet certain criteria
(define (keep-three-letter-words sent)
  (cond ((empty? sent) '())
        ((= (count (first sent)) 3)
         (se (first sent) (keep-three-letter-words (bf sent))))
        (else (keep-three-letter-words (bf sent)))))

(define (keep-vowels wd)
  (cond ((empty? wd) "")
        ((vowel? (first wd))
         (word (first wd) (keep-vowels (bf wd))))
        (else (keep-vowels (bf wd)))))

; accumulate - combine all elements of arg
; into a single result
(define (addup nums)
  (if (empty? nums) 0
      (+ (first nums) (addup (bf nums)))))

(define (scrunch-words sent)
  (if (empty? sent) ""
      (word (first sent) (scrunch-words (bf sent)))))
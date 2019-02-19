; Iteration in Scheme using higher order functions
(define (first-letters sent)
  (every first sent)) ; every is like forEach

(every last '(while my guitar gently weeps))

(every - '(4 5 6 7 8 9))

; Using every with your own function
(define (plural noun)
  (if (equal? (last noun) 'y)
      (word (bl noun) 'ies)
      (word noun 's)))

(every plural '(beatle turtle holly kink zombie))

(define (double letter)
  (word letter letter))

(every double 'girl)

(define (square x)
  (* x x))

(every square 547)

(define (sent-of-first-two wd)
  (se (first wd) (first (bf wd))))

(every sent-of-first-two '(the inner light))

(define (g wd)
  (se (word 'with wd) 'you))

(every g '(in out))

; keep is like filter
(keep even? '(1 2 3 4 5))

(define (ends-e? word)
  (equal? (last word) 'e))

(keep ends-e? '(please put the salami above the blue elephant))

(keep number? '(1 after 909))

(keep number? 'zonk23hey9)

(define (vowel? letter)
  (member? letter '(a e i o u)))

(keep vowel? 'piggies)

; accumulate is like reduce
(accumulate + '(6 3 4 -5 7 8 9))

(accumulate word '(a c l u))

(accumulate max ' (128 32 134 136))

(define (hyphenate word1 word2)
  (word word1 '- word2))

(accumulate hyphenate '(ob la di ob la da))

(accumulate sentence 'jason)

(define (add-numbers sent)
  (accumulate + (keep number? sent)))

(add-numbers '(4 calling birds 3 french hens 2 turtle doves))

(define (always-one arg)
  1)

(define (count-elems item)
  (accumulate + (every always-one item)))

; ((repeated func n) (item)) simply applies
; the function arg n times to item. has outer
; parens because each iteration returns function
; to be applied to item. For example:
; (repeated bf 3) -> (bf (bf (bf )))
((repeated bf 3) '(she came in through the bathroom window))
; -> (bf (bf (bf '(she came in through the bathroom window))))

((repeated plural 4) 'computer)

((repeated square 2) 3)

(define (double sent)
  (se sent sent))

(double 'banana)

((repeated double 3) '(banana))

((repeated square 4) 2)

(define (item n sent)
  (first ((repeated bf (- n 1)) sent)))

(item 4 '(a day in the life))

;(define (any-numbers? se) ; won't work
;  (if (every number? se) #t
;      #f))

(define (any-numbers? se)
  (not (empty? (keep number? se))))

; my own functions to play with HOFs
(define (char? c)
  (member? c 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ))

(define (make-int num)
    (round (floor num)))

(define (% numerator denominator)
    (- numerator (* denominator (make-int (/ numerator denominator)))))

(define (keep-numbers se)
  (keep number? (accumulate word se)))

(define (absval num)
  (if (< 0 num) num
      (- num)))
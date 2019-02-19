(define (vowel? c)
  (member? c '(a e i o u)))

(define beatles '(john paul george ringo))

; Exercise 8.4 - choose beatles
(define (choose-beatles pred)
  (keep pred beatles))

(define (ends-vowel? wd)
  (vowel? (last wd)))

(define (even-count? wd)
  (even? (count wd)))

; Exercise 8.5 - transform beatles
(define (transform-beatles transform)
  (every transform beatles))

(define (amazify name)
  (word 'the-amazing- name '!))

; Exercise 8.6 - phonetic alphabet
(define (phonetic-letter letter)
  (cond ((equal? letter 'a) 'alpha)
        ((equal? letter 'b) 'bravo)
        ((equal? letter 'c) 'charlie)
        ((equal? letter 'd) 'delta)
        ((equal? letter 'e) 'echo)
        ((equal? letter 'f) 'foxtrot)
        ((equal? letter 'g) 'golf)
        ((equal? letter 'h) 'hotel)
        ((equal? letter 'i) 'india)
        ((equal? letter 'j) 'juliett)
        ((equal? letter 'k) 'kilo)
        ((equal? letter 'l) 'lima)
        ((equal? letter 'm) 'mike)
        ((equal? letter 'n) 'november)
        ((equal? letter 'o) 'oscar)
        ((equal? letter 'p) 'papa)
        ((equal? letter 'q) 'quebec)
        ((equal? letter 'r) 'romeo)
        ((equal? letter 's) 'sierra)
        ((equal? letter 't) 'tango)
        ((equal? letter 'u) 'uniform)
        ((equal? letter 'v) 'victor)
        ((equal? letter 'w) 'whiskey)
        ((equal? letter 'x) 'xray)
        ((equal? letter 'y) 'yankee)
        ((equal? letter 'z) 'zulu)
        (else #f)))

(define (phonetic wd)
  (every phonetic-letter wd))

; Exercise 8.7 - count letters
(define (letter-count se)
  (count (keep letter? (accumulate word se))))

(define (letter? c)
  (member? c 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ))

; Exercise 8.8 - exaggerate
(define (replace item)
  (cond ((number? item) (* item 2))
        ((equal? item 'good) 'great)
        ((equal? item 'bad) 'terrible)
        (else item)))

(define (exaggerate se)
  (every replace se))

; Exercise 8.9 - every, keep, accumulate - return exact sentence used as argument
; every - (every word se)
; keep - either word or sentence works
; accumulate - (accumulate sentence se)

; Exercise 8.10 - true for all?
(define (every? pred se)
  (= (count se) (count (keep pred se))))

; Exercise 8.11 - GPA
(define (base-grade letter)
  (cond ((equal? letter 'A) 4)
        ((equal? letter 'B) 3)
        ((equal? letter 'C) 2)
        ((equal? letter 'D) 1)
        (else 0)))

(define (grade-modifier sign)
  (cond ((equal? sign '+) 0.33)
        ((equal? sign '-) -0.33)
        (else 0)))

(define (grade-value grade)
  (let ((split-grade (every sentence grade)))
        (+ (base-grade (first split-grade))
           (grade-modifier (last split-grade)))))

(define (gpa grades)
  (/ (accumulate + (every grade-value grades))
     (count grades)))

; Exercise 8.12 - count the ums
(define (um? wd)
  (equal? 'um wd))

(define (count-ums se)
  (count (keep um? se)))

; Exercise 8.13 - translate letters to phone number
(define (translate-letter letter)
  (cond ((or (equal? letter 'a)
             (equal? letter 'b)
             (equal? letter 'c)) 2)
        ((or (equal? letter 'd)
             (equal? letter 'e)
             (equal? letter 'f)) 3)
        ((or (equal? letter 'g)
             (equal? letter 'h)
             (equal? letter 'i)) 4)
        ((or (equal? letter 'j)
             (equal? letter 'k)
             (equal? letter 'l)) 5)
        ((or (equal? letter 'm)
             (equal? letter 'n)
             (equal? letter 'o)) 6)
        ((or (equal? letter 'p)
             (equal? letter 'q)
             (equal? letter 'r)
             (equal? letter 's)) 7)
        ((or (equal? letter 't)
             (equal? letter 'u)
             (equal? letter 'v)) 8)
        ((or (equal? letter 'w)
             (equal? letter 'x)
             (equal? letter 'y)
             (equal? letter 'z)) 9)
        ((number? letter) letter)
        (else #f)))

(define (phone-unspell wd)
  (accumulate word (every translate-letter wd)))

; Exercise 8.14 - subword
(define (subword wd start end)
  ((repeated bf (- start 1)) ((repeated bl (- (count wd) end)) wd)))

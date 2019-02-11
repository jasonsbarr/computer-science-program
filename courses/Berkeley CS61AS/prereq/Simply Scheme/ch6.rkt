(define (square x)
  (* x x))

(define (greet name)
  (if (equal? (first name) 'professor)
      (sentence '(I hope I am not bothering you) 'professor (last name))
      (sentence '(Good to see you) (first name))))

(define (vowel? letter)
  (member? letter 'aeiouAEIOU))

(define (positive? number)
  (> number 0))

(define (abs num)
  (sqrt (square num))) 

(define (buzz num)
  (if (or (divisible? num 7) (member? 7 num))
      'buzz
      num))

(define (divisible? big little)
  (= (remainder big little) 0))

(define (plural wd) ; first version
  (word wd 's))

(define (plural wd) ; second version
  (if (equal? (last wd) 'y)
      (word (butlast wd) 'ies)
      (word wd 's)))

(define (divisible-by-4? x)
  (and (number? x) (divisible? x 4)))

(define (integer-quotient dividend divisor) ; first version
  (if (divisible? dividend divisor)
      (/ dividend divisor)
      #f))

(define (integer-quotient dividend divisor) ; second version
  (and (divisible? dividend divisor)
       (/ dividend divisor)))

(define (roman-value letter)
  (cond ((equal? letter 'i) 1)
        ((equal? letter 'v) 5)
        ((equal? letter 'x) 10)
        ((equal? letter 'l) 50)
        ((equal? letter 'c) 100)
        ((equal? letter 'd) 500)
        ((equal? letter 'm) 1000)
        (else '(Not a Roman Number))))

(define (sign number)
  (cond ((< number 0) 'negative)
        ((= number 0) 'zero)
        ('positive)))

(define (utensil meal)
  (if (equal? meal 'chinese) 'chopsticks
      'fork))

(define (european-time time)
  (cond ((equal? (last time) 'pm) (+ (first time) 12))
        ((equal? (first time) 12) 0)
        (else (first time))))

(define (american-time time)
  (cond ((= time 0) '(12 am))
        ((< time 12) (sentence time 'am))
        ((= time 12) (sentence time 'pm))
        (else (sentence (- time 12) 'pm))))

(define (teen? age)
  (and (< 12 age) (> 20 age)))

(define (type-of argument)
  (cond ((number? argument) 'number)
        ((sentence? argument) 'sentence)
        ((word? argument) 'word)
        ((boolean? argument) 'boolean)
        (else '(I "don't" know what just happened))))

(define (indef-article wd)
  (if (vowel? (first wd)) (sentence 'an wd)
      (sentence 'a wd)))

(define (thismany number noun)
  (sentence number (plural noun)))

(define (sort2 num1 num2)
  (if (< num2 num1) (sentence num1 num2)
      (sentence num2 num1)))

(define (valid-number? num top)
  (and (< 0 num) (>= top num)))

(define (days-in-month m y)
  (if (valid-number? m 12)
    (cond ((or (= m 1) (= m 3) (= m 5) (= m 7) (= m 8) (= m 10) (= m 12)) 31)
          ((or (= m 4) (= m 6) (= m 9) (= m 11)) 30)
          ((and (= m 2) (divisible? y 400)) 29)
          ((and (= m 2) (divisible? y 4) (not (divisible? y 100))) 29)
          (else 28)) 0))

(define (valid-date? month day year)
  (and (and (number? month) (number? day) (number? year))
       (valid-number? month 12)
       (valid-number? day (days-in-month month year))))

(define (plural wd) ; third version
  (cond ((and (equal? (last wd) 'y)
              (vowel? (last (butlast wd))))
         (word wd 's))
        ((equal? (last wd) 'y) (word (butlast wd) 'ies))
        (else (word wd 's))))

(define (greet name) ; second version
  (cond ((or (equal? (first-two-chars name) 'dr)
             (equal? (first-two-chars name) 'Dr))
         (sentence '(Hello Dr.) (last name)))
        ((or (equal? (first-three-chars name) 'mrs)
             (equal? (first-three-chars name) 'Mrs))
         (sentence '(Hello Mrs.) (last name)))
        ((or (equal? (first-two-chars name) 'mr)
             (equal? (first-two-chars name) 'Mr))
         (sentence '(Hello Mr.) (last name)))
        ((or (equal? (first name) 'king)
             (equal? (first name) 'King)
             (equal? (first name) 'queen)
             (equal? (first name) 'Queen))
         '(Hello Your Majesty))
        ((or (equal? name '(David Livingstone))
             (equal? name '(david livingstone)))
         '(Dr Livingstone I presume?))
        (else (sentence 'Hello (first name)))))

(define (first-two-chars entity)
  (cond ((sentence? entity)
         (word (first (first entity)) (first (butfirst (first entity)))))
        ((word? entity) (word (first entity) (first (butfirst entity))))
        (else "")))

(define (first-three-chars entity)
  (word (first-two-chars entity)
        (cond ((sentence? entity)
               (item 3 (first entity)))
              ((word? entity)
               (item 3 entity))
              (else ""))))
            
(define (describe-time seconds)
  (if (number? seconds)
      (cond ((< seconds 60) (sentence seconds 'seconds))
            ((> seconds (seconds-in-millennium))
             (sentence (get-millennia seconds) 'millennia))
            ((> seconds (seconds-in-century))
             (sentence (get-centuries seconds) 'centuries))
            ((> seconds (seconds-in-decade))
             (sentence (get-decades seconds) 'decades))
            ((> seconds (seconds-in-year))
             (sentence (get-years seconds) 'years))
            ((> seconds (seconds-in-week))
             (sentence (get-weeks seconds) 'weeks))
            ((> seconds (seconds-in-day))
             (sentence (get-days seconds) 'days))
            ((> seconds (seconds-in-hour))
             (sentence (get-hours seconds) 'hours))
            ((> seconds (seconds-in-hour))
             (sentence (get-hours seconds) 'hours))
            ((> seconds 60)
             (sentence (exact->inexact (/ seconds 60)) 'minutes))
            (else 0))
      0))
(define (seconds-in-millennium)
  (* (+ (* 60 60 24 7 52) 1) 10 10 10))

(define (get-millennia seconds)
  (/ seconds (exact->inexact (seconds-in-millennium))))

(define (seconds-in-century)
  (* (+ (* 60 60 24 7 52) 1) 10 10))

(define (get-centuries seconds)
  (/ seconds (exact->inexact (seconds-in-century))))

(define (seconds-in-decade)
  (* (+ (* 60 60 24 7 52) 1) 10))

(define (get-decades seconds)
  (/ seconds (exact->inexact (seconds-in-decade))))

(define (seconds-in-year)
  (+ (* 60 60 24 7 52) 1))

(define (get-years seconds)
  (/ seconds (exact->inexact (seconds-in-year))))

(define (seconds-in-week)
  (* 60 60 24 7))

(define (get-weeks seconds)
  (/ seconds (exact->inexact (seconds-in-week))))

(define (seconds-in-day)
  (* 60 60 24))

(define (get-days seconds)
  (/ seconds (exact->inexact (seconds-in-day))))

(define (seconds-in-hour)
  (* 60 60))

(define (get-hours seconds)
  (/ seconds (exact->inexact (seconds-in-hour))))

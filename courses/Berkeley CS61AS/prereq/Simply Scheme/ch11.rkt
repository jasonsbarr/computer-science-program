; my attempt
; (define (explode wd sent)
;  (if (< (count wd) 2)
;      (sentence sent wd)
;      (explode (bf wd) (sentence sent (first wd)))))

; book answer
(define (explode wd)
  (if (empty? wd)
      '()
      (se (first wd) (explode (bf wd)))))

(define (letter-pairs wd)
  (if (< (count wd) 2) '()
      (sentence (word (first wd) (first (bf wd)))
                (letter-pairs (bf wd)))))

; count-ums, recursive version of 8.12
(define (count-ums sent)
  (if (< (count sent) 1) 0
      (if (equal? (first sent) 'um)
          (+ 1 (count-ums (bf sent)))
          (count-ums (bf sent)))))

; phone-unspell, recursive version of 8.13
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
        (else "")))

(define (phone-unspell wd)
  (if (= (count wd) 0) ""
      (word (translate-letter (first wd)) (phone-unspell (bf wd)))))

; gets initials of sentence
(define (initials sent)
  (if (equal? sent '()) '()
      (se (first (first sent)) (initials (bf sent)))))

; countdown
(define (countdown num)
  (if (= 0 num) '(BLASTOFF!)
      (sentence num (countdown (- num 1)))))

; copies
(define (copies num wd)
  (if (= num 0) '()
      (sentence wd (copies (- num 1) wd))))
(define (square x)
  (* x x))

(define (second thing)
  (first (butfirst thing)))

(define (plural wd)
  (word wd 's))

(define (f1 sent1 sent2)
  (sentence (butfirst sent1) (butlast sent2)))

(define (f2 sent1 sent2)
  (sentence (f1 sent1 sent2) (word (first sent1) (last sent2))))

(define (f3 sent1 sent2)
  (sentence sent1 sent1))

(define (f4 sent1 sent2)
  (word (item 2 sent1) (item 2 sent2)))

(define (third thing)
  (item 3 thing))

(define (first-two wd)
  (word (first wd) (first (butfirst wd))))

(define (two-first wd1 wd2)
  (word (first wd1) (first wd2)))

(define (two-first-sent sent)
  (word (first (first sent)) (first (first (butfirst sent)))))

(define (knight name)
  (sentence 'Sir name))

;(define (ends word)
;  (word (first word) (last word)))

(define (insert-and sent)
  (sentence (butlast sent) 'and (last sent)))

(define (middle-names name)
  (butlast (butfirst name)))

(define (query statement)
  (sentence
   (item 2 statement)
   (first statement)
   (butfirst (butfirst (butlast statement)))
   (word (last statement) '?)))
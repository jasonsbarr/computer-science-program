(define (make-conjugator prefix ending)
  (lambda (verb) (sentence prefix (word verb ending))))

(define third-person (make-conjugator 'she 's))

(define third-person-plural-past (make-conjugator 'they 'ed))

(define second-person-future-perfect
  (make-conjugator '(you will have) 'ed))
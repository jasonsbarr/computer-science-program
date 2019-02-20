; Chapter 9 examples
(define (add-three-to-each sent)
  (every (lambda (number) (+ number 3)) sent))

; invoking a lambda directly
((lambda (a b) (+ (* 2 a) b)) 5 6)

((lambda (wd) (word (last wd) (first wd))) 'impish)

; use as argument to higher order function
; note that lambda isn't the argument; the
; function returned by lambda is
(every (lambda (wd) (se (first wd) wd (last wd)))
       '(only a northern song))

(keep (lambda (n) (member? 9 n)) '(4 81 909 781 1969 1776))

(accumulate (lambda (this that)
              (if (> (count this) (count that)) this that))
            '(wild honey pie))

(keep (lambda (person) (member? person '(john paul george ringo)))
      '(mick smokey paul diana bill geddy john yoko keith reparata))

; Functions that return functions
(define (make-adder num)
  (lambda (x) (+ x num)))

((make-adder 4) 7) ; note extra parens - invokes function returned by inner function

(every (make-adder 6) '(2 4 8))

; using a lambda with a function whose argument is a function
(define (same-arg-twice fn)
  (lambda (arg) (fn arg arg)))

(define (flip fn)
  (lambda (a b) (fn b a)))

; the truth about define
; define's real job is to give a name to some value
; this is no different when the value is a function
; so (define (square x) (* x x)) is abbreviation for
; (define square (lambda (x) (* x x)))

; using define in combination with function-creating functions
(define square (same-arg-twice *))
(define fourth-power (repeated square 2))

; the truth about let:
; it's an abbreviation for creating and invoking
; an anonymous function - a lambda

; let is an abbreviation for a lambda and its invocation

; don't use the same formal parameter in an inner function
; as in the outer one - inner scope will supercede outer
; if this happens you're probably doing it wrong

; using a lambda, an unnamed function, to help define a named function:
(define (backwards wd)
  (accumulate (lambda (a b) (word b a)) wd))

(backwards 'yesterday)
(every backwards '(i saw her standing there))

; Keep words of a sentence that contain 'h
(define (keep-h sent)
  (keep (lambda (wd) (member? 'h wd)) sent))

; function that returns functions to keep words containing a letter
(define (keeper letter)
  (lambda (sent)
    (keep (lambda (wd) (member? letter wd)) sent)))

; use that function to produce keep-h
(define keep-h (keeper 'h))

; do same thing with make-adder from above
(define add4 (make-adder 4))

; remember, define just assigns a value to the label
; in this case, the value is the function returned
; by the function factory function

; don't confuse the creation of a function with the invocation of one
(lambda (x y) (* x y)) ; returns function to multiply x * y
((lambda (x y) (* x y)) 3 4) ; returns function and invokes with args 3, 4
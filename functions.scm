;;; Math functions to be used by the calculator.
;;; Each should demonstrate some feature or syntax of Scheme.

; Example function
(define (hi)
    (write 'hi))

; Calculate derivatives
; From http://www.javaist.com/blog/2008/11/05/derivative-calculator-in-scheme/
(define (deriv exp var)
    (cond
        ((constant? exp) 0)
        ((variable? exp)
         (if (same-var? exp var)
             1 0))
        ((sum? exp) (make-sum (deriv (term1 exp) var)
                              (deriv (term2 exp) var)))
        ((product? exp)
        (make-sum (make-product (deriv (fact1 exp) var) (fact2 exp))
                  (make-product (fact1 exp) (deriv (fact2 exp) var))))
        ))

(define constant? number?)
(define variable? symbol?)
(define same-var? eq?)
(define (sum? exp)
    (and (pair? exp) (eq? '+ (cadr exp))))
(define (make-sum a b)
    (cond ((eq? a 0) b)
          ((eq? b 0) a)
          (else (list a '+ b))))
(define term1 car)
(define term2 caddr)
(define (product? exp)
    (and (pair? exp) (eq? '* (cadr exp))))
(define (make-product a b)
    (cond ((eq? a 0) 0)
          ((eq? b 0) 0)
          ((eq? a 1) b)
          ((eq? b 1) a)
          (else (list a '* b))))
(define fact1 car)
(define fact2 caddr)

; Extremely simple factorial function
(define (! n)
    (if (<= n 1) 1
        (* n (! (- n 1)))))

; Power funtion
; From http://see.stanford.edu/materials/icsppcs107/30-Scheme-Functions.pdf
(define (pwr base exponent)
    (if (zero? exponent) 1
        (let ((root (pwr base (quotient exponent 2))))
            (if (zero? (remainder exponent 2))
                (* root root)
                (* root root base)))))

; Partition
; From http://see.stanford.edu/materials/icsppcs107/30-Scheme-Functions.pdf
(define (partition pivot num-list)
    (if (null? num-list) '(() ())
        (let ((split-of-rest (partition pivot (cdr num-list))))
            (if (< (car num-list) pivot)
                (list (cons (car num-list) (car split-of-rest))
                    (cadr split-of-rest))
                (list (car split-of-rest) (cons (car num-list)
                    (car (cdr split-of-rest))))))))

; Quick sort
; From http://see.stanford.edu/materials/icsppcs107/30-Scheme-Functions.pdf
(define (quicksort num-list)
    (if (<= (length num-list) 1) num-list
        (let ((split (partition (car num-list) (cdr num-list))))
            (append (quicksort (car split))       ;; recursively sort first half
                    (list (car num-list))         ;; package pivot as a list
                    (quicksort (cadr split))))))  ;; recursively sort second half

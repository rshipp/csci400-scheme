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

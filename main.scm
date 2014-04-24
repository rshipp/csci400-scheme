#!/usr/bin/guile \
-e main -s
!#


(import (rnrs base)            ; define-syntax
        (rnrs exceptions))     ; get `with-exception-handler`

; Exception handling
(define-syntax try
  (syntax-rules (catch)
    ((_ body (catch catcher))
     (call-with-current-continuation
      (lambda (exit)
        (with-exception-handler
         (lambda (condition)
           catcher
           (exit condition))
         (lambda () body)))))))

; Math functions



; Main calculator loop
(define (main args)
    (program-loop))

(define (write-if-specified input)
    (if (not (unspecified? input))
        (write input)))

(define (eval-input input)
    (if (not (eof-object? input))
            (try (begin
                (write-if-specified (eval input (current-module)))
                (newline))
            (catch (display "invalid syntax\n")))
        (begin
            (display 'goodbye!)
            (newline)
            (quit))))

(define (program-loop)
    (eval-input (read))
    (program-loop))

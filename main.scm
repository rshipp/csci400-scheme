#!/usr/bin/guile \
-e main -s
!#

(import (rnrs base)            ; define-syntax
        (rnrs exceptions))     ; get `with-exception-handler`

(load "functions.scm")

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

; Main calculator loop and helper functions
(define (main args)
    (program-loop))

(define (write-if-specified input)
    (if (not (unspecified? input))
        (write input)))

(define (eval-input input)
    (if (not (eof-object? input))
        (try
            (begin
                (write-if-specified (eval input (current-module)))
                (newline))
            (catch (display "invalid syntax\n")))
        (begin
            (display 'goodbye!)
            (newline)
            (quit))))

(define (program-loop)
    (display "> ")
    (eval-input (read))
    (program-loop))

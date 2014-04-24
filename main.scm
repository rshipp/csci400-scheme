#!/usr/bin/guile \
-e main -s
!#

(define (main args)
    (program-loop))

(define (write-if-specified input)
    (if (not (unspecified? input))
        (write input)))

(define (eval-input input)
    (if (not (eof-object? input))
        (begin
            (write-if-specified (eval input (current-module)))
            (newline))
        (begin
            (display 'goodbye!)
            (newline)
            (quit))))

(define (program-loop)
    (eval-input (read))
    (program-loop))

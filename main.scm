#!/usr/bin/guile \
-e main -s
!#

(import (ice-9 rdelim))

(define (main args)
    (program-loop))

(define (eval-input input)
    (if (not (eof-object? input))
        (begin
            (display input)
            (newline))
        (begin
            (display 'goodbye!)
            (newline)
            (quit))))

(define (program-loop)
    (begin
        (eval-input (read-line))
        (program-loop)))

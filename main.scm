#!/usr/bin/guile \
-e main -s
!#

(import (ice-9 rdelim))

(define (main args)
    (program-loop))

(define (program-loop)
    (begin
        (if 
        (display (read-line))
        (newline)
        (program-loop)))

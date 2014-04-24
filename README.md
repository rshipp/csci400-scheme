csci400-scheme
==============

Final project for CSCI400: Programming Languages, Spring 2014.

A simple calculator REPL written in Scheme to exemplify several features
of the language. This was written for the [GNU
Guile](https://www.gnu.org/software/guile/) Scheme implementation.

The following features of Scheme are used:

* [closures](functions.scm#L16-17)
* [currying](functions.scm#L81-L84)
* [cond](functions.scm#L11) (conditional expression)
* [exception handling](main.scm#L11-L20)
    ([SO](https://stackoverflow.com/questions/16493079/how-to-implement-a-try-catch-block-in-scheme))
* [functions](main.scm#L23-L45)
* [hygenic macros](main.scm#L11)
* [if expression](main.scm#L31)
* [lambda expressions](main.scm#L15)
* [let expression](functions.scm#L54)
* [loading resources from local files](main.scm#L8)
* [list operations](functions.scm#L74-L77) (car, cdr and cadr)
* [REPL](main.scm#L30-L45) (read-eval-print loop)
* [symbols](functions.scm#L13)
* [tail call optimization](main.scm#L45)

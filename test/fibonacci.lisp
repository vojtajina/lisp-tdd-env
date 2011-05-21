(load "lisp-unit.fas")
(use-package :lisp-unit)

(load "fibonacci.lisp")

(define-test fibonacci
  ; basic
  (assert-equal 0 (fib 0))
  (assert-equal 1 (fib 1))
  (assert-equal 1 (fib 2))
  (assert-equal 2 (fib 3))
  (assert-equal 3 (fib 4))
  (assert-equal 5 (fib 5))
  (assert-equal 55 (fib 10))
  (assert-equal 6765 (fib 20))
)

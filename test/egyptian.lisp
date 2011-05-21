(load "lib/lisp-unit.fas")
(use-package :lisp-unit)

(load "src/egyptian.lisp")

(define-test egyptian-fraction
  (assert-equal (list 2 4) (egyptian 3 4))
  (assert-equal (list 2 3 42) (egyptian 6 7))
)

(define-test find-n-basic
  (assert-equal 1 (find-n 1))
  (assert-equal 2 (find-n 0.75))
  (assert-equal 2 (find-n 0.5))
  (assert-equal 3 (find-n 0.4))
  (assert-equal 4 (find-n 0.3))
)

(define-test normalize
  (assert-equal (values 1 3) (normalize 2 6))
  (assert-equal (values 2 3) (normalize 4 6))
)

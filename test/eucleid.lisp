(load "lib/lisp-unit.fas")
(use-package :lisp-unit)

(load "src/eucleid.lisp")

; TOOLS for testing multiple values separately
; when the function returns more values, we want to test them separately,
; so that the failed test has better explanation

; returns first value
(defun 1-val (vals)
  (car (multiple-value-list (eval vals)))
)

; returns second value
(defun 2-val (vals)
  (cadr (multiple-value-list (eval vals)))
)

; returns third value
(defun 3-val (vals)
  (caddr (multiple-value-list (eval vals)))
)

; returns second and third value (as a list)
(defun 23-val (vals)
  (cdr (multiple-value-list (eval vals)))
)

; test above tools
(define-test test-tool
  (assert-equal 1 (1-val '(values 1 2 3)))
  (assert-equal 2 (2-val '(values 1 2 3)))
  (assert-equal 3 (3-val '(values 1 2 3)))
  (assert-equal (list 2 3) (23-val '(values 1 2 3)))
)

; =======================================================================

; test basic GCD algorithm
(define-test eucleid-basic
  (assert-equal 1 (eucleid-extend 4 1))
  (assert-equal 2 (eucleid-extend 6 4))
  (assert-equal 7 (eucleid-extend 427 133))
)

(define-test eucleid-bezout
  (assert-equal
   (list -4 7)
   (23-val '(eucleid-extend 19 11)))

  (assert-equal
   (list 5 -16)
   (23-val '(eucleid-extend 427 133)))
)

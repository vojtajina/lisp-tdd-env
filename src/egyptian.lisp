
; Egyptian fractions
; Returns a list of integer n1, n2, n3, ... so that:
; P/Q = sum(1/n1, 1/n2, 1/n3, ...)
; see http://en.wikipedia.org/wiki/Egyptian_fraction
(defun egyptian (P Q)
  (cond
    ((= P 0) NIL)
    ((= P 1) Q)
    (T (cons (find-n (/ P Q))
       (egyptian (- (* (find-n (/ P Q)) P) Q) (* P Q)))))
)

; Find first (smallest) number N, so that
; 1/N <= PQ
(defun find-n (PQ)
  (find-n-iter PQ 1)
)

(defun find-n-iter (PQ N)
  (if (<= (/ 1 N) PQ) N (find-n-iter PQ (+ N 1)))
)

; Normalize fraction P/Q
; i.e. 2/6 -> 1/3, 12/30 -> 2/5
(defun normalize (P Q)
  (normalize-iter P Q 2)
)

(defun normalize-iter (P Q F)
  (if (> F (min P Q))
      (values P Q)
      (if (and (= 0 (mod P F)) (= 0 (mod Q F)))
	  (normalize-iter (/ P F) (/ Q F) (+ F 1))
	  (normalize-iter P Q (+ F 1))
      )
  )
)

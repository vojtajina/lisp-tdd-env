; Extended Eucleid Algorithm
; returns muli-value (gcd, alfa, beta)
; gcd = greatest common divisor (A, B)
; alfa x A + beta x B = 1
; input condition: A >= B
(defun eucleid-extend (A B)
  (eucleid-iter A B 0 1 1 0 0 0)
)

(defun eucleid-iter (A B L-1 L-2 B-1 B-2 Q-1 Q-2)
  (if (= B 0)
      (values A (eucl-step L-1 L-2 Q-2) (eucl-step B-1 B-2 Q-2))
      (progn
	; A = B x Q + R
        (multiple-value-setq (Q R) (floor A B))
        (eucleid-iter B R (eucl-step L-1 L-2 Q-2) L-1 (eucl-step B-1 B-2 Q-2) B-1 Q Q-1)
      )
  )
)

; count current alfa L, or beta B
; from previous values
(defun eucl-step (X-1 X-2 Q-2)
  (- X-2 (* Q-2 X-1))
)

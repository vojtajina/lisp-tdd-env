(defun fib (n)
  (iter-fun-exp 'fib-step n 0 1)
)

(defun fib-step (a b)
  (values b (+ a b)))

(defun compose-2 (f g)
  (lambda (&rest args)
    (apply f (multiple-value-list (apply g args)))))

(defun compose (&rest functions)
  (if (null functions) #'values
      (compose-2 (car functions)
		 (apply 'compose (cdr functions)))))

(defun iter-fun (fn n &rest args)
  (apply (apply 'compose (loop for i below n collect fn)) args))

(defun fn-expt (fn n &optional (seed #'values))
  (if (zerop n) seed
      (fn-expt (compose-2 fn fn)
	       (ash n -1)
	       (if (oddp n) (compose fn seed) seed))))

(defun iter-fun-exp (fn n &rest args)
  (apply (fn-expt fn n) args))

(fib 100)



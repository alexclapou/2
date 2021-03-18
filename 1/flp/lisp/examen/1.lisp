(defun lgm(l)
  (cond
    ((atom l) 0)
    (t(max (length l) (apply #'max(mapcar #'lgm l))))
    )
  )
(setf x '(1 (1 2 3 4 5 6 7 8 9)aa 3 4 5))
(print (lgm x))

;Write a function to return the sum of two vectors.
#|
compute_sum(l1l2..ln, k1k2..km)
    [], if l empty and k empty
    lx..ln, if k empty and l not empty
    ky..km, if l empty and k not empty
    l1+k1 U compute_sum(l2..ln, k2..km)
|#
(defun compute_sum(l1 l2)
  (cond
    ((and (null l1) (null l2)) nil)
    ((null l1) l2)
    ((null l2) l1)
    (t(cons (+ (car l1) (car l2)) (compute_sum (cdr l1) (cdr l2))))
    )
  )
(setf v1 '(1 2 3 4 10))
(setf v2 '(4 5 6))
;(print (compute_sum v1 v2))

;Write a function to get from a given list the list of all atoms, on any
;level, but on the same order. Example
#|
same_level(l1l2..ln)=
    [], l empty
    same_level(l1) U same_level(l2..ln) if l1 is list
    [l1] U same_level(l2..ln) otherwise
|#
(defun same_level(l)
  (cond
    ((null l) nil)
    ((listp (car l)) (append(same_level(car l)) (same_level(cdr l))))
    (t (append (list(car l)) (same_level(cdr l))))
    )
  )
;(((A B) C) (D E))
(setf v1 (list (list (list 'A 'B) 'C) (list 'D 'E)))
;(print(same_level v1))

(DEFUN INVERS (L)
(COND
((ATOM L) L)
(T (APPEND (INVERS (CDR L)) (LIST (CAR L))))
)
)

;get next list
;create_list(l1l2..ln) =
;   [], l empty
;   reverse(l1..lk) U create_list(get_next_list(l1..ln)) otherwise
;
;(a b c (d (e f) g h i)) 
;same until 
(defun create_list(l)
  (cond
    ((null l) nil)
    (t 
       (setf next (get_next_list l))
       (append (rev l) (list (create_list next)))
       )
    )
  )

;get next list after sequence
(defun get_next_list(l)
  (cond
    ((null l) nil)
    ((and (listp (car l)) (not(cdr l))) (car l))
    ((and (listp(car l)) (listp(cdr l))) (append(car l)(list(cdr l))))
    ((listp (car l)) (append (list(car l)) (cdr l)))
    (t(get_next_list(cdr l)))
    )
  )

;reverse list until new sequence
(defun rev(l)
  (cond
    ((= (list-length l) 1) l)
    ((null (cdr l)) nil)
    ((listp(car(cdr l))) (list(car l)))
    ((and (listp(car l)) (listp(cdr l))) (INVERS(car l)))
    (t(append(rev(cdr l))(list(car l))))
  )
)

;pe ex nil T
(setf v2 '(a b c(d(e f)g h i)))
;(print (create_list v2))
#|
maximum_number(a, b)= 
    -999999, if a is not number and b is not number
    a, if a is number and  b is not number
    b, if a is not number and b is number
    a, if a is number and b is number and a > b
    b, otherwise
|#
(defun maximum_number(n1 n2)
  (cond
    ((and (not(numberp n1)) (not(numberp n2))) nil)
    ((not(numberp n1)) n2)
    ((not(numberp n2)) n1)
    ((< n1 n2) n2)
    ((>= n1 n2) n1)
    )
  )

#|
find_max(l1l2..ln)=
   -9999999, if list is empty
    maximum_number(l1, find_max(l2..ln)), otherwise
|#
(defun find_max(l)
  (cond
    ((null l) nil)
    (t(maximum_number (car l) (find_max(cdr l))))
  )
  )

(setf v1 '(5555 A  555 1 41 3 B C 14 5555))
(print (find_max v1))

#|
left_side(l1l2..ln, nn, ne) = {
    [], l is empty
    [], nn = ne+1
    l1 U l2 U left_side(l3..ln, nn+1, ne+l2)
}
|#
(defun left_side(tree number_nodes number_edges)
  (cond
    ((null tree) nil)
    ((= number_nodes (+ 1 number_edges)) nil)
    ;(t(cons (car tree) (left_side (cddr tree) (+ 1 number_nodes) (+ (cadr tree) number_edges))))
    (t(cons (car tree) (cons (cadr tree)(left_side (cddr tree) (+ 1 number_nodes) (+ (cadr tree) number_edges)))))
  )
)

#|
right_side(l1l2..ln, nn, ne) = {
    [], l is empty
    lx..ln, nn = ne+1
    right_side(l3..ln, nn+1, ne+l2)
}
|#
(defun right_side(tree number_nodes number_edges)
  (cond
    ((null tree) nil)
    ((= number_nodes (+ 1 number_edges)) tree)
    (t(right_side (cddr tree) (+ 1 number_nodes) (+ (cadr tree) number_edges)))
  )
)

#|
solve(l1l2..ln) = {
    [], l empty
    solve(left_side(l3..ln 0 0)) U [l1] U solve(right_side(l3..ln 0 0))
}
|#
(defun solve(tree)
  (cond
    ((null tree) nil)
    (t(append (solve (left_side (cddr tree) 0 0)) (list (car tree)) (solve (right_side (cddr tree) 0 0))))
  )
  )
#|
            a
          /   \
        b       d
      /   \   /   \
    c     f  e     h
   /     /
  i     g
|#
(setf tree ' (a 2 b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0))
(setf tree2 '(a 2 b 2 d 0 e 1 h 0 c 2 f 1 i 0 g 0))
(print (solve tree2))

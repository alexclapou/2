;(a (b (c)) (d) (e (f))) and node 'b' will be replace with node 'g' 
;=> tree (a (g (c)) (d) (e (f)))
#|
replace_node(current_node, old_node, new_node) = {
new_node, if current_node = old_node
current_node, otherwise
}
|#


(defun replace_node(current_node old_node new_node)
  (cond
    ((eq current_node old_node) new_node)
    (t current_node)
    )
  )
#|
        a
     /     \
   b       d
 /       /    \
c       e      f
|#
(setf tree '(a (b (c)) (d) (e (f))))

#|
replace(l, old_node, new_node) = {
replace_node(new_node, l, new_node), if l is an atom
replace(l1, old_node, new_node) U replace(l2, old_node, new_node) U .. U replace(ln, old_node, new_node), l is a list [l1l2..ln]
}
|#

(defun replacee (tree old_node new_node)
(cond
((atom tree) (replace_node tree old_node new_node))
(t (mapcar #'(lambda (x) (replacee x old_node new_node)) tree))
  )
 )
(print (replacee tree 'b 'h))

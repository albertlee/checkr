;;;; checkr.lisp

(in-package #:checkr)

(defparameter *game* nil)
(defstruct hole
  stone)

(defparameter *board*
  '((-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1  -1 1)
    (-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1  1 1)
    (-1 -1 -1 -1 -1 -1 -1 -1 -1 -1  1  1 1)
    (-1 -1 -1 -1 -1 -1 -1 -1 -1  1  1  1 1)
    (-1 -1 -1 -1 1 1 1 1 1 1 1 1 1  1  1  1  1)
    (-1 -1 -1 -1 1 1 1 1 1 1 1 1 1  1  1  1)
    (-1 -1 -1 -1 1 1 1 1 1 1 1 1 1  1  1)
    (-1 -1 -1 -1 1 1 1 1 1 1 1 1 1  1)
    (-1 -1 -1 -1 1 1 1 1 1 1 1 1 1)
    (-1 -1 -1 1 1 1 1 1 1 1 1 1 1)
    (-1 -1  1 1 1 1 1 1 1 1 1 1 1) 
    (-1  1  1 1 1 1 1 1 1 1 1 1 1)
    ( 1 1  1  1 1 1 1 1 1 1 1 1 1 )
    (-1 -1  -1 -1 1 1 1 1)
    (-1 -1  -1 -1 1 1 1)
    (-1 -1  -1 -1 1 1)
    (-1 -1 -1 -1 1)
    ))

(defun print-board ()
  ""
  (loop for i from 0 to 16 do
       (progn
         (loop for i1 from 0 to i do
              (format t " "))
         (loop for j from 0 to 18 do
              (let ((v (nth j (nth i *board*))))
                (if (and v (> v 0))
                    (format t "O ")
                    (format t "  "))))
                  (format t "~%"))))

(defun main ()
  (format t "Start checkr..~%")
  (print-board))

(main)


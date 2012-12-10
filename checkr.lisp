;;;; checkr.lisp

(in-package #:checkr)

(defparameter *game* nil)
(defstruct hole
  stone)

(defparameter *board*
  '((nil nil nil nil nil nil nil nil nil nil nil nil 0)
    (nil nil nil nil nil nil nil nil nil nil nil  1 2)
    (nil nil nil nil nil nil nil nil nil nil  3 4 5)
    (nil nil nil nil nil nil nil nil nil  6  7 8 9)
    (nil nil nil nil * * * * * * * * * * * * *)
    (nil nil nil nil * * * * * * * * * * * *)
    (nil nil nil nil * * * * * * * * * * *)
    (nil nil nil nil * * * * * * * * * *)
    (nil nil nil nil * * * * * * * * *)
    (nil nil nil * * * * * * * * * *)
    (nil nil  * * * * * * * * * * *) 
    (nil  * * * * * * * * * * * *)
    ( * * * * * * * * * * * * * )
    (nil nil nil nil g h i j)
    (nil nil nil nil d e f)
    (nil nil nil nil b c)
    (nil nil nil nil a)
    ))

(defun print-board ()
  ""
  (loop for i from 0 to 16 do
       (progn
         (loop for i1 from 0 to  i do
              (format t " "))
         (loop for j from 0 to 16 do
              (let ((v (nth j (nth i *board*))))
                (if v
                    (if (equal v '*)
                        (format t ". ")
                        (format t "~D " v))
                    (format t "  "))))
                  (format t "~%"))))

(defun main ()
  (format t "Start checkr..~%")
  (print-board))



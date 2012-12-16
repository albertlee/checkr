;;;; checkr.lisp

(in-package #:checkr)

(defparameter *game* nil)
(defstruct hole
  stone)

(defmacro init-board ()
  `(list '(nil nil nil nil                                       0)
         '(nil nil nil nil                                      1 2)
         '(nil nil nil nil                                     3 4 5)
         '(nil nil nil nil                                    6 7 8 9)
         '(                                          * * * * * * * * * * * * *)
         '(nil                                        * * * * * * * * * * * *)
         '(nil nil                                     * * * * * * * * * * *)
         '(nil nil nil                                  * * * * * * * * * *)
         '(nil nil nil nil                               * * * * * * * * *)
         '(nil nil nil nil                              * * * * * * * * * *)
         '(nil nil nil nil                             * * * * * * * * * * *) 
         '(nil nil nil nil                            * * * * * * * * * * * *)
         '(nil nil nil nil                           * * * * * * * * * * * * *)
         '(nil nil nil nil nil nil nil nil nil                G H I J)
         '(nil nil nil nil nil nil nil nil nil nil             D E F)
         '(nil nil nil nil nil nil nil nil nil nil nil          B C)
         '(nil nil nil nil nil nil nil nil nil nil nil nil       A)))

(defvar *board* nil)

(defun reset-board ()
  (setq *board* (copy-tree (init-board))))
;; 棋盘中的位置
(defstruct pos
  row col)

;; TODO: 判断移动的合法性
(defun move-out (p)
  (let ((old-stone (nth (pos-col p) (nth (pos-row p) *board*))))
    (setf (nth (pos-col p) (nth (pos-row p) *board*)) '*)
    old-stone))
(defun move-in (p stone)
  (setf (nth (pos-col p) (nth (pos-row p) *board*)) stone))
(defun move (from-p to-p)
  (move-in to-p (move-out from-p)))

(defun adjs (p)
  "获得一个位置上的相邻6个位置的坐标"
  (let ((row (pos-row p))
        (col (pos-col p)))
    (list
     (make-pos :row (- row 1) :col (- col 1))
     (make-pos :row (- row 1) :col col)
     (make-pos :row row       :col (- col 1))
     (make-pos :row row       :col (+ col 1))
     (make-pos :row (+ row 1) :col col)
     (make-pos :row (+ row 1) :col (+ col 1)))))

(defun move-stone (p direct)
  "将p 位置上的棋子向direct方向移动 direct : 0 - 5"
  (move p (nth direct (adjs p))))

(defun jump-one-pos (start-p direct)
  "start-p 跳过direct方向的下一个位置"
  (let ((row (pos-row start-p))
        (col (pos-col start-p)))
    (cond ((= direct 0) (make-pos :row (- row 2) :col (- col 2)))
          ((= direct 1) (make-pos :row (- row 2) :col col))
          ((= direct 2) (make-pos :row row       :col (- col 2)))
          ((= direct 3) (make-pos :row row       :col (+ col 2)))
          ((= direct 4) (make-pos :row (+ row 2) :col col))
          ((= direct 5) (make-pos :row (+ row 2) :col (+ col 2))))))

(defun print-board ()
  "print board"
  (loop for i from 0 to 16 do
       (progn
         (loop for i1 from 0 to (- 16 i) do
              (format t " "))
         (loop for j from 0 to 16 do
              (let ((v (nth j (nth i *board*))))
                (if v
                    (if (equal v '*)
                        (format t ". ")
                        (format t "~D " v))
                    (format t "  "))))
                  (format t "~%")))
  (format t "~%"))

(defun main ()
  (format t "Start checkr..~%")
  (reset-board)
  (print-board)
  (move-stone (make-pos :row 3 :col 4) 5)
  (print-board))



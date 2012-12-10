;;;; checkr.asd

(asdf:defsystem #:checkr
  :serial t
  :description "Chinese Checkers Board Game"
  :author "Albert Lee <hanzhupeng@gmail.com>"
  :license "MIT"
  :components ((:file "package")
               (:file "checkr")))


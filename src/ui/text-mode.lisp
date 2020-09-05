(in-package :text-mode)





(defparameter *start-message* "
  ________________________________________________
 |                                                |
 |                   Studio FHS                   |
 |________________________________________________|

  Welcome to Studio FHS and software documentation~%")




(defun set-language ()
  (tagbody

   :start-message
     (format t "~@[ | ~20,A~]~@[~10,A~]~@[~10,A~]~% |~%"
	     "Select language:" "[1] RU" "[2] EN")

   :set-language
     (format t " | Number: ")
     (let ((in (read-from-string (read-line *standard-input*))))
       (case in
	 (1 (setf *language* 'ru))
	 (2 (setf *language* 'en))
	 (otherwise
	  (format t " | * ~A~%" *error-set-language-message*)
	  (go :set-language))))))




(defun print-help ()
  (case *language*

    (RU
     (format t "---------------------------------------------------------------------------~%")
     (format t "~@[ ~30,A~]~@[~30,A~]~%" "КОМАНДА:" "ОПИСАНИЕ:")
     (format t "---------------------------------------------------------------------------~%")

     (format t "~@[ ~30,A~]~@[~30,A~]~%~@[ ~30,A~]~@[~30,A~]~2%"

	     "<help>"            "Показать эту справку."
	     "      "            "Пример: \"[Studio FHS]: help\"")

     (format t "~@[ ~30,A~]~@[~30,A~]~%~@[ ~30,A~]~@[~30,A~]~2%"

	     "<language>"        "Сменить язык."
	     "          "        "Пример: \"[Studio FHS]: language\"")

     (format t "~@[ ~30,A~]~@[~30,A~]~%~@[ ~30,A~]~@[~30,A~]~2%"

	     "<quit>"            "Закрыть Studio FHS."
	     "      "            "Пример: \"[Studio FHS]: quit\"")

     (format t "---------------------------------------------------------------------------~%")
     (format t " ~A~% ~A~%"
	     "Поиск файлов и каталогов требует ввод полного пути."
	     "Пример: \"[Studio FHS]: /boot/grub/grub.cfg\"")

     (format t "---------------------------------------------------------------------------~%"))

    (EN
     (format t "---------------------------------------------------------------------------~%")
     (format t "~@[ ~30,A~]~@[~30,A~]~%" "COMMAND:" "DESCRIPTION:")
     (format t "---------------------------------------------------------------------------~%")

     (format t "~@[ ~30,A~]~@[~30,A~]~%~@[ ~30,A~]~@[~30,A~]~%"

	     "<help>"            "Show this help."
	     "      "            "Example: \"[Studio FHS]: help\"")

     (format t "~@[ ~30,A~]~@[~30,A~]~%~@[ ~30,A~]~@[~30,A~]~%"

	     "<language>"        "Change language."
	     "          "        "Example: \"[Studio FHS]: language\"")

     (format t "~@[ ~30,A~]~@[~30,A~]~%~@[ ~30,A~]~@[~30,A~]~2%"

	     "<quit>"            "Close Studio FHS."
	     "      "            "Example: \"[Studio FHS]: quit\"")

     (format t "---------------------------------------------------------------------------~%")
     (format t " ~A~% ~A~%"
	     "Search directories and files requires entering the full path."
	     "Example: \"[Studio FHS]: /boot/grub/grub.cfg\"")

     (format t "---------------------------------------------------------------------------~%"))))




(defun boot ()

  (format t "~A~%" *start-message*)
  (format t "~3%")

  (set-language)
  (format t "~3%")

  (print-help)
  (format t "~3%"))




(defun print-table (lst-1 lst-2 lst-3)
  (mapcan #'(lambda (a b c)
	      (format t " ~@[* ~25,A~]~@[* ~25,A~]~@[* ~25,A~]" a b c))
	  lst-1 lst-2 lst-3))




(defun column-compilation (path-object key-include)
  (let* ((column-1 nil)
	 (column-2 nil)
	 (column-3 nil)
	 (val-include (sort (getf path-object key-include) #'string<))
	 (len-column (ceiling (/ (length val-include) 3.0))))

    (cond ((= (length val-include) 1) (progn (setf column-1 val-include
						   column-2 '(nil)
						   column-3 '(nil))

					     (print-table column-1
							  column-2
							  column-3)))

	  ((setf column-1 (subseq val-include 0 len-column)
		 column-2 (subseq val-include len-column (* 2 len-column)))
	   (cond ((= (* 3 len-column) (length val-include))
		  (setf column-3 (subseq val-include (* 2 len-column) (* 3 len-column))))

		 ((if (= (- (* 3 len-column) (length val-include)) 2)
		      (setf column-3 (nconc (subseq val-include
						    (* 2 len-column)
						    (length val-include))
					    '(nil nil)))

		      (setf column-3 (nconc (subseq val-include
						    (* 2 len-column)
						    (length val-include))
					    '(nil))))))

	   (print-table column-1 column-2 column-3)))))




(defun print-include (include-list)
  (format t "~% DIRECTORIES: ~2%")
  (column-compilation include-list :directories)
  (format t "~2% FILES: ~2%")
  (column-compilation include-list :files))




(defun print-path-text (path stream)
  (format t "~%---------------------------------------------------------------------------~%")
  (format t " Result:~%")
  (format t "---------------------------------------------------------------------------~%")

  (format stream "~@[~A~A~A~A~A~A~]~%"

	  (format t "~% TYPE: ~A~%"               (path-type path))
	  (format t " PATH: ~A~%"                 (path-path path))
	  (format t " NAME: ~A~3%"                (path-name path))
	  (format t "*** DESCRIPTION ***~2%~A~3%" (path-description-ru path))
	  (format t "*** INCLUDE OBJECTS ***~%")
	  (print-include                          (path-include path)))

  (format t "~%---------------------------------------------------------------------------~%"))




(defmacro objects (&body body)
  `(list ,@body))

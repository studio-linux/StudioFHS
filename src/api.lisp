(in-package :api)





(declaim (symbol *ui-mode*
		 *language*)
	 (string *error-command-message*
		 *error-search-message*
		 *error-set-language-message*))

(defparameter *ui-mode*  'text-mode)
(defparameter *language* 'en)

(defparameter *error-command-message*       "Error input: command not found :(")
(defparameter *error-search-message*        "Error input: no such file or directory :(")
(defparameter *error-set-language-message*  "Error input: invalid number set :(")




(defun path-include-list-p (object)
  (and (consp object)
       (consp (nth 1 object))
       (consp (nth 3 object))
       (equal (nth 0 object) :directories)
       (equal (nth 2 object) :files)
       (every #'stringp (nth 1 object))
       (every #'stringp (nth 3 object))))


(deftype path-include-list ()
  `(satisfies path-include-list-p))




(defstruct (path (:constructor  add-path)
		 (:print-object print-path))

  (type            ""  :type string               :read-only true)
  (path            ""  :type string               :read-only true)
  (name            ""  :type string               :read-only true)
  (description-ru  ""  :type string               :read-only true)
  (description-en  ""  :type string               :read-only true)
  (include         ""  :type path-include-list    :read-only true))


(defun print-path (path stream)
  (cond ((equal *ui-mode* 'text-mode) (print-path-text path stream))))


;;; Рефакторинг всего кода
;;; Постройка модели в рабочем журнале проекта

(defmacro request-path (str)
  `(ignore-errors
    (let* ((var  (read-from-string (concatenate 'string "*" ,str "*")))
	   (path (eval var)))
      (if (path-p path)
	  (format t "~%~A~2%" path)
	  (cond ((equal *ui-mode* 'text-mode) (format t " * ~A~%" *error-search-message*)))))))




(defun main ()
  (tagbody

   :start
     (case *ui-mode*
       (text-mode    (boot))
       (ncurses-mode (print "Development me..."))
       (gui-mode     (print "Development me..."))
       (otherwise
	(format t "Error in argument: \"~A\"~%" *ui-mode*)
	(format t "Please, use only \"text-mode\", \"ncurses-mode\" or \"gui-mode\"")))

   :shell
     (format t " [Studio FHS]: ")
     (let* ((in-command (ignore-errors (read *standard-input*)))
	    (in-search (string in-command)))
       (case in-command
	 (help     (print-help))
	 (language (set-language))
	 (quit     (abort))
	 (otherwise (cond ((equal #\/ (char in-search 0)) (request-path in-search))
			  ((format t " * ~A~%" *error-command-message*)))))
       (go :shell))))

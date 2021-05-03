(in-package :boot)




(declaim (path */template*
	       */boot*
	       */boot/grub*
	       */boot/grub/fonts*
	       */boot/grub/fonts/unicode.pf2*
	       */boot/grub/fonts/unicode.pf2*
	       */boot/grub/i386-pc*
	       */boot/grub/grub.cfg*
	       */boot/grub/grub.cfg*
	       */boot/grub/grubenv*
	       */boot/System.map*
	       */boot/config*
	       */boot/vmlinuz*))


(defparameter */template*
  (add-path :type "dir"
	    :path "/template"
	    :name "template"

	    :description-ru "Шаблон экземпляра структуры \"path\" "
	    :description-en "Template of an instance of the \"path\" structure."

	    :include (objects :directories '("dir")
			      :files       '("file"))))


(defparameter */boot*
  (add-path :type "dir"
	    :path "/"
	    :name "boot"
	    :description-ru "test"
	    :description-en "test"
	    :include (objects :directories  '("grub")

			      :files '("System.map"
				       "config"
				       "vmlinuz"))))


(defparameter */boot/grub*
  (add-path :type "dir"
	    :path "/"
	    :name "boot"
	    :description-ru ""
	    :description-en ""))


(defparameter */boot/grub/fonts*
  (add-path :type "dir"
	    :path "/"
	    :name "boot"
	    :description-ru ""
	    :description-en ""))


(defparameter */boot/grub/fonts/unicode.pf2*
  (add-path :type "dir"
	    :path "/"
	    :name "boot"
	    :description-ru ""
	    :description-en ""))


(defparameter */boot/grub/i386-pc*
  (add-path :type "dir"
	    :path "/"
	    :name "boot"
	    :description-ru ""
	    :description-en ""))


(defparameter */boot/grub/grub.cfg*
  (add-path :type "dir"
	    :path "/"
	    :name "boot"
	    :description-ru ""
	    :description-en ""))


(defparameter */boot/grub/grubenv*
  (add-path :type "dir"
	    :path "/"
	    :name "boot"
	    :description-ru ""
	    :description-en ""))


(defparameter */boot/System.map*
  (add-path :type "file"
	    :path "/boot"
	    :name "System.map-X.XX.X-studio"
	    :description-ru ""
	    :description-en ""))


(defparameter */boot/config*
  (add-path :type "dir"
	    :path "/boot"
	    :name "config-X.XX.X-studio"
	    :description-ru ""
	    :description-en ""))


(defparameter */boot/vmlinuz*
  (add-path :type "dir"
	    :path "/boot"
	    :name "vmlinuz-X.XX.X-studio"
	    :description-ru ""
	    :description-en ""))

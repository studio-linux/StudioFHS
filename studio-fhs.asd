(in-package :asdf-user)


(defsystem #:studio-fhs
  :description "Software documentation and Filesystem Hierarchy Standard for the Studio Linux"

  :author "Alexander Marchenko <bourne-sci-hack@yandex.ru>"
  :maintainer "Samael Arts (SA Devel) <samael-arts.com>"

  :licence "GPLv3"
  :version "prototype-r1"

  :depends-on (:assistant)

  :serial t
  :components ((:file "package")
	       (:file "util")
	       (:file "api")
	       (:file "")

	       (:module "ui"   :components ((:file "text-mode")
					    (:file "pseudographic-mode")
					    (:file "gui-mode")))

	       (:module "data" :components ((:file "bin")
					    (:file "boot")
					    (:file "dev")
					    (:file "etc")
					    (:file "home")
					    (:file "lib")
					    (:file "lib32")
					    (:file "lib64")
					    (:file "media")
					    (:file "mnt")
					    (:file "opt")
					    (:file "proc")
					    (:file "root")
					    (:file "run")
					    (:file "sbin")
					    (:file "srv")
					    (:file "sys")
					    (:file "tmp")
					    (:file "usr")
					    (:file "var")))))

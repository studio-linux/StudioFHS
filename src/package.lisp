(in-package :cl-user)


;; Main
(defpackage :api
  (:use :cl
        :assistant))


(defpackage :util
  (:use :cl
        :assistant))


;; UI
(defpackage :text-mode
  (:use :cl
        :assistant))


(defpackage :pseudographic-mode
  (:use :cl
        :assistant))


(defpackage :gui-mode
  (:use :cl
        :assistant))


;; Data
(defpackage :bin
  (:use :cl
        :assistant))


(defpackage :boot
  (:use :cl
        :assistant))


(defpackage :dev
  (:use :cl
        :assistant))


(defpackage :etc
  (:use :cl
        :assistant))


(defpackage :home
  (:use :cl
        :assistant))


(defpackage :lib
  (:use :cl
        :assistant))


(defpackage :lib32
  (:use :cl
        :assistant))


(defpackage :lib64
  (:use :cl
        :assistant))


(defpackage :media
  (:use :cl
        :assistant))


(defpackage :mnt
  (:use :cl
        :assistant))


(defpackage :opt
  (:use :cl
        :assistant))


(defpackage :proc
  (:use :cl
        :assistant))


(defpackage :root
  (:use :cl
        :assistant))


(defpackage :run
  (:use :cl
        :assistant))


(defpackage :sbin
  (:use :cl
        :assistant))


(defpackage :srv
  (:use :cl
        :assistant))


(defpackage :sys
  (:use :cl
        :assistant))


(defpackage :tmp
  (:use :cl
        :assistant))


(defpackage :usr
  (:use :cl
        :assistant))


(defpackage :var
  (:use :cl
        :assistant))

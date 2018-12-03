(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq viper-mode t)
(require 'viper)
(setq ps-print-header nil)
(add-hook 'text-mode-hook 'turn-on-auto-fill '(lambda () (setq buffer-read-only nil)))
(add-hook 'text-mode-hook '(lambda () (line-number-mode 1) (setq buffer-read-only nil)))
(add-hook 'c-mode-hook '(lambda () (ruler-mode 1) (line-number-mode 1 ) (setq buffer-read-only nil)))
(add-hook 'pascal-mode-hook '(lambda () (line-number-mode 1) (setq buffer-read-only nil)))
(add-hook 'fortran-mode-hook '(lambda () (line-number-mode 1) (setq buffer-read-only nil)))
(add-hook 'awk-mode-hook '(lambda () (line-number-mode 1) (setq buffer-read-only nil)))
;(add-hook 'dired-mode-hook 'viper-mode)
;(add-hook 'fortran-mode-hook 'viper-mode)
;(add-hook 'awk-mode-hook 'viper-mode)
;(cond (window-system (require 'hilit19)))

;Set the `mh-progs' and `mh-lib', and `mh-lib-progs' variables to the

;(defvar mh-progs "/usr/bin" )
;(defvar mh-lib "/usr/etc" )
;(defvar mh-lib-progs "/usr/lib" )


(put 'eval-expression 'disabled nil)
;;(setq-default c-basic-offset 4)

;;(defun my-c-mode-hook()
;;   ; for emacs 19.32
;;	(cond (window-system (require 'hilit19)))
;;       (setq c-recognize-knr-p t)
;;       (setq c-basic-offset 4)
;;    (c-set-offset 'inclass +)
;;(describe-variable c-basic-offset)
;;)

;; Added for S7


(setq s7-c-style
      '((c-comment-only-line-offset . 4)
	(c-cleanup-list . (scope-operator
			   empty-defun-braces
			   defun-close-semi))
	(c-offsets-alist . ((arglist-close . c-lineup-arglist)
			    (inclass 4)
			    (case-label 4)
			    (defun-block-intro 4)
			    (knr-argdecl-intro 4)
			    (substatement 4)
			    (statement-block-intro 4)
			    (brace-list-intro 4)
			    (block-open 0)
			    (class-close 0)
			    (arglist-close 0)
			    (substatement-open . 0)))))

(defconst jillian-c-style
  '((c-comment-only-line-offset . 4)
    (c-cleanup-list . (scope-operator
		       empty-defun-braces
		       defun-close-semi))
    (c-offsets-alist . ((arglist-close . c-lineup-arglist)
			(inclass 4)
			(case-label 4)
			(defun-block-intro 4)
			(knr-argdecl-intro 4)
			(substatement 4)
			(statement-block-intro 4)
			(brace-list-intro 4)
			(block-open 0)
			(class-close 0)
			(arglist-close 0)
			(substatement-open . 0)))))

(defconst silabs-c-style
  '((c-comment-only-line-offset . 8)
    (c-cleanup-list . (scope-operator
		       empty-defun-braces
		       defun-close-semi))
    (c-offsets-alist . ((arglist-close . c-lineup-arglist)
			(inclass 8)
			(case-label 0)
			(defun-block-intro 8)
			(knr-argdecl-intro 8)
			(substatement 8)
			(statement-block-intro 8)
			(brace-list-intro 8)
			(block-open 0)
			(class-close 0)
			(arglist-close 0)
			(substatement-open . 0)))))
     
(add-hook 'c-mode-common-hook '(lambda () 
			  (setq buffer-read-only nil)
			  (c-add-style '"jillian-c-style" jillian-c-style t)
                          (setq tab-width 8)
			  ))

(load-file "~/elisp/xcscope.el/xcscope.el")
(require 'xcscope)
(cscope-setup)

(cond (window-system
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
))

(autoload 'cflow-mode "cflow-mode")
(setq auto-mode-alist (append auto-mode-alist
			      '(("\\.cflow$" . cflow-mode))))

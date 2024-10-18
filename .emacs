; For VcXSrv with WSL2
; https://skeptric.com/emacs-buffering/
(if (and (getenv "PATH") (string-match-p "Windows" (getenv "PATH")))
    (setq default-frame-alist
          (append default-frame-alist '((inhibit-double-buffering . t)))))

; mouse support for, e.g., iTerm2
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

(global-display-line-numbers-mode t)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'magit)
(require 'rustic)
(require 'rust-mode)
(require 'xcscope)
(cscope-setup)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(setq ps-print-header nil)
(add-hook 'text-mode-hook 'turn-on-auto-fill '(lambda () (setq buffer-read-only nil)))
(add-hook 'text-mode-hook '(lambda () (line-number-mode 1) (setq buffer-read-only nil)))
(add-hook 'c-mode-hook '(lambda () (ruler-mode 1) (line-number-mode 1 ) (setq buffer-read-only nil)))
(add-hook 'c++-mode-hook '(lambda () (ruler-mode 1) (line-number-mode 1 ) (setq buffer-read-only nil)))
(add-hook 'pascal-mode-hook '(lambda () (line-number-mode 1) (setq buffer-read-only nil)))
(add-hook 'fortran-mode-hook '(lambda () (line-number-mode 1) (setq buffer-read-only nil)))
(add-hook 'awk-mode-hook '(lambda () (line-number-mode 1) (setq buffer-read-only nil)))

(put 'eval-expression 'disabled nil)

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
				 (c-set-style "bsd")
				 (setq tab-width 8)
				 (setq c-tab-always-indent t)
				 ;(setq-default indent-tabs-mode t)
				 ;(setq c-indent-level 4)
				 ;(setq c-continued-statement-offset 4)
				 ;(setq c-brace-offset -4)
				 ;(setq c-argdecl-indent 0)
				 ;(setq c-label-offset -4)
			  )
	  )

(autoload 'cflow-mode "cflow-mode")
(setq auto-mode-alist (append auto-mode-alist
			      '(("\\.cflow$" . cflow-mode))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-enabled-themes '(modus-vivendi))
 '(package-selected-packages '(elpher lsp-mode json-mode powershell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

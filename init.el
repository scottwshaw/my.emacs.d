;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(push "/usr/local/bin" exec-path)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;;; recentf stuff, from http://www.joegrossberg.com/archives/000182.html
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(dolist (hook '(scheme-mode-hook
                lisp-mode-hook
                emacs-lisp-mode-hook
                clojure-mode-hook))
  (add-hook hook (lambda () ())))

;;; show-paren-mode permanently on
(show-paren-mode 1)

;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;(require 'puppet-mode)

;(add-to-list 'load-path "~/.emacs.d/feature-mode")
;; optional configurations
;; default language if .feature doesn't have "# language: fi"
;(setq feature-default-language "fi")
;; point to cucumber languages.yml or gherkin i18n.yml to use
;; exactly the same localization your cucumber uses
;(setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
;; and load feature-mode
;(require 'feature-mode)
;(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;;; F# mode
(setq load-path (cons "~/.emacs.d/fsharp" load-path))
(setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
(autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
(autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)

;;; Markdown mode stuff
(custom-set-variables

 ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(markdown-command "/usr/local/bin/markdown"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;; Wordcount mode
(setq load-path (cons "~/.emacs.d/word-count" load-path))
(require 'word-count)

;;; ess mode
;;; Wordcount mode
(setq load-path (cons "~/.emacs.d/ess-5.14/lisp" load-path))
(require 'ess-site)

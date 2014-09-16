;; run "M-x eval-buffer" to check if the config is correct

(put 'upcase-region 'disabled nil)

;; backup files go to ~/.emacs.backup
(setq backup-directory-alist `(("." . "~/.emacs.backup")))

;; c code indentation
(setq c-basic-offset 2)

;; markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

(global-set-key (kbd "C-c y") 'global-whitespace-mode)

(require 'whitespace)
(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)
(setq whitespace-line-column 80) ;; set line limit to 80

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; characters exceeding 80 is colored (lines-tail)
(setq whitespace-style '(face empty lines-tail))
(global-whitespace-mode t)

(c-set-offset 'innamespace 0)

;; for auto complete
(add-to-list 'load-path "~/.emacs.d")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
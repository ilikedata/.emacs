;(setq url-proxy-services '(("http" . "10.68.72.18:8888")))
(require 'package)
(require 'ess-site)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(dolist (package `(sml-mode magit smex color-theme find-file-in-project ecb fuzzy-match js3-mode js2-refactor expand-region flymake clojure-mode paredit fic-mode hide-comnt js-doc evil-nerd-commenter))
  (if (not (package-installed-p package))
      (package-install package)))

; Setting a larger fontsize
(set-face-attribute 'default nil :height 180)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;(set-frame-parameter nil 'fullscreen 'fullboth)


; Lets set the window size
(add-to-list 'default-frame-alist '(height . 59))
(add-to-list 'default-frame-alist '(width . 169))

(add-hook 'clojure-mode-hook 'paredit-mode)
(show-paren-mode 1)
(require 'paren)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#F00")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups


   ;;; adds symbols included by google closure to js2-additional-externs
(add-hook 'js2-post-parse-callbacks
	  (lambda ()
	    (let ((buf (buffer-string))
		  (index 0))
	      (while (string-match "\\(goog\\.require\\|goog\\.provide\\)('\\([^'.]*\\)" buf index)
		(setq index (+ 1 (match-end 0)))
		(add-to-list 'js2-additional-externs (match-string 2 buf))))))

(setq scss-compile-at-save nil)

(defun whack-whitespace (arg)
  "Delete all white space from point to the next word.  With prefix ARG
    delete across newlines as well.  The only danger in this is that you
    don't have to actually be at the end of a word to make it work.  It
    skips over to the next whitespace and then whacks it all to the next
    word."
  (interactive "P")
  (let ((regexp (if arg "[ \t\n]+" "[ \t]+")))
    (re-search-forward regexp nil t)
    (replace-match "" nil nil)))

(global-set-key (kbd "M-<down>") (lambda () (interactive) (whack-whitespace 1)))
(global-set-key (kbd "C-x C-;") 'comment-region)


(require 'color-theme)
(color-theme-initialize)
(color-theme-subtle-hacker)

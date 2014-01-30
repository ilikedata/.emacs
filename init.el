(setq url-proxy-services '(("http" . "10.68.72.18:8888")))
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

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
(set-face-foreground 'show-paren-match "#A00")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)


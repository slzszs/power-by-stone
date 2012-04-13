(setq auto-save-default nil)
(setq ido-mode t)
(setq cbasic-offset 4)

(setq tool-bar-mode nil)
(set-default-font "monospace-28")
(display-time)
(transient-mark-mode t)
(column-number-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)
(setq inhibit-startup-message t)
(global-linum-mode t)
(ido-mode t)
;;保留上一次打开的文件
(load "desktop")
(desktop-save-mode)
;;满屏启动（非最大化）
(setq initial-frame-alist '((top . 0) (left . 0) (width . 220) (height . 60)))
(setq scroll-step 1 scroll-margin 3 scroll-conservatively 10000)
;;kill this buffer
(global-set-key (kbd "s-o") 'find-file)
;;kill this buffer
(global-set-key (kbd "s--") 'kill-this-buffer)
;;search
(global-set-key (kbd "<f4>") 'isearch-repeat-backward)
(global-set-key (kbd "<f3>") 'isearch-repeat-forward)
(global-set-key (kbd "<M-f3>") 'isearch-forward-regexp)
(global-set-key (kbd "<s-f3>") 'query-replace)
(global-set-key (kbd "<s-f4>") 'query-replace-regexp)

;;word
(global-set-key (kbd "s-q") 'backward-word)
(global-set-key (kbd "s-e") 'forward-word)
(global-set-key (kbd "<s-backspace>") 'backward-kill-word)

;;page
(global-set-key (kbd "<M-up>") 'scroll-down)
(global-set-key (kbd "<M-down>") 'scroll-up)

;;跳转到某一行
(global-set-key [(control c) (control g)] 'goto-line)
(global-set-key (kbd "s-g") 'goto-line)

(defconst mystyle
  '(......)
  "mystyle" )
(c-add-style "mystyle" mystyle)
(defun myhook()
  (setq make-backup-files nil)
  (setq indent-tabs-mode nil)
  (setq tool-bar-mode nil)
  (linum-mode t)
  (c-set-style "mystyle"))
(add-hook 'php-mode-hook 'myhook)

(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;;加载扩展包路径
(add-to-list 'load-path "~/.emacs.d/")
;;把所有下下来的扩展包放这里
(add-to-list 'load-path "~/.emacs.d/php-mode")

;;-------------   php   -------------------
;;加载php-mode
(require 'php-mode)

(defun my-php-mode()
  ;;设置php程序的对齐风格
  (c-set-style "K&R")

  ;;自动模式，在此种模式下当你键入｛时，会自动根据你设置的对齐风格对齐
  ;;(c-toggle-auto-state)

  ;;此模式下，当按backspace时会删除最多的空格
  (c-toggle-hungry-state)

  ;;Tab 键的宽度设置为4
  (setq cbasic-offset 4)
  (setq indent-tabs-mode nil)

  ;;在菜单中加入当前buffer的函数索引
  (imenu-add-menubar-index)

  ;;在状态条上显示当前光标在哪个函数体内部
  (which-function-mode)
  )
(add-hook 'php-mode-hook 'my-php-mode)
(add-hook 'js-mode-hook 'my-php-mode)
(add-hook 'js-mode-hook 'myhook)

;;-----------------------------------

;;tramp
(setq tramp-default-method "scp")
(setq tramp-auto-save-directory "~/.emacs.d/tramp/lisp")
(setq auto-save-file-name-transforms
      '(("\\`/[^/]*:\\(.+/\\)*\\(.*\\)" "/tmp/\\2")))
(setq tramp-chunksize 328)
(require 'ange-ftp)
(require 'tramp)

(add-to-list 'load-path "~/.emacs.d/color")
(require 'color-theme)
(color-theme-initialize)
(color-theme-taylor)

;;tabbar
;;main plugin path  
(add-to-list 'load-path "~/.emacs.d/tabbar.el") 
(require 'tabbar)
(tabbar-mode t)
(global-set-key (kbd "<s-left>") 'tabbar-backward)
(global-set-key (kbd "<s-right>") 'tabbar-forward)
(global-set-key (kbd "<s-down>") 'tabbar-backward-group)
(global-set-key (kbd "<s-up>") 'tabbar-forward-group)
(global-set-key (kbd "s-j") 'tabbar-backward)
(global-set-key (kbd "s-l") 'tabbar-forward)
(global-set-key (kbd "s-i") 'tabbar-backward-group)
(global-set-key (kbd "s-k") 'tabbar-forward-group)

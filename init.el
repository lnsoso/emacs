;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Initial EL
;; Deng Wei <salala_mud@163.com>
;; repo: https://github.com/lnsoso/emacs
;; last modified : 2010-11-16 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; 插件配置;
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
(let* ((my-lisp-dir "~/.emacs.d/")
(default-directory my-lisp-dir))
(setq load-path (cons my-lisp-dir load-path))
(normal-top-level-add-subdirs-to-load-path)))


;;;普通设置
;;;关闭起动时闪屏
(setq inhibit-startup-message t) 
;;;关闭出错时的提示声
(setq visible-bell t)
;;;一打开就起用 text 模式
(setq default-major-mode 'text-mode) 
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;;;支持中键粘贴
(setq mouse-yank-at-point t) 
;;;支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t) 
;;;在标题栏显示buffer名称
(setq frame-title-format '("" buffer-file-name "@emacs : %b" )) 
;;;默认显示 80列就换行
(setq default-fill-column 78) 
(setq fill-column 78)
;;;显示多余空格
(setq show-trailing-whitespace t) 
;;;语法高亮
(global-font-lock-mode t) 
;;;打开图片显示功能
(auto-image-file-mode t) 
;;;以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p) 
;;;显示列号
(column-number-mode t) 
;;;显示括号匹配
(show-paren-mode t) 
;;;显示时间，格式如下
(display-time-mode 1) 
;;;去掉那个大大的工具栏
;(tool-bar-mode nil) 
;;;去掉滚动条
;(scroll-bar-mode nil) 
;;;光标靠近鼠标指针时，让鼠标指针自动让开
(mouse-avoidance-mode 'animate) 
;;;允许临时设置标记
(transient-mark-mode t) 
;;;Enable upcase-region
(put 'upcase-region 'disabled nil)
;;;Enable downcase-region
(put 'downcase-region 'disabled nil)

;;; Backup Configuration
(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("" . "~/.emacs.d/backups")))
(defvar autosave-dir
  "~/.emacs.d/backups/")
(make-directory autosave-dir t)

(global-set-key (kbd "C-j") 'goto-line)

;; UTF-8 settings
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
     
(setq default-process-coding-system
     '(chinese-gbk . chinese-gbk))
      (setq-default pathname-coding-system 'chinese-gbk)
      ;; font
      (set-frame-font "Courier New-16") ;; for Mac
     
(defun dwcustomtheme ()
  (interactive)
  (color-theme-install
   '(dwcustomtheme
      ((background-color . "#000000")
      (background-mode . light)
      (border-color . "#1a1a1a")
      (cursor-color . "#fce94f")
      (foreground-color . "#eeeeec")
      (mouse-color . "black"))
     (fringe ((t (:background "#1a1a1a"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
     (region ((t (:background "#0d4519"))))
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     (font-lock-comment-face ((t (:foreground "#888a85"))))
     (font-lock-function-name-face ((t (:foreground "#edd400"))))
     (font-lock-keyword-face ((t (:foreground "#729fcf"))))
     (font-lock-string-face ((t (:foreground "#ad7fa8"))))
     (font-lock-type-face ((t (:foreground"#8ae234"))))
     (font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'dwcustomtheme)

(add-to-list 'load-path "~/.emacs.d/plugins/color-theme/color-theme.el")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (dwcustomtheme)))

;;;PHP
(add-hook 'php-mode-user-hook 'turn-on-font-lock)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;auto complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

(defun ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/5
/usr/include/x86_64-linux-gnu/c++/5
/usr/include/c++/5/backward
/usr/lib/gcc/x86_64-linux-gnu/5/include" "/usr/local/include" "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed
/usr/include/x86_64-linux-gnu
/usr/include"
)
  )

(add-hook 'c++-mode-hook 'ac-c-header-init)
(add-hook 'c-mode-hook 'ac-c-header-init)


(global-set-key (kbd "M-p") 'ace-window)
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)


(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
;(setq tabbar-ruler-global-ruler t) ; if you want a global ruler
;(setq tabbar-ruler-popup-menu t) ; If you want a popup menu.
;(setq tabbar-ruler-popup-toolbar t) ; If you want a popup toolbar
;(setq tabbar-ruler-popup-scrollbar t) ; If you want to only show the
                                        ; scroll bar when your mouse is moving.
                                       ; scroll bar when your mouse is moving.
(require 'tabbar-ruler)

(global-set-key (kbd "M-[") 'tabbar-backward-group)
(global-set-key (kbd "M-]") 'tabbar-forward-group)
(global-unset-key (kbd "<M-left>"))
(global-unset-key (kbd "<M-right>"))
(global-set-key (kbd "<M-left>") 'tabbar-backward-tab)
(global-set-key (kbd "<M-right>") 'tabbar-forward-tab)


(defun nf-kill-this-buffer()
  (interactive)
  (kill-this-buffer)
    (delete-window))
(global-set-key (kbd "<f1>") 'nf-kill-this-buffer)

(require 'xcscope)
(global-set-key (kbd "s-z") 'cscope-pop-mark)
(global-set-key "\C-xs" 'cscope-find-this-symbol)
(global-set-key "\C-xc" 'cscope-find-functions-calling-this-function)
(global-set-key "\C-xt" 'cscope-find-this-text-string)
(global-set-key "\C-xd" 'cscope-find-called-functions)
(global-set-key "\C-xg" 'cscope-find-global-definition)
(global-set-key "\C-xf" 'cscope-find-this-file)
(global-set-key "\C-xe" 'cscope-find-egrep-pattern)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(autopair-global-mode t)
 '(cscope-close-window-after-select t)
 '(custom-safe-themes
   (quote
    ("f25c30c1de1994cc0660fa65c6703706f3dc509a342559e3b5b2102e50d83e4f" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "404a8e7f198ef3a5babdf122c7905abc61a8cd04eb2a1ce7d6faec5550b02a90" "bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "708df3cbb25425ccbf077a6e6f014dc3588faba968c90b74097d11177b711ad1" default)))
 '(ecb-layout-name "leftright2")
 '(ecb-options-version "2.40")
 '(ecb-tip-of-the-day nil)
 '(ecb-windows-width 0.15)
 '(gdb-many-windows nil)
 '(inhibit-startup-screen t)
 '(org-completion-use-ido t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(w3m-default-display-inline-images t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier 10 Pitch" :foundry "bitstream" :slant normal :weight bold :height 120 :width normal)))))


(customize-set-variable 'scroll-bar-mode 'right);设定光标为短线
(global-font-lock-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq frame-title-format;设置标题栏显示文件的完整路径名
      '("%S" (buffer-file-name "%f"
                               (dired-directory dired-directory "%b"))))

(setq default-fill-column 80);默认显示 80列就换行
(set-scroll-bar-mode nil)  ; 取消滚动栏
(setq mouse-yank-at-point t)    ; 不在鼠标点击的那个地方插入剪贴板内容
(setq kill-ring-max 200)    ; 设置粘贴缓冲条目数量
(setq user-full-name "nifan")
(setq user-mail-address "nfn.bak@gmail.com")    ; 设置有用的个人信息,这在很多地方有用。
(setq-default kill-whole-line t) ; 在行首 C-k 时，同时删除该行
;; (setq show-paren-mode t) ;打开括号匹配显示模式
(show-paren-mode 1) ;打开括号匹配显示模式
(setq show-paren-style 'parenthesis) ;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。
(setq mouse-avoidance-mode 'animate) ;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。

(require 'recentf)
(setq recentf-max-saved-items 100)
(recentf-mode 1)

(autopair-mode 1)
(evilnc-default-hotkeys)
(global-set-key (kbd "C-;") 'comment-indent)

(defun nf-point-to-register()
  "Save mark here"
  (interactive)
  (message "save mark here")
  (point-to-register 1)
  (list-matching-lines (current-word))
  (next-multiframe-window)
  )

(defun nf-register-to-point()
  "Back to mark saved"
  (interactive)
  (message "Jump back to mark")
  (register-to-point 1)
  )

(defun nf-find-defination()
  (interactive)
  (cscope-find-global-definition-no-prompting)
  (message "Back to Emacs mapping in cscope buffer")
  (evil-emacs-state))

 (defun nf-insert()
  (interactive)
  (point-to-register 4)
  (message "mark position in register i")
  (evil-insert-state))
 
 (defun nf-backto-i()
  (interactive)
  (register-to-point 4))


 ;(setq path-to-ctags "/usr/bin/ctags") ;; <- your ctags path here
  (defun create-tags (dir-name)
    "Create tags file."
    (interactive "DDirectory: ")
    (shell-command
     (format "ctags -e -R %s" (directory-file-name dir-name))))

(require 'highlight-symbol)

(define-key evil-normal-state-map "]" 'cscope-find-global-definition-no-prompting)
(define-key evil-normal-state-map "\r" 'nf-find-defination)
(define-key evil-normal-state-map "[" 'cscope-pop-mark)
(define-key evil-normal-state-map "\s" 'cscope-pop-mark)
(define-key evil-normal-state-map "za" 'hs-hide-all)
(define-key evil-normal-state-map "za" 'hs-hide-all)
(define-key evil-normal-state-map "zb" 'hs-hide-block)
(define-key evil-normal-state-map "zo" 'hs-show-block)
(define-key evil-normal-state-map "zs" 'hs-show-all)
(define-key evil-normal-state-map "zi" 'hs-hide-initial-comment-block)
(define-key evil-normal-state-map "wh" 'windmove-left)
(define-key evil-normal-state-map "wl" 'windmove-right)
(define-key evil-normal-state-map "wj" 'windmove-up)
(define-key evil-normal-state-map "wk" 'windmove-down)
(define-key evil-normal-state-map "." 'nf-point-to-register)
(define-key evil-normal-state-map "b" 'nf-register-to-point)
(define-key evil-normal-state-map "e" 'end-of-line)
(define-key evil-normal-state-map ";" 'qiang-comment-dwim-line)
(define-key evil-normal-state-map "f" 'isearch-forward)
(define-key evil-normal-state-map [left] 'tabbar-backward-tab)
(define-key evil-normal-state-map [right] 'tabbar-forward-tab)
(define-key evil-normal-state-map "i" 'nf-insert)
(define-key evil-normal-state-map "," 'nf-backto-i)
(define-key evil-normal-state-map "*" 'highlight-symbol)

(setq org-hide-leading-stars t) 
 (define-key global-map "\C-ca" 'org-agenda) 
 (setq org-log-done 'time)  
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(setq default-fill-column 80);默认显示 80列就换行

(color-theme-initialize)
(color-theme-high-contrast)
;; (load-theme 'zenburn t)
(add-hook 'term-mode-hook (lambda () (yas-minor-mode -1)))


(global-set-key [(meta x)] (lambda ()
			     (interactive)
			     (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))

(add-hook 'gdb-mode-hook '(lambda ()
			    (define-key c-mode-base-map [(f5)] 'gud-go)
			    (define-key c-mode-base-map [(f7)] 'gud-step)
			    (define-key c-mode-base-map [(f8)] 'gud-next)))


;; w3m
;load & init 
(autoload 'w3m "w3m" "interface for w3m on emacs" t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)

;settings
(setq w3m-use-cookies t)
(setq w3m-home-page "http://www.google.com")

(require 'mime-w3m) 
(setq w3m-default-display-inline-image t) 
(setq w3m-default-toggle-inline-images t)

(add-to-list 'load-path "~/.emacs.d/elpa/bing-dict-20160105.2102/bing-dict.el")
(require 'bing-dict)
(global-set-key (kbd "C-c d") 'bing-dict-brief)

(require 'auto-dictionary)
(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

;; (require 'chinese-yasdcv)
(add-hook 'after-init-hook 'global-company-mode)

(require 'company)
  ;; Enable company-ycm.
(add-to-list 'company-backends 'company-ycm)
(add-to-list 'company-begin-commands 'c-electric-colon)
(add-to-list 'company-begin-commands 'c-electric-lt-gt)


(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-ruby color-theme haml-mode yaml-mode)
  "A list of packages to ensure are installed at launch")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; select with shift
(cua-selection-mode t)

;; scrool
;; smart scrolling
(setq scroll-step 1; плавный скроллинг
scroll-conservatively 100000; не прыгать на середину страницы при скроллинге
scroll-margin 5; начинать промотку страницы за 5 сток до края
scroll-preserve-screen-position t); без этого не будет нормально работать страница вниз/вверх

;; buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; copy and paste
(custom-set-variables
'(interprogram-paste-function (quote x-cut-buffer-or-selection-value) t)
'(x-select-enable-clipboard t))

(windmove-default-keybindings 'meta)
(fset 'yes-or-no-p 'y-or-n-p)

;; blink error 
(setq ring-bell-function (lambda ()
   (call-process-shell-command "xset led 3; xset -led 3" nil 0 nil)))

(global-set-key [f9] 'bookmark-bmenu-list)
(global-set-key "\C-z" 'undo)

;; Rinary
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; YAML mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
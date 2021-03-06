;; eni-pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'auto-highlight-symbol-mode)

;; Disattiva autocompletamento yas e spazi nelle sessioni del terminale
(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)
                            (setq show-trailing-whitespace nil)))

;; Carico gli snippet per yas
(when (require 'yasnippet nil 'noerror)
  (progn
    (yas-load-directory "~/.emacs.d/snippets")
    (yas-load-directory "~/.live-packs/eni-pack/snippets")))

;; Imposta il saltatore C o solo per la finestra attuale (per evitare
;; problemi con DocView)
(setq ace-jump-mode-scope 'window)

;; Funzioni custom per scrollare "in remoto" le pagine di DocView
(defun my-scroll-down (arg)
  (interactive "P")
  (with-selected-window (other-window-for-scrolling)
    (if (eq 'doc-view-mode major-mode)
        (doc-view-scroll-down-or-previous-page)
      (scroll-down arg))))

(defun my-scroll-up (arg)
  (interactive "P")
  (with-selected-window (other-window-for-scrolling)
    (if (eq 'doc-view-mode major-mode)
        (doc-view-scroll-up-or-next-page)
      (scroll-up arg))))

;; Allegerisce DocView
(add-hook 'doc-view-mode-hook (lambda () (undo-tree-mode -1)))
(add-hook 'doc-view-mode-hook (lambda () (yas-minor-mode -1)))
(add-hook 'doc-view-mode-hook (lambda () (linum-mode -1)))

;; Mi sa che non funziona
(lambda () (doc-view-clear-cache))

;; Sottolineatore per TODO, !!!, etc
(add-hook 'prog-mode-hook (lambda () (fic-ext-mode 1)))

;; Provo a rimettere Bookmark+ sbuggato
;; FALLITO
(live-load-config-file "bookmark-plus-conf.el")

;; Define a function to send to nrepl (use <current_file_namespace>)

(defun nrepl-use-ns (ns)
  "Switch the namespace of the nREPL buffer to NS."
  (interactive (list (nrepl-current-ns)))
  (if ns
      (with-current-buffer (nrepl-current-repl-buffer)
        (nrepl-send-string
         (format "(use '%s)" ns) (nrepl-handler (current-buffer))))
    (message "Sorry, I don't know what the current namespace is.")))

;; four-clj 4clojure helper mode
(live-load-config-file "four-clj-conf.el")

;; display-time-mode in prog-mode
(add-hook 'prog-mode-hook (lambda ()
                            (setq display-time-24hr-format t)
                            (display-time-mode 1)))

;; sml-mode-line on
(add-hook 'prog-mode-hook (lambda ()
                            (sml-modeline-mode 1)))

;; clean-mode-line
;; http://blog.jr0cket.co.uk/2013/01/tweeking-emacs-modeline-for-clojure.html
(live-load-config-file "clean-mode-line-conf.el")

;; Set defaults for org-mode
(live-load-config-file "org-mode-conf.el")

;; Add another custom function to ask REPL (use 'clojure.repl)
(defun nrepl-use-repl (ns)
  "Switch the namespace of the nREPL buffer to NS."
  (interactive (list (nrepl-current-ns)))
  (if ns
      (with-current-buffer (nrepl-current-repl-buffer)
        (nrepl-send-string
         (format "(use 'clojure.repl)") (nrepl-handler (current-buffer))))
    (message "Sorry, I don't know what the current namespace is.")))

;; Loads solarized-dark theme and set the fucking cursor color to OliveDrab
(setq solarized-high-contrast-mode-line t)
(load-theme 'solarized-dark t)
(add-hook 'window-setup-hook '(lambda () (set-cursor-color "OliveDrab")))
(add-hook 'after-make-frame-functions '(lambda (f) (with-selected-frame
                                                       f
                                                     (set-cursor-color
                                                      "OliveDrab"))))

;; Sets more contrasted colors for mode-line
(set-face-attribute 'mode-line nil
                    :foreground "LightCyan3" :background "DodgerBlue4")

;; Python autocomplete e varie
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; *** DISABLED SETTINGS ***
;; Forces fill-prefix to ";; " in clojure-mode (override adaptative
;; prefix)
(quote (add-hook 'clojure-mode-hook '(lambda () (setq fill-prefix ";; "))))

;; Since DocView seems to have something wrong about pdf rendered cache
;; of already-viewed pdfs, this cleans the cache before killing emacs.
(quote (add-hook 'kill-emacs-hook '(lambda () (find-file "prova")
                                     (doc-view-minor-mode)
                                     (doc-view-clear-cache))))

;; align-cljlet from https://github.com/gstamp/align-cljlet
(live-load-config-file "align-cljlet-conf.el")

;; impaktor-move-end-line: move-end-line ignoring in-line comments
;; (binding to C-c C-x C-e in bindings.el)
(defun impaktor-move-end-of-line ()
  (interactive)
  (when (comment-search-forward (line-end-position) t)
    (goto-char (match-beginning 0))
    (skip-syntax-backward " " (line-beginning-position))))

;; Easy Spell Check with Flyspell: keybindings and stuff
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(global-set-key (kbd "C-S-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)

;; Disable zone thing
(setq live-disable-zone t)

;; Set default font
(set-default-font "Inconsolata-g-11")

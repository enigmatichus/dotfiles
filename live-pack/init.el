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
;; Disattiva autocompletamento yas nelle sessioni del terminale
(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)
                            (setq show-trailing-whitespace nil)))

(when (require 'yasnippet nil 'noerror)
  (progn
    (yas/load-directory "~/.emacs.d/snippets")
    (yas/load-directory "~/.live-packs/eni-pack/snippets")))
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

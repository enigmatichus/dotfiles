;; Place your bindings here.

;; For example:
;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)

(define-key global-map (kbd "C-c C-v") 'my-scroll-up)
(define-key global-map (kbd "C-c C-f") 'my-scroll-down)
(define-key global-map (kbd "C-c M-b") 'nrepl-use-ns)

;; windmove keys rebindings to C-x M-<up>,<down>,<left>,<right>
(define-key global-map (kbd "C-x M-<left>") 'windmove-left)
(define-key global-map (kbd "C-x M-<right>") 'windmove-right)
(define-key global-map (kbd "C-x M-<up>") 'windmove-up)
(define-key global-map (kbd "C-x M-<down>") 'windmove-down)

;; Solve conflict for run-jruby (was: C-c C-f)
(define-key global-map (kbd "C-c C-S-v") 'run-jruby)

;; org-mode capture
(define-key global-map (kbd "C-c c") 'org-capture)

;; binding for nrepl-use-repl
(define-key global-map (kbd "C-c M-v") 'nrepl-use-repl)

;; Place your bindings here.

;; For example:
;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)

(define-key global-map (kbd "C-c C-v") 'my-scroll-up)
(define-key global-map (kbd "C-c C-S-v") 'my-scroll-down)
(define-key global-map (kbd "C-c M-b") 'nrepl-use-ns)

;; windmove keys rebindings to C-x M-<up>,<down>,<left>,<right>
(define-key global-map (kbd "C-x M-<left>") 'windmove-left)
(define-key global-map (kbd "C-x M-<right>") 'windmove-right)
(define-key global-map (kbd "C-x M-<up>") 'windmove-up)
(define-key global-map (kbd "C-x M-<down>") 'windmove-down)

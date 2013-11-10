;; Use all live-packs except for colour-pack, which I want to override
(live-use-packs '(live/foundation-pack
                  live/clojure-pack
                  live/lang-pack
                  live/power-pack
                  live/git-pack
                  live/org-pack
                  live/bindings-pack))

;; Activate eni-pack
(live-append-packs '(~/.live-packs/eni-pack))

ciao

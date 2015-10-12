;; halting problem
;;
;; a. let's assume that (try try) halts.
;; then let's see what the try procedure body says:
;;
;; (if (halts? try try) (run-forever) 'halted)
;;
;; because (halts? try try) will be true (as hypothesis),
;; then (run-forever) will be run which lead to running forever.
;; Contradication.
;;
;; b. let's assume that (try try) runing forever.
;; then (halts? try try) will be false. so 'halted returned
;; which meanse (try try) halting. Contradication.
;;

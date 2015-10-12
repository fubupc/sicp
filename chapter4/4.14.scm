;; map has a special argument type: procedure. And according to apply-primitive, 
;; it will pass the procedure object(not procedure in underlying scheme) directly 
;; to underlying map which would cause error.
;;
;; then can we fix it? it seems not easy:
;; 1. It's easy to fix with primitive procedure as map()'s argument. but how about compound procedure?
;; compound procedure has no correspondance procedure in underlying scheme. so we need to go back to 
;; evaluate it in our implementing language using eval().
;;
;; 2. but eval() need an environment in which the compound procedure defined. but this environment 
;; was not passed to apply().
;; (but maybe we can fix this problem by passing env to apply() as well?)
;;

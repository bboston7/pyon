#lang typed/racket/base

(require racket/list
         "config.rkt")

(define SECONDS_IN_WEEK (* 60 60 24 7))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Private functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Rotates a list times times
|#
(: rotate ((Listof Any) Nonnegative-Integer -> (Listof Any)))
(define (rotate lst times)
  (let-values ([(tail head) (split-at lst (- (length lst) times))])
    (append head tail)))

#|
Zips two lists together into a list of pairs
|#
(: zip ((Listof Any) (Listof Any) -> (Listof (Pair Any Any))))
(define (zip lst1 lst2)
  (for/list ([i lst1]
             [j lst2])
    (cons i j)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Public functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
Get the weeks chore assignment
|#
(define (get-assignment)
  (let* ([week (floor (/ (- (current-seconds) DATE_S) SECONDS_IN_WEEK))]
         [rotations (modulo week (length PEOPLE))]
         [names (rotate PEOPLE rotations)])
    (zip CHORES names)))


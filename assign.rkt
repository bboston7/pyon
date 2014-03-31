#lang typed/racket/base

(require racket/list
         "config.rkt")

(define SECONDS_IN_WEEK (* 60 60 24 7))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Public functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (get-assignment)
  (let* ([week (floor (/ (- (current-seconds) DATE_S) SECONDS_IN_WEEK))]
         [rotations (modulo week (length PEOPLE))])
    null))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Private functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(: rotate ((Listof Any) Nonnegative-Integer -> (Listof Any)))
(define (rotate lst times)
  (let-values ([(tail head) (split-at lst (- (length lst) times))])
    (append head tail)))

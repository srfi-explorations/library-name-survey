(import (rnrs))

(define (writeln x) (write x) (newline))

(define (read-all)
  (let loop ((xs '()))
    (let ((x (read)))
      (if (eof-object? x) (reverse xs) (loop (cons x xs))))))

(define (alist-update alist key update default)
  (let loop ((tail alist) (new-alist '()))
    (if (null? tail) (cons (cons key (update default)) alist)
        (let ((entry (car tail)))
          (if (equal? key (car entry))
              (append (reverse new-alist)
                      (cons (cons (car entry) (update (cdr entry)))
                            (cdr tail)))
              (loop (cdr tail) (cons (car tail) new-alist)))))))

(define (colon-number sym)
  (let ((str (symbol->string sym)))
    (string->number (substring str 1 (string-length str)))))

(define (srfi<? a b)
  (< (colon-number (car a))
     (colon-number (car b))))

(let ((all-library-names (read-all)))
  (for-each
   writeln
   (list-sort
    srfi<?
    (fold-left
     (lambda (srfi-names library-name)
       (flush-output-port (current-output-port))
       (let ((srfi (list-ref library-name 1))
             (name (list-ref library-name 2)))
         (alist-update
          srfi-names
          srfi
          (lambda (names) (if (member name names) names (cons name names)))
          '())))
     '()
     all-library-names))))

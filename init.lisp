;; -*- mode:lisp -*-

(in-package :lem-user)

(define-command my/other-window-1 () ()
  (other-window -1))

(define-key *global-keymap* "C-_" 'undo)
(define-key *global-keymap* "M-_" 'redo)
(define-key *global-keymap* "C-o" 'lem.abbrev:abbrev)
(define-key *global-keymap* "M-o" 'other-window)
(define-key *global-keymap* "M-O" 'my/other-window-1)
(define-key *global-keymap* "C-c l l" 'lem-lisp-mode:start-lisp-repl)

(add-hook *find-file-hook*
          (lambda (buffer)
            (when (eq (buffer-major-mode buffer) 'lem-lisp-mode:lisp-mode)
              (change-buffer-mode buffer 'lem-paredit-mode:paredit-mode))))


(in-package :lem.completion-mode)
(define-key *completion-mode-keymap* "Tab" 'completion-select)

(in-package :lem-paredit-mode)
(define-key *paredit-mode-keymap* "ȣ" 'paredit-barf)
(define-key *paredit-mode-keymap* "Ȳ" 'paredit-slurp)
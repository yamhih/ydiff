;; ydiff - a language-aware tool for comparing programs
;; Copyright (C) 2011 Yin Wang (yinwang0@gmail.com)

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.



#lang racket

(require "structs.rkt")
(require "parse-js.rkt")
(require "sdiff.rkt")
(require "utils.rkt")





;-------------------------------------------------------------
;                         overrides
;-------------------------------------------------------------

(set-get-name
  (lambda (node)
    (let ([id-exp (match-tags node '(name identifier id))])
      (and id-exp (get-symbol (car (Node-elts id-exp)))))))


;; (same-def? (car (parse1 $statement "function f(x) {}"))
;;            (car (parse1 $statement "function f(x) {}")))


;; (different-def? (car (parse1 $statement "function f(x) {}"))
;;                 (car (parse1 $statement "function g(x) {}")))



;; command line interface
(let* ([args (current-command-line-arguments)]
       [file1 (vector-ref args 0)]
       [file2 (vector-ref args 1)]
       [s1 (read-file file1)]
       [s2 (read-file file2)]
       [node1 (parse-js s1)]
       [node2 (parse-js s2)])
  (diff node1 node2 file1 file2))

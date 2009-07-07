<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
<!ENTITY docbook.dsl PUBLIC "-//Norman Walsh//DOCUMENT DocBook Print Stylesheet//EN" CDATA DSSSL>
]>

<style-sheet>
<style-specification use="docbook">
<style-specification-body>

;; $Id: print.dsl,v 1.2 2006-11-07 08:53:59 blueflux Exp $
;;
;; This file is part of the Modular DocBook Stylesheet distribution.
;; See ../README or http://www.berkshire.net/~norm/dsssl/
;;
;; Example of a customization layer on top of the modular docbook style
;; sheet.  Definitions inserted in this file take precedence over
;; definitions in the 'use'd stylesheet(s).

(define %title-font-family%
 "Arial")
(define %body-font-family%
 "Arial")
(define %mono-font-family%
 "Arial")
(define %admon-font-family%
 "Arial")
(define %command-font-family%
 "Courier New")

(define %admon-graphics%
 #t)
(define %admon-graphics-path%
 "images/")

(define %page-width%
 6in)
(define %page-height%
 9in)

(define (first-page-inner-header gi) (empty-sosofo))
(define (first-page-center-header gi) (empty-sosofo))
(define (first-page-outer-header gi) (empty-sosofo))
(define (page-inner-header gi) (empty-sosofo))
(define (page-center-header gi)
  (cond
  ((equal? (normalize gi) (normalize "dedication")) (empty-sosofo))
  ((equal? (normalize gi) (normalize "lot")) (empty-sosofo))
  ((equal? (normalize gi) (normalize "part")) (empty-sosofo))
  ((equal? (normalize gi) (normalize "toc")) (empty-sosofo))
  (else ($title-header-footer$))))
(define (page-outer-header gi) (empty-sosofo))

(define (page-inner-footer gi) (empty-sosofo))
(define (page-center-footer gi) ($page-number-header-footer$))
(define (page-outer-footer gi) (empty-sosofo))
(define (first-page-inner-footer gi) (empty-sosofo))
(define (first-page-center-footer gi) ($page-number-header-footer$))
(define (first-page-outer-footer gi) (empty-sosofo))

(define %epigraph-start-indent%
 (* %text-width% 0.30))
(define %body-start-indent%
 0pi)
(define %left-margin%
 0.8in)
(define %right-margin%
 0.8in)

(element command
 (make sequence
 font-family-name: %mono-font-family%
 font-weight: 'bold
 ))

(element literallayout
 (make sequence
 font-family-name: %mono-font-family%
 ))

(element systemitem
 (make sequence
 font-family-name: %mono-font-family%
 font-weight: 'normal
 font-posture: 'italic
 ))

(element computeroutput
 (make sequence
 font-family-name: %mono-font-family%
 font-weight: 'bold
 font-posture: 'italic
 ))

</style-specification-body>
</style-specification>

<external-specification id="docbook" document="docbook.dsl">

</style-sheet>

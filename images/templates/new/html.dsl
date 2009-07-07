<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
<!ENTITY docbook.dsl PUBLIC "-//Norman Walsh//DOCUMENT DocBook HTML Stylesheet//EN" CDATA DSSSL>
]>

<style-sheet>
<style-specification use="docbook">
<style-specification-body>

;; $Id: html.dsl,v 1.1 2006-10-18 13:19:32 blueflux Exp $
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

(define %stylesheet% "table.css")

(define %admon-graphics%
 #t)
(define %admon-graphics-path%
 "images/")

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

(in-package #:effective-spec)

;;; "effective-spec" goes here. Hacks and glory await!

;; Variable *TERMINAL-IO*

;; Value Type:

;; a bidirectional stream.

;; Initial Value:

;; implementation-dependent, but it must be an open stream that is not a generalized synonym stream to an I/O customization variables but that might be a generalized synonym stream to the value of some I/O customization variable.

;;------------------------------------------------------------

Variable -

Value Type:

a form.

Initial Value:


;;------------------------------------------------------------

;; Variable /, //, ///

;; Value Type:

;; a proper list.

;; Initial Value:

;; implementation-dependent.

;;------------------------------------------------------------
Variable +, ++, +++

Value Type:

an object.

Initial Value:

implementation-dependent.

;;------------------------------------------------------------

 Variable *, **, ***

Value Type:

an object.

Initial Value:

implementation-dependent.

;;------------------------------------------------------------
;; Constant Variable SHORT-FLOAT-EPSILON, SHORT-FLOAT-NEGATIVE-EPSILON, SINGLE-FLOAT-EPSILON, SINGLE-FLOAT-NEGATIVE-EPSILON, DOUBLE-FLOAT-EPSILON, DOUBLE-FLOAT-NEGATIVE-EPSILON, LONG-FLOAT-EPSILON, LONG-FLOAT-NEGATIVE-EPSILON

;; Constant Value:

;; implementation-dependent.
;;------------------------------------------------------------
Variable *RANDOM-STATE*

Value Type:

a random state.

Initial Value:

implementation-dependent.
;;------------------------------------------------------------
Variable *PRINT-PRETTY*

Value Type:

a generalized boolean.

Initial Value:

implementation-dependent.
;;------------------------------------------------------------
Variable *PRINT-PPRINT-DISPATCH*

Value Type:

a pprint dispatch table.

Initial Value:

implementation-dependent, but the initial entries all use a special class of priorities that have the property that they are less than every priority that can be specified using set-pprint-dispatch, so that the initial contents of any entry can be overridden.
;;------------------------------------------------------------
Variable *PRINT-MISER-WIDTH*

Value Type:

a non-negative integer, or nil.

Initial Value:

implementation-dependent
;;------------------------------------------------------------
Variable *PRINT-CASE*

;; Although the choice of which characters to escape is specified by
;; *PRINT-CASE*, the choice of how to escape those characters
;; (i.e., whether single escapes or multiple escapes are used)
;; is implementation-dependent.
;;------------------------------------------------------------
Variable *PRINT-ARRAY*

Value Type:

a generalized boolean.

Initial Value:

implementation-dependent.
;;------------------------------------------------------------
Constant Variable PI

Value:

an implementation-dependent long float.


;;------------------------------------------------------------
Constant Variable MULTIPLE-VALUES-LIMIT

Constant Value:

An integer not smaller than 20, the exact magnitude of which is implementation-dependent.


;;------------------------------------------------------------
Constant Variable MOST-POSITIVE-FIXNUM, MOST-NEGATIVE-FIXNUM

Constant Value:

implementation-dependent.
;;------------------------------------------------------------
Constant Variable MOST-POSITIVE-SHORT-FLOAT, LEAST-POSITIVE-SHORT-FLOAT, LEAST-POSITIVE-NORMALIZED-SHORT-FLOAT, MOST-POSITIVE-DOUBLE-FLOAT, LEAST-POSITIVE-DOUBLE-FLOAT, LEAST-POSITIVE-NORMALIZED-DOUBLE-FLOAT, MOST-POSITIVE-LONG-FLOAT, LEAST-POSITIVE-LONG-FLOAT, LEAST-POSITIVE-NORMALIZED-LONG-FLOAT, MOST-POSITIVE-SINGLE-FLOAT, LEAST-POSITIVE-SINGLE-FLOAT, LEAST-POSITIVE-NORMALIZED-SINGLE-FLOAT, MOST-NEGATIVE-SHORT-FLOAT, LEAST-NEGATIVE-SHORT-FLOAT, LEAST-NEGATIVE-NORMALIZED-SHORT-FLOAT, MOST-NEGATIVE-SINGLE-FLOAT, LEAST-NEGATIVE-SINGLE-FLOAT, LEAST-NEGATIVE-NORMALIZED-SINGLE-FLOAT, MOST-NEGATIVE-DOUBLE-FLOAT, LEAST-NEGATIVE-DOUBLE-FLOAT, LEAST-NEGATIVE-NORMALIZED-DOUBLE-FLOAT, MOST-NEGATIVE-LONG-FLOAT, LEAST-NEGATIVE-LONG-FLOAT, LEAST-NEGATIVE-NORMALIZED-LONG-FLOAT

Constant Value:

implementation-dependent.


;;------------------------------------------------------------
Variable *MODULES*

Value Type:

a list of strings.

Initial Value:

implementation-dependent.
;;------------------------------------------------------------
Variable *MACROEXPAND-HOOK*

Value Type:

a designator for a function of three arguments: a macro function, a macro form, and an environment object.

Initial Value:

a designator for a function that is equivalent to the function funcall, but that might have additional implementation-dependent side-effects.
;;------------------------------------------------------------
Variable *LOAD-VERBOSE*

Value Type:

a generalized boolean.

Initial Value: implementation-dependent.
;;------------------------------------------------------------

 Variable *LOAD-PATHNAME*, *LOAD-TRUENAME*

 If a break loop is entered while load is ongoing, it is implementation-dependent whether these variables retain the values they had just prior to entering the break loop or whether they are bound to nil.


;;------------------------------------------------------------
Constant Variable LAMBDA-LIST-KEYWORDS

Constant Value:

a list, the elements of which are implementation-dependent, but which must contain at least the symbols &allow-other-keys, &aux, &body, &environment, &key, &optional, &rest, and &whole.
;;------------------------------------------------------------
 Constant Variable LAMBDA-PARAMETERS-LIMIT

Constant Value:

implementation-dependent, but not smaller than 50.
;;------------------------------------------------------------
Constant Variable INTERNAL-TIME-UNITS-PER-SECOND

Constant Value:

A positive integer, the magnitude of which is implementation-dependent.
;;------------------------------------------------------------
Variable *GENSYM-COUNTER*

Value Type:

a non-negative integer.

Initial Value:

implementation-dependent.
;;------------------------------------------------------------
Variable *FEATURES*

Value Type:

a proper list.

Initial Value:

implementation-dependent.

Most features have implementation-dependent meanings; The following meanings have been assigned to feature names:
;;------------------------------------------------------------
Variable *DEFAULT-PATHNAME-DEFAULTS*

Value Type:

a pathname object.

Initial Value:

An implementation-dependent pathname, typically in the working directory that was current when Common Lisp was started up.
;;------------------------------------------------------------
Variable *DEBUG-IO*, *ERROR-OUTPUT*, *QUERY-IO*, *STANDARD-INPUT*, *STANDARD-OUTPUT*, *TRACE-OUTPUT*

Value Type:

For *standard-input*: an input stream

For *error-output*, *standard-output*, and *trace-output*: an output stream.

For *debug-io*, *query-io*: a bidirectional stream.

Initial Value:

implementation-dependent, but it must be an open stream that is not a generalized synonym stream to an I/O customization variables but that might be a generalized synonym stream to the value of some I/O customization variable. The initial value might also be a generalized synonym stream to either the symbol *terminal-io* or to the stream that is its value.
;;------------------------------------------------------------
 Variable *COMPILE-PRINT*, *COMPILE-VERBOSE*

Value Type:

a generalized boolean.

Initial Value:

implementation-dependent.
;;------------------------------------------------------------
Variable *COMPILE-FILE-PATHNAME*, *COMPILE-FILE-TRUENAME*

Value Type:

The value of *compile-file-pathname* must always be a pathname or nil. The value of *compile-file-truename* must always be a physical pathname or nil.

Initial Value:

nil.

If a break loop is entered while compile-file is ongoing, it is implementation-dependent whether these variables retain the values they had just prior to entering the break loop or whether they are bound to nil.


;;------------------------------------------------------------
 Constant Variable CHAR-CODE-LIMIT

Constant Value:

A non-negative integer, the exact magnitude of which is implementation-dependent, but which is not less than 96 (the number of standard characters).
;;------------------------------------------------------------
Constant Variable CALL-ARGUMENTS-LIMIT

Constant Value:

An integer not smaller than 50 and at least as great as the value of lambda-parameters-limit, the exact magnitude of which is implementation-dependent.
;;------------------------------------------------------------
 Constant Variable BOOLE-1, BOOLE-2, BOOLE-AND, BOOLE-ANDC1, BOOLE-ANDC2, BOOLE-C1, BOOLE-C2, BOOLE-CLR, BOOLE-EQV, BOOLE-IOR, BOOLE-NAND, BOOLE-NOR, BOOLE-ORC1, BOOLE-ORC2, BOOLE-SET, BOOLE-XOR

Constant Value:

The identity and nature of the values of each of these variables is implementation-dependent, except that it must be distinct from each of the values of the others, and it must be a valid first argument to the function boole.
;;------------------------------------------------------------
Constant Variable ARRAY-TOTAL-SIZE-LIMIT

Constant Value:

A positive fixnum, the exact magnitude of which is implementation-dependent, but which is not less than 1024.
;;------------------------------------------------------------
 Constant Variable ARRAY-RANK-LIMIT

Constant Value:

A positive fixnum, the exact magnitude of which is implementation-dependent, but which is not less than 8.
;;------------------------------------------------------------
 Constant Variable ARRAY-DIMENSION-LIMIT

Constant Value:

A positive fixnum, the exact magnitude of which is implementation-dependent, but which is not less than 1024.
;;------------------------------------------------------------

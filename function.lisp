Function Y-OR-N-P, YES-OR-NO-P
y-or-n-p types out a message (if supplied), reads an answer in some implementation-dependent manner (intended to be short and simple, such as reading a single character such as Y or N). yes-or-no-p types out a message (if supplied), attracts the user's attention (for example, by ringing the terminal's bell), and reads an answer in some implementation-dependent manner (intended to be multiple
;;------------------------------------------------------------
 WARN
If no handler for the warning condition is found

If no handlers for the warning condition are found, or if all such handlers decline, then the condition is reported to error output by warn in an implementation-dependent format.
;;------------------------------------------------------------
Function VECTOR-PUSH, VECTOR-PUSH-EXTEND
extension---a positive integer. The default is implementation-dependent.
;;------------------------------------------------------------
Function USER-HOMEDIR-PATHNAME
Description:

user-homedir-pathname determines the pathname that corresponds to the user's home directory on host. If host is not supplied, its value is implementation-dependent. For a description of :unspecific, see Section 19.2.1 (Pathname Components).

The definition of home directory is implementation-dependent, but defined in Common Lisp to mean the directory where the user keeps personal files such as initialization files and mail.
;;------------------------------------------------------------
 Standard Generic Function UPDATE-INSTANCE-FOR-DIFFERENT-CLASS

Syntax:

update-instance-for-different-class previous current &rest initargs &key &allow-other-keys => implementation-dependent
;;------------------------------------------------------------
Function TRANSLATE-PATHNAME

Examples:

 ;; The results of the following five forms are all implementation-dependent.
 ;; The second item in particular is shown with multiple results just to
 ;; emphasize one of many particular variations which commonly occurs.
 (pathname-name (translate-pathname "foobar" "foo*" "*baz")) =>  "barbaz"
 (pathname-name (translate-pathname "foobar" "foo*" "*"))
=>  "foobar"
OR=>  "bar"
 (pathname-name (translate-pathname "foobar" "*"    "foo*")) =>  "foofoobar"
 (pathname-name (translate-pathname "bar"    "*"    "foo*")) =>  "foobar"
 (pathname-name (translate-pathname "foobar" "foo*" "baz*")) =>  "bazbar"

 (defun translate-logical-pathname-1 (pathname rules)
   (let ((rule (assoc pathname rules :test #'pathname-match-p)))
     (unless rule (error "No translation rule for ~A" pathname))
     (translate-pathname pathname (first rule) (second rule))))
 (translate-logical-pathname-1 "FOO:CODE;BASIC.LISP"
                       '(("FOO:DOCUMENTATION;" "MY-UNIX:/doc/foo/")
                         ("FOO:CODE;"          "MY-UNIX:/lib/foo/")
                         ("FOO:PATCHES;*;"     "MY-UNIX:/lib/foo/patch/*/")))
=>  #P"MY-UNIX:/lib/foo/basic.l"

;;;This example assumes one particular set of wildcard conventions
;;;Not all file systems will run this example exactly as written
 (defun rename-files (from to)
   (dolist (file (directory from))
     (rename-file file (translate-pathname file from to))))
 (rename-files "/usr/me/*.lisp" "/dev/her/*.l")
   ;Renames /usr/me/init.lisp to /dev/her/init.l
 (rename-files "/usr/me/pcl*/*" "/sys/pcl/*/")
   ;Renames /usr/me/pcl-5-may/low.lisp to /sys/pcl/pcl-5-may/low.lisp
   ;In some file systems the result might be /sys/pcl/5-may/low.lisp
 (rename-files "/usr/me/pcl*/*" "/sys/library/*/")
   ;Renames /usr/me/pcl-5-may/low.lisp to /sys/library/pcl-5-may/low.lisp
   ;In some file systems the result might be /sys/library/5-may/low.lisp
 (rename-files "/usr/me/foo.bar" "/usr/me2/")
   ;Renames /usr/me/foo.bar to /usr/me2/foo.bar
 (rename-files "/usr/joe/*-recipes.text" "/usr/jim/cookbook/joe's-*-rec.text")
   ;Renames /usr/joe/lamb-recipes.text to /usr/jim/cookbook/joe's-lamb-rec.text
   ;Renames /usr/joe/pork-recipes.text to /usr/jim/cookbook/joe's-pork-rec.text
   ;Renames /usr/joe/veg-recipes.text to /usr/jim/cookbook/joe's-veg-rec.text
;;------------------------------------------------------------
 Function TRUENAME
 Examples:

;; An example involving version numbers.  Note that the precise nature of
;; the truename is implementation-dependent while the file is still open.
 (with-open-file (stream ">vistor>test.text.newest")
   (values (pathname stream)
           (truename stream)))
=>  #P"S:>vistor>test.text.newest", #P"S:>vistor>test.text.1"
OR=>  #P"S:>vistor>test.text.newest", #P"S:>vistor>test.text.newest"
OR=>  #P"S:>vistor>test.text.newest", #P"S:>vistor>_temp_._temp_.1"

;; In this case, the file is closed when the truename is tried, so the
;; truename information is reliable.
 (with-open-file (stream ">vistor>test.text.newest")
   (close stream)
   (values (pathname stream)
           (truename stream)))
=>  #P"S:>vistor>test.text.newest", #P"S:>vistor>test.text.1"

;; An example involving TOP-20's implementation-dependent concept
;; of logical devices -- in this case, "DOC:" is shorthand for
;; "PS:<DOCUMENTATION>" ...
 (with-open-file (stream "CMUC::DOC:DUMPER.HLP")
   (values (pathname stream)
           (truename stream)))
=>  #P"CMUC::DOC:DUMPER.HLP", #P"CMUC::PS:<DOCUMENTATION>DUMPER.HLP.13"
;;------------------------------------------------------------
 Accessor SYMBOL-FUNCTION
Accessor SYMBOL-FUNCTION

Syntax:

symbol-function symbol => contents

(setf (symbol-function symbol) new-contents)

Arguments and Values:

symbol---a symbol.

contents--- If the symbol is globally defined as a macro or a special operator, an object of implementation-dependent nature and identity is returned. If the symbol is not globally defined as either a macro or a special operator, and if the symbol is fbound, a function object is returned.
;;------------------------------------------------------------
Function SXHASH

The manner in which the hash code is computed is implementation-dependent, but subject to certain constraints:
;;------------------------------------------------------------
Function SUBTYPEP

 (subtypep '(satisfies dummy) nil) =>  false, implementation-dependent
;;------------------------------------------------------------
Function SUBST, SUBST-IF, SUBST-IF-NOT, NSUBST, NSUBST-IF, NSUBST-IF-NOT
 (setq tree1 '(1 (1 2) (1 2 3) (1 2 3 4))) =>  (1 (1 2) (1 2 3) (1 2 3 4))
 (subst "two" 2 tree1) =>  (1 (1 "two") (1 "two" 3) (1 "two" 3 4))
 (subst "five" 5 tree1) =>  (1 (1 2) (1 2 3) (1 2 3 4))
 (eq tree1 (subst "five" 5 tree1)) =>  implementation-dependent

;;------------------------------------------------------------
Function SQRT, ISQRT
If number is a positive rational, it is implementation-dependent whether root is a rational or a float. If number is a negative rational, it is implementation-dependent whether root is a complex rational or a complex float.
;;------------------------------------------------------------
Function SIGNUM
If number is a float, the result is a float. If number is a rational, the result is a rational. If number is a complex float, the result is a complex float. If number is a complex rational, the result is a complex, but it is implementation-dependent whether that result is a complex rational or a complex float.
;;------------------------------------------------------------
Function ROOM


Description:

room prints, to standard output, information about the state of internal storage and its management. This might include descriptions of the amount of memory in use and the degree of memory compaction, possibly broken down by internal data type if that is appropriate. The nature and format of the printed information is implementation-dependent. The intent is to provide information that a programmer might use to tune a program for a particular implementation.
;;------------------------------------------------------------
Function REMOVE, REMOVE-IF, REMOVE-IF-NOT, DELETE, DELETE-IF, DELETE-IF-NOT
Examples:

 (remove 4 '(1 3 4 5 9)) =>  (1 3 5 9)
 (remove 4 '(1 2 4 1 3 4 5)) =>  (1 2 1 3 5)
 (remove 4 '(1 2 4 1 3 4 5) :count 1) =>  (1 2 1 3 4 5)
 (remove 4 '(1 2 4 1 3 4 5) :count 1 :from-end t) =>  (1 2 4 1 3 5)
 (remove 3 '(1 2 4 1 3 4 5) :test #'>) =>  (4 3 4 5)
 (setq lst '(list of four elements)) =>  (LIST OF FOUR ELEMENTS)
 (setq lst2 (copy-seq lst)) =>  (LIST OF FOUR ELEMENTS)
 (setq lst3 (delete 'four lst)) =>  (LIST OF ELEMENTS)
 (equal lst lst2) =>  false
 (remove-if #'oddp '(1 2 4 1 3 4 5)) =>  (2 4 4)
 (remove-if #'evenp '(1 2 4 1 3 4 5) :count 1 :from-end t)
=>  (1 2 4 1 3 5)
 (remove-if-not #'evenp '(1 2 3 4 5 6 7 8 9) :count 2 :from-end t)
=>  (1 2 3 4 5 6 8)
 (setq tester (list 1 2 4 1 3 4 5)) =>  (1 2 4 1 3 4 5)
 (delete 4 tester) =>  (1 2 1 3 5)
 (setq tester (list 1 2 4 1 3 4 5)) =>  (1 2 4 1 3 4 5)
 (delete 4 tester :count 1) =>  (1 2 1 3 4 5)
 (setq tester (list 1 2 4 1 3 4 5)) =>  (1 2 4 1 3 4 5)
 (delete 4 tester :count 1 :from-end t) =>  (1 2 4 1 3 5)
 (setq tester (list 1 2 4 1 3 4 5)) =>  (1 2 4 1 3 4 5)
 (delete 3 tester :test #'>) =>  (4 3 4 5)
 (setq tester (list 1 2 4 1 3 4 5)) =>  (1 2 4 1 3 4 5)
 (delete-if #'oddp tester) =>  (2 4 4)
 (setq tester (list 1 2 4 1 3 4 5)) =>  (1 2 4 1 3 4 5)
 (delete-if #'evenp tester :count 1 :from-end t) =>  (1 2 4 1 3 5)
 (setq tester (list 1 2 3 4 5 6)) =>  (1 2 3 4 5 6)
 (delete-if #'evenp tester) =>  (1 3 5)
 tester =>  implementation-dependent
;;------------------------------------------------------------
Function REVERSE, NREVERSE
Examples:

 (setq str "abc") =>  "abc"
 (reverse str) =>  "cba"
 str =>  "abc"
 (setq str (copy-seq str)) =>  "abc"
 (nreverse str) =>  "cba"
 str =>  implementation-dependent
 (setq l (list 1 2 3)) =>  (1 2 3)
 (nreverse l) =>  (3 2 1)
 l =>  implementation-dependent
;;------------------------------------------------------------
Function REMPROP
Notes:

Numbers and characters are not recommended for use as indicators in portable code since remprop tests with eq rather than eql, and consequently the effect of using such indicators is implementation-dependent. Of course, if you've gotten as far as needing to remove such a property, you don't have much choice---the time to have been thinking about this was when you used setf of get to establish the property.
;;------------------------------------------------------------
Function RATIONAL, RATIONALIZE


Examples:

 (rational 0) =>  0
 (rationalize -11/100) =>  -11/100
 (rational .1) =>  13421773/134217728 ;implementation-dependent
 (rationalize .1) =>  1/10

;;------------------------------------------------------------
 Function PROVIDE, REQUIRE

Syntax:

provide module-name => implementation-dependent

require module-name &optional pathname-list => implementation-dependent

Description:

provide adds the module-name to the list held by *modules*, if such a name is not already present.

require tests for the presence of the module-name in the list held by *modules*. If it is present, require immediately returns. Otherwise, an attempt is made to load an appropriate set of files as follows: The pathname-list argument, if non-nil, specifies a list of pathnames to be loaded in order, from left to right. If the pathname-list is nil, an implementation-dependent mechanism will be invoked in an attempt to load the module named module-name; if no such module can be loaded, an error of type error is signaled.

Both functions use string= to test for the presence of a module-name.

Examples:

;;; This illustrates a nonportable use of REQUIRE, because it
;;; depends on the implementation-dependent file-loading mechanism.

(require "CALCULUS")

;;; This use of REQUIRE is nonportable because of the literal
;;; physical pathname.

(require "CALCULUS" "/usr/lib/lisp/calculus")

;;; One form of portable usage involves supplying a logical pathname,
;;; with appropriate translations defined elsewhere.

(require "CALCULUS" "lib:calculus")

;;; Another form of portable usage involves using a variable or
;;; table lookup function to determine the pathname, which again
;;; must be initialized elsewhere.

(require "CALCULUS" *calculus-module-pathname*)

;;------------------------------------------------------------
Function PROCLAIM
Syntax:

proclaim declaration-specifier => implementation-dependent
;;------------------------------------------------------------
Standard Generic Function PRINT-OBJECT

Each implementation is required to provide a method on the class standard-object and on the class structure-object. In addition, each implementation must provide methods on enough other classes so as to ensure that there is always an applicable method. Implementations are free to add methods for other classes. Users may write methods for print-object for their own classes if they do not wish to inherit an implementation-dependent method.

*print-level*

The printer takes care of *print-level* automatically, provided that each method handles exactly one level of structure and calls write (or an equivalent function) recursively if there are more structural levels. The printer's decision of whether an object has components (and therefore should not be printed when the printing depth is not less than *print-level*) is implementation-dependent. In some implementations its print-object method is not called; in others the method is called, and the determination that the object has components is based on what it tries to write to the stream.

 In general, the printer and the print-object methods should not rebind the print control variables as they operate recursively through the structure, but this is implementation-dependent.
;;------------------------------------------------------------
Function PPRINT-FILL, PPRINT-LINEAR, PPRINT-TABULAR
at-sign-p---a generalized boolean. The default is implementation-dependent.


;;------------------------------------------------------------
Function PACKAGE-SHADOWING-SYMBOLS
Notes:

Whether the list of symbols is fresh is implementation-dependent.
;;------------------------------------------------------------
Function OPEN
:external-format

    This option selects an external file format for the file: The only standardized value for this option is :default, although implementations are permitted to define additional external file formats and implementation-dependent values returned by stream-external-format can also be used by conforming programs.
;;------------------------------------------------------------
Local Function NEXT-METHOD-P
Whether or not next-method-p is fbound in the global environment is implementation-dependent; however, the restrictions on redefinition and shadowing of next-method-p are the same as for symbols in the COMMON-LISP package which are fbound in the global environment. The consequences of attempting to use next-method-p outside of a method-defining form are undefined.
;;------------------------------------------------------------
Function NAMESTRING, FILE-NAMESTRING, DIRECTORY-NAMESTRING, HOST-NAMESTRING, ENOUGH-NAMESTRING
Description:

These functions convert pathname into a namestring. The name represented by pathname is returned as a namestring in an implementation-dependent canonical form.
;;------------------------------------------------------------
Function MAKE-SYMBOL
 It is implementation-dependent whether the string that becomes the new-symbol's name is the given name or a copy of it. Once a string has been given as the name argument to make-symbol, the consequences are undefined if a subsequent attempt is made to alter that string.

Examples:

 (setq temp-string "temp") =>  "temp"
 (setq temp-symbol (make-symbol temp-string)) =>  #:|temp|
 (symbol-name temp-symbol) =>  "temp"
 (eq (symbol-name temp-symbol) temp-string) =>  implementation-dependent
 (find-symbol "temp") =>  NIL, NIL
 (eq (make-symbol temp-string) (make-symbol temp-string)) =>  false


;;------------------------------------------------------------
Function MAKE-STRING
initial-element---a character. The default is implementation-dependent.
;;------------------------------------------------------------
Function MAKE-SEQUENCE
initial-element---an object. The default is implementation-dependent.
;;------------------------------------------------------------
Function MAKE-PACKAGE
;;------------------------------------------------------------
Standard Generic Function MAKE-LOAD-FORM#

It is implementation-dependent whether load calls eval on the forms or does some other operation that has an equivalent effect. For example, the forms might be translated into different but equivalent forms and then evaluated, they might be compiled and the resulting functions called by load, or they might be interpreted by a special-purpose function different from eval. All that is required is that the effect be equivalent to evaluating the forms.
;;------------------------------------------------------------
Function MAKE-HASH-TABLE
size---a non-negative integer. The default is implementation-dependent.

rehash-size---a real of type (or (integer 1 *) (float (1.0) *)). The default is implementation-dependent.

rehash-threshold---a real of type (real 0 1). The default is implementation-dependent. #

The values of rehash-size and rehash-threshold do not constrain the implementation to use any particular method for computing when and by how much the size of hash-table should be enlarged. Such decisions are implementation-dependent, and these values only hints from the programmer to the implementation, and the implementation is permitted to ignore them.
;;------------------------------------------------------------
Function MAKE-ARRAY

If adjustable is non-nil, the array is expressly adjustable (and so actually adjustable); otherwise, the array is not expressly adjustable (and it is implementation-dependent whether the array is actually adjustable).
# If make-array is called with adjustable, fill-pointer, and displaced-to each nil, then the result is a simple array. If make-array is called with one or more of adjustable, fill-pointer, or displaced-to being true, whether the resulting array is a simple array is implementation-dependent.
;;------------------------------------------------------------
Function METHOD-COMBINATION-ERROR
method-combination-error format-control &rest args => implementation-dependent

Whether method-combination-error returns to its caller or exits via throw is implementation-dependent.
;;------------------------------------------------------------
Function LOAD

The manner in which a source file is distinguished from a compiled file is implementation-dependent. If the file specification is not complete and both a source file and a compiled file exist which might match, then which of those files load selects is implementation-dependent.

The external-format specifies the external file format to be used when opening the file (see the function open), except that when the file named by filespec is a compiled file, the external-format is ignored. compile-file and load cooperate in an implementation-dependent way to assure the preservation of the similarity of characters referred to in the source file at the time the source file was processed by the file compiler under a given external file format, regardless of the value of external-format at the time the compiled file is loaded.
;;------------------------------------------------------------
Function INTERSECTION, NINTERSECTION
Examples:

 (setq list1 (list 1 1 2 3 4 a b c "A" "B" "C" "d")
       list2 (list 1 4 5 b c d "a" "B" "c" "D"))
  =>  (1 4 5 B C D "a" "B" "c" "D")
 (intersection list1 list2) =>  (C B 4 1 1)
 (intersection list1 list2 :test 'equal) =>  ("B" C B 4 1 1)
 (intersection list1 list2 :test #'equalp) =>  ("d" "C" "B" "A" C B 4 1 1)
 (nintersection list1 list2) =>  (1 1 4 B C)
 list1 =>  implementation-dependent ;e.g.,  (1 1 4 B C)
 list2 =>  implementation-dependent ;e.g.,  (1 4 5 B C D "a" "B" "c" "D")
 (setq list1 (copy-list '((1 . 2) (2 . 3) (3 . 4) (4 . 5))))
=>  ((1 . 2) (2 . 3) (3 . 4) (4 . 5))
 (setq list2 (copy-list '((1 . 3) (2 . 4) (3 . 6) (4 . 8))))
=>  ((1 . 3) (2 . 4) (3 . 6) (4 . 8))
 (nintersection list1 list2 :key #'cdr) =>  ((2 . 3) (3 . 4))
 list1 =>  implementation-dependent ;e.g.,  ((1 . 2) (2 . 3) (3 . 4))
 list2 =>  implementation-dependent ;e.g.,  ((1 . 3) (2 . 4) (3 . 6) (4 . 8))
;;------------------------------------------------------------
Function INVALID-METHOD-ERROR
Syntax:

invalid-method-error method format-control &rest args => implementation-dependent
 Whether invalid-method-error returns to its caller or exits via throw is implementation-dependent.
;;------------------------------------------------------------
 Function INTERN



Description:

intern enters a symbol named string into package. If a symbol whose name is the same as string is already accessible in package, it is returned. If no such symbol is accessible in package, a new symbol with the given name is created and entered into package as an internal symbol, or as an external symbol if the package is the KEYWORD package; package becomes the home package of the created symbol.

The first value returned by intern, symbol, is the symbol that was found or created. The meaning of the secondary value, status, is as follows:

:internal

    The symbol was found and is present in package as an internal symbol.

:external

    The symbol was found and is present as an external symbol.

:inherited

    The symbol was found and is inherited via use-package (which implies that the symbol is internal).

nil

    No pre-existing symbol was found, so one was created.

    It is implementation-dependent whether the string that becomes the new symbol's name is the given string or a copy of it. Once a string has been given as the string argument to intern in this situation where a new symbol is created, the consequences are undefined if a subsequent attempt is made to alter that string.
;;------------------------------------------------------------
Function INSPECT
Description:

inspect is an interactive version of describe. The nature of the interaction is implementation-dependent, but the purpose of inspect is to make it easy to wander through a data structure, examining and modifying parts of it.
;;------------------------------------------------------------
Function HASH-TABLE-TEST
hash-table-test hash-table => test

Arguments and Values:

hash-table---a hash table.

test---a function designator. For the four standardized hash table test functions (see make-hash-table), the test value returned is always a symbol. If an implementation permits additional tests, it is implementation-dependent whether such tests are returned as function objects or function names.
;;------------------------------------------------------------
Function HASH-TABLE-REHASH-SIZE
Notes:

If the hash table was created with an integer rehash size, the result is an integer, indicating that the rate of growth of the hash-table when rehashed is intended to be additive; otherwise, the result is a float, indicating that the rate of growth of the hash-table when rehashed is intended to be multiplicative. However, this value is only advice to the implementation; the actual amount by which the hash-table will grow upon rehash is implementation-dependent.
;;------------------------------------------------------------
Accessor GET
Notes:

 (get x y) ==  (getf (symbol-plist x) y)

Numbers and characters are not recommended for use as indicators in portable code since get tests with eq rather than eql, and consequently the effect of using such indicators is implementation-dependent.
;;------------------------------------------------------------
Function FINISH-OUTPUT, FORCE-OUTPUT, CLEAR-OUTPUT

If any of these operations does not make sense for output-stream, then it does nothing. The precise actions of these functions are implementation-dependent.


;;------------------------------------------------------------
 Function FIND-ALL-SYMBOLS

Description:

find-all-symbols searches every registered package for symbols that have a name that is the same (under string=) as string. A list of all such symbols is returned. Whether or how the list is ordered is implementation-dependent.


;;------------------------------------------------------------
Function EQUAL
Pathnames

    Two pathnames are equal if and only if all the corresponding components (host, device, and so on) are equivalent. Whether or not uppercase and lowercase letters are considered equivalent in strings appearing in components is implementation-dependent. pathnames that are equal should be functionally equivalent.
;;------------------------------------------------------------
Function ED#
Syntax:

ed &optional x => implementation-dependent

Implementation-dependent additional conditions might be signaled as well.
;;------------------------------------------------------------
Function DRIBBLE
Syntax:

dribble &optional pathname => implementation-dependent
;;------------------------------------------------------------
Function DISASSEMBLE


The function disassemble is a debugging aid that composes symbolic instructions or expressions in some implementation-dependent language which represent the code used to produce the function which is or is named by the argument fn. The result is displayed to standard output in an implementation-dependent format.
;;------------------------------------------------------------
Function DESCRIBE

For example, describe of a symbol might show the symbol's value, its definition, and each of its properties. describe of a float might show the number's internal representation in a way that is useful for tracking down round-off errors. In all cases, however, the nature and format of the output of describe is implementation-dependent.
;;------------------------------------------------------------
Standard Generic Function DESCRIBE-OBJECT

Syntax:

describe-object object stream => implementation-dependent
;;------------------------------------------------------------
Function DELETE-PACKAGE
#After this operation completes, the home package of any symbol whose home package had previously been package is implementation-dependent. Except for this, symbols accessible in package are not modified in any other way; symbols whose home package is not package remain unchanged.
;;------------------------------------------------------------
Function DELETE-FILE
 It is implementation-dependent whether an attempt to delete a nonexistent file is considered to be successful.
;;------------------------------------------------------------
Function DECODE-UNIVERSAL-TIME


Affected By:

Implementation-dependent mechanisms for calculating when or if daylight savings time is in effect for any given session.
;;------------------------------------------------------------
Function DECODE-FLOAT, SCALE-FLOAT, FLOAT-RADIX, FLOAT-SIGN, FLOAT-DIGITS, FLOAT-PRECISION, INTEGER-DECODE-FLOAT

Examples:

 ;; Note that since the purpose of this functionality is to expose
 ;; details of the implementation, all of these examples are necessarily
 ;; very implementation-dependent.  Results may vary widely.
 ;; Values shown here are chosen consistently from one particular implementation.
 (decode-float .5) =>  0.5, 0, 1.0
 (decode-float 1.0) =>  0.5, 1, 1.0
 (scale-float 1.0 1) =>  2.0
 (scale-float 10.01 -2) =>  2.5025
 (scale-float 23.0 0) =>  23.0
 (float-radix 1.0) =>  2
 (float-sign 5.0) =>  1.0
 (float-sign -5.0) =>  -1.0
 (float-sign 0.0) =>  1.0
 (float-sign 1.0 0.0) =>  0.0
 (float-sign 1.0 -10.0) =>  10.0
 (float-sign -1.0 10.0) =>  -10.0
 (float-digits 1.0) =>  24
 (float-precision 1.0) =>  24
 (float-precision least-positive-single-float) =>  1
 (integer-decode-float 1.0) =>  8388608, -23, 1


;;------------------------------------------------------------
Function CONSTANTP
Examples:

 (constantp 1) =>  true
 (constantp 'temp) =>  false
 (constantp ''temp)) =>  true
 (defconstant this-is-a-constant 'never-changing) =>  THIS-IS-A-CONSTANT
 (constantp 'this-is-a-constant) =>  true
 (constantp "temp") =>  true
 (setq a 6) =>  6
 (constantp a) =>  true
 (constantp '(sin pi)) =>  implementation-dependent
 (constantp '(car '(x))) =>  implementation-dependent
 (constantp '(eql x x)) =>  implementation-dependent
 (constantp '(typep x 'nil)) =>  implementation-dependent
 (constantp '(typep x 't)) =>  implementation-dependent
 (constantp '(values this-is-a-constant)) =>  implementation-dependent
 (constantp '(values 'x 'y)) =>  implementation-dependent
 (constantp '(let ((a '(a b c))) (+ (length a) 6))) =>  implementation-dependent

;;------------------------------------------------------------
Function COMPILE-FILE
Description:

compile-file transforms the contents of the file specified by input-file into implementation-dependent binary data which are placed in the file specified by output-file.

The file to which input-file refers should be a source file. output-file can be used to specify an output pathname; the actual pathname of the compiled file to which compiled code will be output is computed as if by calling compile-file-pathname.

If input-file or output-file is a logical pathname, it is translated into a physical pathname as if by calling translate-logical-pathname.

If verbose is true, compile-file prints a message in the form of a comment (i.e., with a leading semicolon) to standard output indicating what file is being compiled and other useful information. If verbose is false, compile-file does not print this information.

If print is true, information about top level forms in the file being compiled is printed to standard output. Exactly what is printed is implementation-dependent, but nevertheless some information is printed. If print is nil, no information is printed.
;;------------------------------------------------------------
Function COMPILE

 compile is permitted, but not required, to establish a handler for conditions of type error. For example, the handler might issue a warning and restart compilation from some implementation-dependent point in order to let the compilation proceed without manual intervention.

The secondary value, warnings-p, is false if no conditions of type error or warning were detected by the compiler, and true otherwise.

The tertiary value, failure-p, is false if no conditions of type error or warning (other than style-warning) were detected by the compiler, and true otherwise.

Examples:

 (defun foo () "bar") =>  FOO
 (compiled-function-p #'foo) =>  implementation-dependent
 (compile 'foo) =>  FOO
 (compiled-function-p #'foo) =>  true
 (setf (symbol-function 'foo)
;;------------------------------------------------------------
Function CLOSE
Syntax:

close stream &key abort => result

Arguments and Values:

stream---a stream (either open or closed).

abort---a generalized boolean. The default is false.

result---t if the stream was open at the time it was received as an argument, or implementation-dependent otherwise.

Description:

close closes stream. Closing a stream means that it may no longer be used in input or output operations. The act of closing a file stream ends the association between the stream and its associated file; the transaction with the file system is terminated, and input/output may no longer be performed on the stream.

If abort is true, an attempt is made to clean up any side effects of having created stream. If stream performs output to a file that was created when the stream was created, the file is deleted and any previously existing file is not superseded.

It is permissible to close an already closed stream, but in that case the result is implementation-dependent.
;;------------------------------------------------------------
Function CHAR=, CHAR/=, CHAR<, CHAR>, CHAR<=, CHAR>=, CHAR-EQUAL, CHAR-NOT-EQUAL, CHAR-LESSP, CHAR-GREATERP, CHAR-NOT-GREATERP, CHAR-NOT-LESSP

 (char> #\z #\A) =>  implementation-dependent
 (char> #\Z #\a) =>  implementation-dependent
;;------------------------------------------------------------
 Function CHAR-NAME

 All non-graphic characters are required to have names unless they have some implementation-defined attribute which is not null. Whether or not other characters have names is implementation-dependent.
;;------------------------------------------------------------
Function CHAR-INT
Description:

Returns a non-negative integer encoding the character object. The manner in which the integer is computed is implementation-dependent. In contrast to sxhash, the result is not guaranteed to be independent of the particular Lisp image.
;;------------------------------------------------------------
Local Function CALL-NEXT-METHOD
 Whether or not call-next-method is fbound in the global environment is implementation-dependent; however, the restrictions on redefinition and shadowing of call-next-method are the same as for symbols in the COMMON-LISP package which are fbound in the global environment. The consequences of attempting to use call-next-method outside of a method-defining form are undefined.

Examples: None.
;;------------------------------------------------------------
 Function BYTE, BYTE-SIZE, BYTE-POSITION



byte returns a byte specifier that indicates a byte of width size and whose bits have weights 2^position + size - 1 through 2^position, and whose representation is implementation-dependent.
;;------------------------------------------------------------
Function BREAK
Arguments and Values:

format-control---a format control. The default is implementation-dependent.

format-arguments---format arguments for the format-control.
;;------------------------------------------------------------
Function BOOLE
Programmers who would prefer to use numeric indices rather than bit-wise logical operation specifiers can get an equivalent effect by a technique such as the following:

;; The order of the values in this `table' are such that
;; (logand (boole (elt boole-n-vector n) #b0101 #b0011) #b1111) => n
 (defconstant boole-n-vector
    (vector boole-clr   boole-and  boole-andc1 boole-2
            boole-andc2 boole-1    boole-xor   boole-ior
            boole-nor   boole-eqv  boole-c1    boole-orc1
            boole-c2    boole-orc2 boole-nand  boole-set))
=>  BOOLE-N-VECTOR
 (proclaim '(inline boole-n))
;;------------------------------------------------------------
Accessor AREF
 (aref (setq alpha (make-array 4)) 3) =>  implementation-dependent
 (setf (aref alpha 3) 'sirens) =>  SIRENS
 (aref alpha 3) =>  SIRENS
 (aref (setq beta (make-array '(2 4)
;;------------------------------------------------------------
Function ARRAY-HAS-FILL-POINTER-P
Examples:

 (array-has-fill-pointer-p (make-array 4)) =>  implementation-dependent
 (array-has-fill-pointer-p (make-array '(2 3))) =>  false
 (array-has-fill-pointer-p
;;------------------------------------------------------------
  Function ARRAY-ELEMENT-TYPE
  Examples:

 (array-element-type (make-array 4)) =>  T
 (array-element-type (make-array 12 :element-type '(unsigned-byte 8)))
=>  implementation-dependent
 (array-element-type (make-array 12 :element-type '(unsigned-byte 5)))
=>  implementation-dependent
;;------------------------------------------------------------
Function ARRAY-DISPLACEMENT
If array-displacement is called on an array for which a non-nil object was provided as the :displaced-to argument to make-array or adjust-array, it must return that object as its first value. It is implementation-dependent whether array-displacement returns a non-nil primary value for any other array.
;;------------------------------------------------------------
Function APPLY


Examples:

 (setq f '+) =>  +
 (apply f '(1 2)) =>  3
 (setq f #'-) =>  #<FUNCTION ->
 (apply f '(1 2)) =>  -1
 (apply #'max 3 5 '(2 7 3)) =>  7
 (apply 'cons '((+ 2 3) 4)) =>  ((+ 2 3) . 4)
 (apply #'+ '()) =>  0

 (defparameter *some-list* '(a b c))
 (defun strange-test (&rest x) (eq x *some-list*))
 (apply #'strange-test *some-list*) =>  implementation-dependent
;;------------------------------------------------------------
 Function ALPHA-CHAR-P

Examples:

 (alpha-char-p #\a) =>  true
 (alpha-char-p #\5) =>  false
 (alpha-char-p #\Newline) =>  false
 ;; This next example presupposes an implementation
 ;; in which #\<ALPHA> is a defined character.
 (alpha-char-p #\<ALPHA>) =>  implementation-dependent


;;------------------------------------------------------------
 Function ADJUSTABLE-ARRAY-P

 Examples:

 (adjustable-array-p
   (make-array 5
               :element-type 'character
               :adjustable t
               :fill-pointer 3)) =>  true
 (adjustable-array-p (make-array 4)) =>  implementation-dependent

Affected By: None.
;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

;;------------------------------------------------------------

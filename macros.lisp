Macro WITH-COMPILATION-UNIT

Any implementation-dependent extensions can only be provided as the result of an explicit programmer request by use of an implementation-dependent keyword. Implementations are forbidden from attaching additional meaning to a use of this macro which involves either no keywords or just the keyword :override.
;;------------------------------------------------------------
 Macro TRACE, UNTRACE

Syntax:

trace function-name* => trace-result

untrace function-name* => untrace-result

Arguments and Values:

function-name---a function name.

trace-result---implementation-dependent, unless no function-names are supplied, in which case trace-result is a list of function names.

untrace-result---implementation-dependent.
;;------------------------------------------------------------
Macro RESTART-BIND

:report-function

    Value is evaluated in the current lexical environment and should return a function of one argument, a stream, which prints on the stream a summary of the action that this restart takes. This function is called whenever the restart is reported (printed while *print-escape* is nil). If no :report-function option is provided, the manner in which the restart is reported is implementation-dependent.
;;------------------------------------------------------------
Macro PUSHNEW

 It is implementation-dependent whether or not pushnew actually executes the storing form for its place in the situation where the item is already a member of the list held by place.
;;------------------------------------------------------------
Macro PRINT-UNREADABLE-OBJECT

;; Note that in this example, the precise form of the output ;; is implementation-dependent.


 (defmethod print-object ((obj airplane) stream)
   (print-unreadable-object (obj stream :type t :identity t)
     (princ (tail-number obj) stream)))

 (prin1-to-string my-airplane)
=>  "#<Airplane NW0773 36000123135>"
OR=>  "#<FAA:AIRPLANE NW0773 17>"

;;------------------------------------------------------------
Local Macro PPRINT-POP

 Whether or not pprint-pop is fbound in the global environment is implementation-dependent; however, the restrictions on redefinition and shadowing of pprint-pop are the same as for symbols in the COMMON-LISP package which are fbound in the global environment. The consequences of attempting to use pprint-pop outside of pprint-logical-block are undefined.
;;------------------------------------------------------------
Local Macro PPRINT-EXIT-IF-LIST-EXHAUSTED

Whether or not pprint-exit-if-list-exhausted is fbound in the global environment is implementation-dependent; however, the restrictions on redefinition and shadowing of pprint-exit-if-list-exhausted are the same as for symbols in the COMMON-LISP package which are fbound in the global environment. The consequences of attempting to use pprint-exit-if-list-exhausted outside of pprint-logical-block are undefined.
;;------------------------------------------------------------
Local Macro LOOP-FINISH

 Whether or not loop-finish is fbound in the global environment is implementation-dependent; however, the restrictions on redefinition and shadowing of loop-finish are the same as for symbols in the COMMON-LISP package which are fbound in the global environment. The consequences of attempting to use loop-finish outside of loop are undefined.
;;------------------------------------------------------------
 Macro DOTIMES


 It is implementation-dependent whether dotimes establishes a new binding of var on each iteration or whether it establishes a binding for var once at the beginning and then assigns it on any subsequent iterations.
;;------------------------------------------------------------
Macro DOLIST

It is implementation-dependent whether dolist establishes a new binding of var on each iteration or whether it establishes a binding for var once at the beginning and then assigns it on any subsequent iterations.
;;------------------------------------------------------------
Macro DEFSTRUCT

The available slot-options are:

:type type

    This specifies that the contents of the slot is always of type type. This is entirely analogous to the declaration of a variable or function; it effectively declares the result type of the reader function. It is implementation-dependent whether the type is checked when initializing a slot or when assigning to it. Type is not evaluated; it must be a valid type specifier.

:read-only x

    When x is true, this specifies that this slot cannot be altered; it will always contain the value supplied at construction time. setf will not accept the reader function for this slot. If x is false, this slot-option has no effect. X is not evaluated.

When this option is false or unsupplied, it is implementation-dependent whether the ability to write the slot is implemented by a setf function or a setf expander.

Specifying (:print-function printer-name) is approximately equivalent to specifying:

 (defmethod print-object ((object structure-name) stream)
   (funcall (function printer-name) object stream <<current-print-depth>>))

where the <<current-print-depth>> represents the printer's belief of how deep it is currently printing. It is implementation-dependent whether <<current-print-depth>> is always 0 and *print-level*, if non-nil, is re-bound to successively smaller values as printing descends recursively, or whether current-print-depth varies in value as printing descends recursively and *print-level* remains constant during the same traversal.

The mechanism by which defstruct arranges for slot accessors to be usable with setf is implementation-dependent; for example, it may use setf functions, setf expanders, or some other implementation-dependent mechanism known to that implementation's code for setf.
;;------------------------------------------------------------
Macro DEFPACKAGE

:use

The arguments to :use set the packages that the package named by package-name will inherit from. If :use is not supplied, it defaults to the same implementation-dependent value as the :use argument to make-package.

Frequently additional implementation-dependent options take the form of a keyword standing by itself as an abbreviation for a list (keyword T); this syntax should be properly reported as an unrecognized option in implementations that do not support it.
;;------------------------------------------------------------
Macro DEFINE-CONDITION

If a slot name/slot form pair is supplied, the slot form is a form that can be evaluated by make-condition to produce a default value when an explicit value is not provided. If no slot form is supplied, the contents of the slot is initialized in an implementation-dependent way.
;;------------------------------------------------------------

Macro DEFINE-SYMBOL-MACRO

Globally establishes an expansion function for the symbol macro named by symbol. The only guaranteed property of an expansion function for a symbol macro is that when it is applied to the form and the environment it returns the correct expansion. (In particular, it is implementation-dependent whether the expansion is conceptually stored in the expansion function, the environment, or both.)
;;------------------------------------------------------------
Macro DECLAIM

Syntax:

declaim declaration-specifier* => implementation-dependent
;;------------------------------------------------------------
 Local Macro CALL-METHOD, MAKE-METHOD
Description:

The macro call-method is used in method combination. It hides the implementation-dependent details of how methods are called. The macro call-method has lexical scope and can only be used within an effective method form.

Whether or not call-method is fbound in the global environment is implementation-dependent; however, the restrictions on redefinition and shadowing of call-method are the same as for symbols in the COMMON-LISP package which are fbound in the global environment. The consequences of attempting to use call-method outside of an effective method form are undefined.
;;------------------------------------------------------------

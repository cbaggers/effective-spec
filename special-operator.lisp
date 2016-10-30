Special Operator SYMBOL-MACROLET

 symbol-macrolet provides a mechanism for affecting the macro expansion environment for symbols.

symbol-macrolet lexically establishes expansion functions for each of the symbol macros named by symbols. The only guaranteed property of an expansion function for a symbol macro is that when it is applied to the form and the environment it returns the correct expansion. (In particular, it is implementation-dependent whether the expansion is conceptually stored in the expansion function, the environment, or both.)
;;------------------------------------------------------------
Special Operator LOAD-TIME-VALUE

If a load-time-value expression is processed by compile-file, the compiler performs its normal semantic processing (such as macro expansion and translation into machine code) on form, but arranges for the execution of form to occur at load time in a null lexical environment, with the result of this evaluation then being treated as a literal object at run time. It is guaranteed that the evaluation of form will take place only once when the file is loaded, but the order of evaluation with respect to the evaluation of top level forms in the file is implementation-dependent.

If the same list (load-time-value form) is evaluated or compiled more than once, it is implementation-dependent whether form is evaluated only once or is evaluated more than once. This can happen both when an expression being evaluated or compiled shares substructure, and when the same form is processed by eval or compile multiple times. Since a load-time-value expression can be referenced in more than one place and can be evaluated multiple times by eval, it is implementation-dependent whether each execution returns a fresh object or returns the same object as some other execution. Users must use caution when destructively modifying the resulting object.
;;------------------------------------------------------------

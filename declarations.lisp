Declaration TYPE

Syntax:

Notes:

(typespec var*) is an abbreviation for (type typespec var*).

A type declaration for the arguments to a function does not necessarily imply anything about the type of the result. The following function is not permitted to be compiled using implementation-dependent fixnum-only arithmetic:

 (defun f (x y) (declare (fixnum x y)) (+ x y))

To see why, consider (f most-positive-fixnum 1). Common Lisp defines that F must return a bignum here, rather than signal an error or produce a mathematically incorrect result. If you have special knowledge such ``fixnum overflow'' cases will not come up, you can declare the result value to be in the fixnum range, enabling some compilers to use more efficient arithmetic:

 (defun f (x y)
   (declare (fixnum x y))
   (the fixnum (+ x y)))

Note, however, that in the three-argument case, because of the possibility of an implicit intermediate value growing too large, the following will not cause implementation-dependent fixnum-only arithmetic to be used:

 (defun f (x y)
   (declare (fixnum x y z))
   (the fixnum (+ x y z)))

To see why, consider (f most-positive-fixnum 1 -1). Although the arguments and the result are all fixnums, an intermediate value is not a fixnum. If it is important that implementation-dependent fixnum-only arithmetic be selected in implementations that provide it, consider writing something like this instead:

 (defun f (x y)
   (declare (fixnum x y z))
   (the fixnum (+ (the fixnum (+ x y)) z)))

;;----------------------------------------------------------------------

Declaration SPECIAL

The reference to *foo* in the first line of this example is not special even though there is a special declaration in the second line.

 (declaim (special prosp)) =>  implementation-dependent
 (setq prosp 1 reg 1) =>  1
 (let ((prosp 2) (reg 2))         ;the binding of prosp is special
    (set 'prosp 3) (set 'reg 3)   ;due to the preceding proclamation,
    (list prosp reg))             ;whereas the variable reg is lexical
=>  (3 2)
 (list prosp reg) =>  (1 3)

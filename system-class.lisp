
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
System Class SYMBOL

 Symbols have the following attributes. For historical reasons, these are sometimes referred to as cells, although the actual internal representation of symbols and their attributes is implementation-dependent.


Function

    If a symbol has a function attribute, it is said to be fbound, and that fact can be detected by the function fboundp. If the symbol is the name of a function in the global environment, the function cell contains the function, and can be accessed by the function symbol-function. If the symbol is the name of either a macro in the global environment (see macro-function) or a special operator (see special-operator-p), the symbol is fbound, and can be accessed by the function symbol-function, but the object which the function cell contains is of implementation-dependent type and purpose. A symbol can be made to be funbound by the function fmakunbound.

    The consequences are undefined if an attempt is made to change the functional value of a symbol that names a special form.
;;------------------------------------------------------------
Type SIMPLE-ARRAY

 It is implementation-dependent whether displaced arrays, vectors with fill pointers, or arrays that are actually adjustable are simple arrays.


;;------------------------------------------------------------
System Class RANDOM-STATE

Class Precedence List:

random-state, t

Description:

A random state object contains state information used by the pseudo-random number generator. The nature of a random state object is implementation-dependent. It can be printed out and successfully read back in by the same implementation, but might not function correctly as a random state in another implementation.

Implementations are required to provide a read syntax for objects of type random-state, but the specific nature of that syntax is implementation-dependent.
;;------------------------------------------------------------
System Class ECHO-STREAM

Class Precedence List:

echo-stream, stream, t

Description:

An echo stream is a bidirectional stream that gets its input from an associated input stream and sends its output to an associated output stream.

All input taken from the input stream is echoed to the output stream. Whether the input is echoed immediately after it is encountered, or after it has been read from the input stream is implementation-dependent.


;;------------------------------------------------------------
System Class BROADCAST-STREAM

* For the input operations clear-input listen, peek-char, read-byte, read-char-no-hang, read-char, read-line, and unread-char, the consequences are undefined if the indicated operation is performed. However, an implementation is permitted to define such a behavior as an implementation-dependent extension.

For any output operations not having their return values explicitly specified above or elsewhere in this document, it is defined that the values returned by such an operation are the values resulting from performing the operation on the last of its component streams; the values resulting from performing the operation on all preceding streams are discarded. If there are no component streams, the value is implementation-dependent.

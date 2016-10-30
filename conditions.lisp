Condition Type STORAGE-CONDITION

Class Precedence List:

storage-condition, serious-condition, condition, t

Description:

The type storage-condition consists of serious conditions that relate to problems with memory management that are potentially due to implementation-dependent limits rather than semantic errors in conforming programs, and that typically warrant entry to the debugger if not handled. Depending on the details of the implementation, these might include such problems as stack overflow, memory region overflow, and storage exhausted.

Notes:

While some Common Lisp operations might signal storage-condition because they are defined to create objects, it is unspecified whether operations that are not defined to create objects create them anyway and so might also signal storage-condition. Likewise, the evaluator itself might create objects and so might signal storage-condition. (The natural assumption might be that such object creation is naturally inefficient, but even that is implementation-dependent.) In general, the entire question of how storage allocation is done is implementation-dependent, and so any operation might signal storage-condition at any time. Because such a condition is indicative of a limitation of the implementation or of the image rather than an error in a program, objects of type storage-condition are not of type error.

;;----------------------------------------------------------------------
Condition Type FLOATING-POINT-INVALID-OPERATION

Class Precedence List:

floating-point-invalid-operation, arithmetic-error, error, serious-condition, condition, t

Description:

The type floating-point-invalid-operation consists of error conditions that occur because of certain floating point traps.

It is implementation-dependent whether floating point traps occur, and whether or how they may be enabled or disabled. Therefore, conforming code may establish handlers for this condition, but must not depend on its being signaled.
;;----------------------------------------------------------------------
Condition Type FLOATING-POINT-INEXACT

Class Precedence List:

floating-point-inexact, arithmetic-error, error, serious-condition, condition, t

Description:

The type floating-point-inexact consists of error conditions that occur because of certain floating point traps.

It is implementation-dependent whether floating point traps occur, and whether or how they may be enabled or disabled. Therefore, conforming code may establish handlers for this condition, but must not depend on its being signaled.
;;----------------------------------------------------------------------
Condition Type CONDITION

Class Precedence List:

condition, t

Description:

All types of conditions, whether error or non-error, must inherit from this type.

No additional subtype relationships among the specified subtypes of type condition are allowed, except when explicitly mentioned in the text; however implementations are permitted to introduce additional types and one of these types can be a subtype of any number of the subtypes of type condition.

Whether a user-defined condition type has slots that are accessible by with-slots is implementation-dependent. Furthermore, even in an implementation in which user-defined condition types would have slots, it is implementation-dependent whether any condition types defined in this document have such slots or, if they do, what their names might be; only the reader functions documented by this specification may be relied upon by portable code.
;;----------------------------------------------------------------------

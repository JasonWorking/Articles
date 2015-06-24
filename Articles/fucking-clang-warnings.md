

#搬运 [Which Clang Warning Is Generating This Message?](http://fuckingclangwarnings.com/)


 by [Matt Thompson](https://twitter.com/mattt)
 
 
<section id="semantic">

# Semantic Warnings

| Warning | Message |
| --- | --- |
| <tt>-WCFString-literal</tt> | <q>input conversion stopped due to an input byte that does not belong to the input codeset UTF-8</q> |
| <tt>-WNSObject-attribute</tt> | <q>__attribute ((NSObject)) may be put on a typedef only, attribute is ignored</q> |
| <tt>-Wabstract-vbase-init</tt> | <q>initializer for virtual base class %0 of abstract class %1 will never be used</q> |
| <tt>-Waddress-of-array-temporary</tt> | <q>pointer is initialized by a temporary array, which will be destroyed at the end of the full-expression</q> |
| <tt>-Warc-maybe-repeated-use-of-weak</tt> | <q>"weak %select{variable|property|implicit property|instance variable}0 %1 may be accessed multiple times in this %select{function|method|block|lambda}2 and may be unpredictably set to nil assign to a strong variable to keep the object alive</q> |
| <tt>-Warc-non-pod-memaccess</tt> | <q>%select{destination for|source of}0 this %1 call is a pointer to ownership-qualified type %2</q> |
| <tt>-Warc-performSelector-leaks</tt> | <q>performSelector may cause a leak because its selector is unknown</q> |
| <tt>-Warc-repeated-use-of-weak</tt> | <q>"weak %select{variable|property|implicit property|instance variable}0 %1 is accessed multiple times in this %select{function|method|block|lambda}2 but may be unpredictably set to nil assign to a strong variable to keep the object alive</q> |
| <tt>-Warc-retain-cycles</tt> | <q>capturing %0 strongly in this block is likely to lead to a retain cycle</q> |
| <tt>-Warc-unsafe-retained-assign</tt> | <q>assigning retained object to unsafe property object will be released after assignment</q> |
| <tt>-Warc-unsafe-retained-assign</tt> | <q>assigning %select{array literal|dictionary literal|numeric literal|boxed expression|should not happen|block literal}0 to a weak %select{property|variable}1 object will be released after assignment</q> |
| <tt>-Warc-unsafe-retained-assign</tt> | <q>assigning retained object to %select{weak|unsafe_unretained}0 %select{property|variable}1 object will be released after assignment</q> |
| <tt>-Warray-bounds</tt> | <q>array index %0 is past the end of the array (which contains %1 element%s2)</q> |
| <tt>-Warray-bounds</tt> | <q>array index %0 is before the beginning of the array</q> |
| <tt>-Warray-bounds</tt> | <q>'static' has no effect on zero-length arrays</q> |
| <tt>-Warray-bounds</tt> | <q>array argument is too small contains %0 elements, callee requires at least %1</q> |
| <tt>-Warray-bounds-pointer-arithmetic</tt> | <q>the pointer incremented by %0 refers past the end of the array (that contains %1 element%s2)</q> |
| <tt>-Warray-bounds-pointer-arithmetic</tt> | <q>the pointer decremented by %0 refers before the beginning of the array</q> |
| <tt>-Wassign-enum</tt> | <q>integer constant not in range of enumerated type %0</q> |
| <tt>-Watomic-property-with-user-defined-accessor</tt> | <q>writable atomic property %0 cannot pair a synthesized %select{getter|setter}1 with a user defined %select{getter|setter}2</q> |
| <tt>-Wattributes</tt> | <q>unknown attribute %0 ignored</q> |
| <tt>-Wauto-var-id</tt> | <q>'auto' deduced as 'id' in declaration of %0</q> |
| <tt>-Wavailability</tt> | <q>unknown platform %0 in availability macro</q> |
| <tt>-Wavailability</tt> | <q>overriding method %select{introduced after|deprecated before|obsoleted before}0 overridden method on %1 (%2 vs. %3)</q> |
| <tt>-Wavailability</tt> | <q>availability does not match previous declaration</q> |
| <tt>-Wavailability</tt> | <q>overriding method cannot be unavailable on %0 when its overridden method is available</q> |
| <tt>-Wavailability</tt> | <q>feature cannot be %select{introduced|deprecated|obsoleted}0 in %1 version %2 before it was %select{introduced|deprecated|obsoleted}3 in version %4 attribute ignored</q> |
| <tt>-Wbad-function-cast</tt> | <q>cast from function call of type %0 to non-matching type %1</q> |
| <tt>-Wbitfield-constant-conversion</tt> | <q>implicit truncation from %2 to bitfield changes value from %0 to %1</q> |
| <tt>-Wbitwise-op-parentheses</tt> | <q>'&' within '|'</q> |
| <tt>-Wbool-conversion</tt> | <q>"initialization of pointer of type %0 to null from a constant boolean " "expression</q> |
| <tt>-Wbridge-cast</tt> | <q>%0 cannot bridge to %1</q> |
| <tt>-Wbridge-cast</tt> | <q>%0 bridges to %1, not %2</q> |
| <tt>-Wbuiltin-requires-header</tt> | <q>declaration of built-in function '%0' requires inclusion of the header stdio.h</q> |
| <tt>-Wbuiltin-requires-header</tt> | <q>declaration of built-in function '%0' requires inclusion of the header setjmp.h</q> |
| <tt>-Wbuiltin-requires-header</tt> | <q>declaration of built-in function '%0' requires inclusion of the header ucontext.h</q> |
| <tt>-Wc++-compat</tt> | <q>%select{|empty }0%select{struct|union}1 has size 0 in C, %select{size 1|non-zero size}2 in C++</q> |
| <tt>-Wc++11-compat</tt> | <q>explicit instantiation cannot be 'inline'</q> |
| <tt>-Wc++11-compat</tt> | <q>explicit instantiation of %0 must occur at global scope</q> |
| <tt>-Wc++11-compat</tt> | <q>explicit instantiation of %0 not in a namespace enclosing %1</q> |
| <tt>-Wc++11-compat</tt> | <q>explicit instantiation of %q0 must occur in namespace %1</q> |
| <tt>-Wc++11-narrowing</tt> | <q>constant expression evaluates to %0 which cannot be narrowed to type %1 in C++11</q> |
| <tt>-Wc++11-narrowing</tt> | <q>type %0 cannot be narrowed to %1 in initializer list in C++11</q> |
| <tt>-Wc++11-narrowing</tt> | <q>non-constant-expression cannot be narrowed from type %0 to %1 in initializer list in C++11</q> |
| <tt>-Wc++98-c++11-compat</tt> | <q>type definition in a constexpr %select{function|constructor}0 is incompatible with C++ standards before C++1y</q> |
| <tt>-Wc++98-c++11-compat</tt> | <q>use of this statement in a constexpr %select{function|constructor}0 is incompatible with C++ standards before C++1y</q> |
| <tt>-Wc++98-c++11-compat</tt> | <q>init-captures.def warn_cxx11_compat_init_capture : Warning "initialized lambda captures are incompatible with C++ standards " "before C++1y</q> |
| <tt>-Wc++98-c++11-compat</tt> | <q>variable declaration in a constexpr %select{function|constructor}0 is incompatible with C++ standards before C++1y</q> |
| <tt>-Wc++98-c++11-compat</tt> | <q>constexpr function with no return statements is incompatible with C++ standards before C++1y</q> |
| <tt>-Wc++98-c++11-compat</tt> | <q>multiple return statements in constexpr function is incompatible with C++ standards before C++1y</q> |
| <tt>-Wc++98-c++11-compat</tt> | <q>variable templates are incompatible with C++ standards before C++1y</q> |
| <tt>-Wc++98-compat</tt> | <q>substitution failure due to access control is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>%select{anonymous struct|union}0 member %1 with a non-trivial %select{constructor|copy constructor|move constructor|copy assignment operator|move assignment operator|destructor}2 is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>enumeration type in nested name specifier is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>static data member %0 in union is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>default template arguments for a function template are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>scalar initialized from empty initializer list is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>befriending %1 without '%select{struct|interface|union|class|enum}0' keyword is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>use of null pointer as non-type template argument is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>friend declaration naming a member of the declaring class is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>non-class friend type %0 is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>befriending enumeration type %0 is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>use of non-static data member %0 in an unevaluated context is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>friend function %0 would be implicitly redefined in C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>%select{class template|class template partial|variable template|variable template partial|function template|member function|static data member|member class|member enumeration}0 specialization of %1 outside namespace %2 is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>reference initialized from initializer list is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>redundant parentheses surrounding address non-type template argument are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>initialization of initializer_list object is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>use of 'template' keyword outside of a template is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>non-type template argument referring to %select{function|object}0 %1 with internal linkage is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>use of 'typename' outside of a template is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>passing object of trivial but non-POD type %0 through variadic %select{function|block|method|constructor}1 is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>goto would jump into protected scope in C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>constructor call from initializer list is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>'auto' type specifier is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>delegating constructors are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>'constexpr' specifier is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>inheriting constructors are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>explicit conversion functions are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>switch case would be in a protected scope in C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>'%0' type specifier is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>indirect goto might cross protected scopes in C++98</q> |
| <tt>-Wc++98-compat-pedantic</tt> | <q>cast between pointer-to-function and pointer-to-object is incompatible with C++98</q> |
| <tt>-Wc++98-compat-pedantic</tt> | <q>implicit conversion from array size expression of type %0 to %select{integral|enumeration}1 type %2 is incompatible with C++98</q> |
| <tt>-Wcast-align</tt> | <q>cast from %0 to %1 increases required alignment from %2 to %3</q> |
| <tt>-Wcast-of-sel-type</tt> | <q>cast of type %0 to %1 is deprecated use sel_getName instead</q> |
| <tt>-Wchar-subscripts</tt> | <q>array subscript is of type 'char'</q> |
| <tt>-Wconditional-uninitialized</tt> | <q>variable %0 may be uninitialized when %select{used here|captured by block}1</q> |
| <tt>-Wconstant-logical-operand</tt> | <q>use of logical '%0' with constant operand</q> |
| <tt>-Wconstexpr-not-const</tt> | <q>'constexpr' non-static member function will not be implicitly 'const' in C++1y add 'const' to avoid a change in behavior</q> |
| <tt>-Wconsumed</tt> | <q>state of variable '%0' must match at the entry and exit of loop</q> |
| <tt>-Wconsumed</tt> | <q>parameter '%0' not in expected state when the function returns: expected '%1', observed '%2'</q> |
| <tt>-Wconsumed</tt> | <q>argument not in expected state expected '%0', observed '%1'</q> |
| <tt>-Wconsumed</tt> | <q>invalid invocation of method '%0' on a temporary object while it is in the '%1' state</q> |
| <tt>-Wconsumed</tt> | <q>return state set for an unconsumable type '%0'</q> |
| <tt>-Wconsumed</tt> | <q>consumed analysis attribute is attached to member of class '%0' which isn't marked as consumable</q> |
| <tt>-Wconsumed</tt> | <q>invalid invocation of method '%0' on object '%1' while it is in the '%2' state</q> |
| <tt>-Wconsumed</tt> | <q>return value not in expected state expected '%0', observed '%1'</q> |
| <tt>-Wconversion</tt> | <q>implicit conversion discards imaginary component: %0 to %1</q> |
| <tt>-Wconversion</tt> | <q>non-type template argument with value '%0' converted to '%1' for unsigned template parameter of type %2</q> |
| <tt>-Wconversion</tt> | <q>implicit conversion loses floating-point precision: %0 to %1</q> |
| <tt>-Wconversion</tt> | <q>implicit conversion loses integer precision: %0 to %1</q> |
| <tt>-Wconversion</tt> | <q>non-type template argument value '%0' truncated to '%1' for template parameter of type %2</q> |
| <tt>-Wconversion</tt> | <q>implicit conversion turns vector to scalar: %0 to %1</q> |
| <tt>-Wconversion</tt> | <q>implicit conversion turns floating-point number into integer: %0 to %1</q> |
| <tt>-Wcovered-switch-default</tt> | <q>default label in switch which covers all enumeration values</q> |
| <tt>-Wcustom-atomic-properties</tt> | <q>atomic by default property %0 has a user defined %select{getter|setter}1 (property should be marked 'atomic' if this is intended)</q> |
| <tt>-Wdangling-field</tt> | <q>initializing pointer member %0 with the stack address of parameter %1</q> |
| <tt>-Wdangling-field</tt> | <q>binding reference %select{|subobject of }1member %0 to a temporary value</q> |
| <tt>-Wdangling-field</tt> | <q>binding reference member %0 to stack allocated parameter %1</q> |
| <tt>-Wdangling-initializer-list</tt> | <q>array backing the initializer list will be destroyed at the end of %select{the full-expression|the constructor}0</q> |
| <tt>-Wdelete-incomplete</tt> | <q>deleting pointer to incomplete type %0 may cause undefined behavior</q> |
| <tt>-Wdelete-non-virtual-dtor</tt> | <q>delete called on %0 that is abstract but has non-virtual destructor</q> |
| <tt>-Wdelete-non-virtual-dtor</tt> | <q>delete called on %0 that has virtual functions but non-virtual destructor</q> |
| <tt>-Wdeprecated</tt> | <q>access declarations are deprecated use using declarations instead</q> |
| <tt>-Wdeprecated</tt> | <q>definition of implicit copy %select{constructor|assignment operator}1 for %0 is deprecated because it has a user-declared %select{copy %select{assignment operator|constructor}1|destructor}2</q> |
| <tt>-Wdeprecated</tt> | <q>dynamic exception specifications are deprecated</q> |
| <tt>-Wdeprecated-increment-bool</tt> | <q>incrementing expression of type bool is deprecated</q> |
| <tt>-Wdeprecated-objc-isa-usage</tt> | <q>assignment to Objective-C's isa is deprecated in favor of object_setClass()</q> |
| <tt>-Wdeprecated-objc-isa-usage</tt> | <q>direct access to Objective-C's isa is deprecated in favor of object_getClass()</q> |
| <tt>-Wdeprecated-objc-pointer-introspection</tt> | <q>bitmasking for introspection of Objective-C object pointers is strongly discouraged</q> |
| <tt>-Wdeprecated-objc-pointer-introspection-performSelector</tt> | <q>warn_objc_pointer_masking.Text</q> |
| <tt>-Wdeprecated-writable-strings</tt> | <q>dummy warning to enable -fconst-strings</q> |
| <tt>-Wdirect-ivar-access</tt> | <q>instance variable %0 is being directly accessed</q> |
| <tt>-Wdistributed-object-modifiers</tt> | <q>conflicting distributed object modifiers on return type in implementation of %0</q> |
| <tt>-Wdistributed-object-modifiers</tt> | <q>conflicting distributed object modifiers on parameter type in implementation of %0</q> |
| <tt>-Wdivision-by-zero</tt> | <q>division by zero is undefined</q> |
| <tt>-Wdivision-by-zero</tt> | <q>remainder by zero is undefined</q> |
| <tt>-Wdocumentation</tt> | <q>parameter '%0' not found in the function declaration</q> |
| <tt>-Wdocumentation</tt> | <q>not a Doxygen trailing comment</q> |
| <tt>-Wduplicate-enum</tt> | <q>element %0 has been implicitly assigned %1 which another element has been assigned</q> |
| <tt>-Wduplicate-method-match</tt> | <q>multiple declarations of method %0 found and ignored</q> |
| <tt>-Wdynamic-class-memaccess</tt> | <q>%select{destination for|source of|first operand of|second operand of}0 this %1 call is a pointer to dynamic class %2 vtable pointer will be %select{overwritten|copied|moved|compared}3</q> |
| <tt>-Wempty-body</tt> | <q>switch statement has empty body</q> |
| <tt>-Wempty-body</tt> | <q>for loop has empty body</q> |
| <tt>-Wempty-body</tt> | <q>if statement has empty body</q> |
| <tt>-Wempty-body</tt> | <q>range-based for loop has empty body</q> |
| <tt>-Wempty-body</tt> | <q>while loop has empty body</q> |
| <tt>-Wenum-compare</tt> | <q>comparison of two values with different enumeration types%diff{ ($ and $)|}0,1</q> |
| <tt>-Wenum-conversion</tt> | <q>implicit conversion from enumeration type %0 to different enumeration type %1</q> |
| <tt>-Wexit-time-destructors</tt> | <q>declaration requires an exit-time destructor</q> |
| <tt>-Wexplicit-ownership-type</tt> | <q>method parameter of type %0 with no explicit ownership</q> |
| <tt>-Wextern-c-compat</tt> | <q>%select{|empty }0%select{struct|union}1 has size 0 in C, %select{size 1|non-zero size}2 in C++</q> |
| <tt>-Wextern-initializer</tt> | <q>'extern' variable has an initializer</q> |
| <tt>-Wfloat-equal</tt> | <q>comparing floating point with == or != is unsafe</q> |
| <tt>-Wformat</tt> | <q>"data argument position '%0' exceeds the number of data arguments (%1)</q> |
| <tt>-Wformat</tt> | <q>position arguments in format strings start counting at 1 (not 0)</q> |
| <tt>-Wformat</tt> | <q>invalid position specified for %select{field width|field precision}0</q> |
| <tt>-Wformat</tt> | <q>cannot mix positional and non-positional arguments in format string</q> |
| <tt>-Wformat</tt> | <q>values of type '%0' should not be used as format arguments add an explicit cast to %1 instead</q> |
| <tt>-Wformat</tt> | <q>format specifies type %0 but the argument has type %1</q> |
| <tt>-Wformat</tt> | <q>zero field width in scanf format string is unused</q> |
| <tt>-Wformat</tt> | <q>no closing ']' for '%%[' in scanf format string</q> |
| <tt>-Wformat</tt> | <q>format string should not be a wide string</q> |
| <tt>-Wformat</tt> | <q>format string contains '\\0' within the string body</q> |
| <tt>-Wformat</tt> | <q>'%select{*|.*}0' specified field %select{width|precision}0 is missing a matching 'int' argument</q> |
| <tt>-Wformat</tt> | <q>field %select{width|precision}0 should have type %1, but argument has type %2</q> |
| <tt>-Wformat</tt> | <q>%select{field width|precision}0 used with '%1' conversion specifier, resulting in undefined behavior</q> |
| <tt>-Wformat</tt> | <q>format string missing</q> |
| <tt>-Wformat</tt> | <q>incomplete format specifier</q> |
| <tt>-Wformat</tt> | <q>flag '%0' results in undefined behavior with '%1' conversion specifier</q> |
| <tt>-Wformat</tt> | <q>flag '%0' is ignored when flag '%1' is present</q> |
| <tt>-Wformat</tt> | <q>more '%%' conversions than data arguments</q> |
| <tt>-Wformat</tt> | <q>length modifier '%0' results in undefined behavior or no effect with '%1' conversion specifier</q> |
| <tt>-Wformat-extra-args</tt> | <q>data argument not used by format string</q> |
| <tt>-Wformat-invalid-specifier</tt> | <q>invalid conversion specifier '%0'</q> |
| <tt>-Wformat-nonliteral</tt> | <q>format string is not a string literal</q> |
| <tt>-Wformat-security</tt> | <q>format string is not a string literal (potentially insecure)</q> |
| <tt>-Wformat-zero-length</tt> | <q>format string is empty</q> |
| <tt>-Wgcc-compat</tt> | <q>GCC does not allow the 'cleanup' attribute argument to be anything other than a simple identifier</q> |
| <tt>-Wglobal-constructors</tt> | <q>declaration requires a global constructor</q> |
| <tt>-Wglobal-constructors</tt> | <q>declaration requires a global destructor</q> |
| <tt>-Wgnu-conditional-omitted-operand</tt> | <q>use of GNU ?: conditional expression extension, omitting middle operand</q> |
| <tt>-Wheader-hygiene</tt> | <q>using namespace directive in global context in header</q> |
| <tt>-Widiomatic-parentheses</tt> | <q>using the result of an assignment as a condition without parentheses</q> |
| <tt>-Wignored-attributes</tt> | <q>'malloc' attribute only applies to functions returning a pointer type</q> |
| <tt>-Wignored-attributes</tt> | <q>%0 attribute only applies to %select{functions|unions|variables and functions|functions and methods|parameters|functions, methods and blocks|functions, methods, and classes|functions, methods, and parameters|classes|variables|methods|variables, functions and labels|fields and global variables|structs|variables, functions and tag types|thread-local variables|variables and fields|variables, data members and tag types|types and namespaces|Objective-C interfaces}1</q> |
| <tt>-Wignored-attributes</tt> | <q>'%0' attribute cannot be specified on a definition</q> |
| <tt>-Wignored-attributes</tt> | <q>__weak attribute cannot be specified on an automatic variable when ARC is not enabled</q> |
| <tt>-Wignored-attributes</tt> | <q>Objective-C GC does not allow weak variables on the stack</q> |
| <tt>-Wignored-attributes</tt> | <q>__weak attribute cannot be specified on a field declaration</q> |
| <tt>-Wignored-attributes</tt> | <q>attribute %0 cannot be applied to %select{functions|Objective-C method}1 without return value</q> |
| <tt>-Wignored-attributes</tt> | <q>attribute declaration must precede definition</q> |
| <tt>-Wignored-attributes</tt> | <q>attribute %0 is ignored, place it after \"%select{class|struct|union|interface|enum}1\" to apply attribute to type declaration</q> |
| <tt>-Wignored-attributes</tt> | <q>__declspec attribute %0 is not supported</q> |
| <tt>-Wignored-attributes</tt> | <q>attribute %0 ignored, because it cannot be applied to a type</q> |
| <tt>-Wignored-attributes</tt> | <q>attribute %0 after definition is ignored</q> |
| <tt>-Wignored-attributes</tt> | <q>%0 attribute ignored</q> |
| <tt>-Wignored-attributes</tt> | <q>'sentinel' attribute only supported for variadic %select{functions|blocks}0</q> |
| <tt>-Wignored-attributes</tt> | <q>'sentinel' attribute requires named arguments</q> |
| <tt>-Wignored-attributes</tt> | <q>'%0' only applies to %select{function|pointer|Objective-C object or block pointer}1 types type here is %2</q> |
| <tt>-Wignored-attributes</tt> | <q>'nonnull' attribute applied to function with no pointer arguments</q> |
| <tt>-Wignored-attributes</tt> | <q>%0 attribute can only be applied to instance variables or properties</q> |
| <tt>-Wignored-attributes</tt> | <q>ibaction attribute can only be applied to Objective-C instance methods</q> |
| <tt>-Wignored-attributes</tt> | <q>%0 calling convention ignored on variadic function</q> |
| <tt>-Wignored-attributes</tt> | <q>%0 only applies to variables with static storage duration and functions</q> |
| <tt>-Wignored-attributes</tt> | <q>%0 attribute argument not supported: %1</q> |
| <tt>-Wignored-attributes</tt> | <q>#pramga ms_struct can not be used with dynamic classes or structures</q> |
| <tt>-Wignored-attributes</tt> | <q>transparent union definition must contain at least one field transparent_union attribute ignored</q> |
| <tt>-Wignored-attributes</tt> | <q>first field of a transparent union cannot have %select{floating point|vector}0 type %1 transparent_union attribute ignored</q> |
| <tt>-Wignored-attributes</tt> | <q>'gnu_inline' attribute requires function to be marked 'inline', attribute ignored</q> |
| <tt>-Wignored-attributes</tt> | <q>calling convention %0 ignored for this target</q> |
| <tt>-Wignored-attributes</tt> | <q>transparent_union attribute can only be applied to a union definition attribute ignored</q> |
| <tt>-Wignored-attributes</tt> | <q>%select{alignment|size}0 of field %1 (%2 bits) does not match the %select{alignment|size}0 of the first field in transparent union transparent_union attribute ignored</q> |
| <tt>-Wignored-attributes</tt> | <q>attribute %0 is already applied</q> |
| <tt>-Wignored-attributes</tt> | <q>%0 attribute ignored for field of type %1</q> |
| <tt>-Wignored-attributes</tt> | <q>%0 attribute ignored when parsing type</q> |
| <tt>-Wignored-attributes</tt> | <q>%0 attribute only applies to %select{functions|methods|properties}1 that return %select{an Objective-C object|a pointer|a non-retainable pointer}2</q> |
| <tt>-Wignored-attributes</tt> | <q>%0 attribute only applies to %select{Objective-C object|pointer}1 parameters</q> |
| <tt>-Wignored-attributes</tt> | <q>attribute %0 is already applied with different parameters</q> |
| <tt>-Wignored-attributes</tt> | <q>unknown visibility %0</q> |
| <tt>-Wignored-qualifiers</tt> | <q>"'%0' type qualifier%s1 on return type %plural{1:has|:have}1 no effect</q> |
| <tt>-Wignored-qualifiers</tt> | <q>ARC %select{unused|__unsafe_unretained|__strong|__weak|__autoreleasing}0 lifetime qualifier on return type is ignored</q> |
| <tt>-Wimplicit-atomic-properties</tt> | <q>property is assumed atomic by default</q> |
| <tt>-Wimplicit-atomic-properties</tt> | <q>property is assumed atomic when auto-synthesizing the property</q> |
| <tt>-Wimplicit-fallthrough</tt> | <q>fallthrough annotation in unreachable code</q> |
| <tt>-Wimplicit-fallthrough</tt> | <q>unannotated fall-through between switch labels</q> |
| <tt>-Wimplicit-fallthrough</tt> | <q>fallthrough annotation does not directly precede switch label</q> |
| <tt>-Wimplicit-function-declaration</tt> | <q>implicit declaration of function %0</q> |
| <tt>-Wimplicit-function-declaration</tt> | <q>use of unknown builtin %0</q> |
| <tt>-Wimplicit-retain-self</tt> | <q>"block implicitly retains 'self' explicitly mention 'self' to indicate this is intended behavior</q> |
| <tt>-Wincompatible-library-redeclaration</tt> | <q>incompatible redeclaration of library function %0</q> |
| <tt>-Wincomplete-implementation</tt> | <q>method definition for %0 not found</q> |
| <tt>-Winherited-variadic-ctor</tt> | <q>inheriting constructor does not inherit ellipsis</q> |
| <tt>-Winitializer-overrides</tt> | <q>subobject initialization overrides initialization of other fields within its enclosing subobject</q> |
| <tt>-Winitializer-overrides</tt> | <q>initializer overrides prior initialization of this subobject</q> |
| <tt>-Wint-to-pointer-cast</tt> | <q>cast to %1 from smaller integer type %0</q> |
| <tt>-Wint-to-void-pointer-cast</tt> | <q>cast to %1 from smaller integer type %0</q> |
| <tt>-Winvalid-iboutlet</tt> | <q>IBOutletCollection properties should be copy/strong and not assign</q> |
| <tt>-Winvalid-iboutlet</tt> | <q>%select{instance variable|property}2 with %0 attribute must be an object type (invalid %1)</q> |
| <tt>-Winvalid-noreturn</tt> | <q>function %0 declared 'noreturn' should not return</q> |
| <tt>-Winvalid-noreturn</tt> | <q>function declared 'noreturn' should not return</q> |
| <tt>-Wlarge-by-value-copy</tt> | <q>return value of %0 is a large (%1 bytes) pass-by-value object pass it by reference instead ?</q> |
| <tt>-Wlarge-by-value-copy</tt> | <q>%0 is a large (%1 bytes) pass-by-value argument pass it by reference instead ?</q> |
| <tt>-Wliteral-conversion</tt> | <q>implicit conversion from %0 to %1 changes value from %2 to %3</q> |
| <tt>-Wliteral-range</tt> | <q>magnitude of floating-point constant too large for type %0 maximum is %1</q> |
| <tt>-Wliteral-range</tt> | <q>magnitude of floating-point constant too small for type %0 minimum is %1</q> |
| <tt>-Wlogical-not-parentheses</tt> | <q>logical not is only applied to the left hand side of this comparison</q> |
| <tt>-Wlogical-op-parentheses</tt> | <q>'&&' within '||'</q> |
| <tt>-Wloop-analysis</tt> | <q>variable%select{s| %1|s %1 and %2|s %1, %2, and %3|s %1, %2, %3, and %4}0 used in loop condition not modified in loop body</q> |
| <tt>-Wloop-analysis</tt> | <q>variable %0 is %select{decremented|incremented}1 both in the loop header and in the loop body</q> |
| <tt>-Wmethod-signatures</tt> | <q>conflicting parameter types in implementation of %0: %1 vs %2</q> |
| <tt>-Wmethod-signatures</tt> | <q>conflicting return type in implementation of %0: %1 vs %2</q> |
| <tt>-Wmicrosoft</tt> | <q>extra qualification on member %0</q> |
| <tt>-Wmismatched-method-attributes</tt> | <q>attributes on method implementation and its declaration must match</q> |
| <tt>-Wmismatched-parameter-types</tt> | <q>conflicting parameter types in implementation of %0%diff{: $ vs $|}1,2</q> |
| <tt>-Wmismatched-return-types</tt> | <q>conflicting return type in implementation of %0%diff{: $ vs $|}1,2</q> |
| <tt>-Wmissing-braces</tt> | <q>suggest braces around initialization of subobject</q> |
| <tt>-Wmissing-declarations</tt> | <q>'%0' ignored on this declaration</q> |
| <tt>-Wmissing-field-initializers</tt> | <q>missing field '%0' initializer</q> |
| <tt>-Wmissing-method-return-type</tt> | <q>method has no return type specified defaults to 'id'</q> |
| <tt>-Wmissing-noreturn</tt> | <q>%select{function|method}0 %1 could be declared with attribute 'noreturn'</q> |
| <tt>-Wmissing-noreturn</tt> | <q>block could be declared with attribute 'noreturn'</q> |
| <tt>-Wmissing-prototypes</tt> | <q>no previous prototype for function %0</q> |
| <tt>-Wmissing-variable-declarations</tt> | <q>no previous extern declaration for non-static variable %0</q> |
| <tt>-Wmultiple-move-vbase</tt> | <q>defaulted move assignment operator of %0 will move assign virtual base class %1 multiple times</q> |
| <tt>-Wnested-anon-types</tt> | <q>anonymous types declared in an anonymous union/struct are an extension</q> |
| <tt>-Wno-typedef-redefinition</tt> | <q>Redefinition of typedef '%0' is a C11 feature</q> |
| <tt>-Wnon-literal-null-conversion</tt> | <q>"expression which evaluates to zero treated as a null pointer constant of " "type %0</q> |
| <tt>-Wnon-pod-varargs</tt> | <q>second argument to 'va_arg' is of ARC ownership-qualified type %0</q> |
| <tt>-Wnon-pod-varargs</tt> | <q>cannot pass %select{non-POD|non-trivial}0 object of type %1 to variadic %select{function|block|method|constructor}2 expected type from format string was %3</q> |
| <tt>-Wnon-pod-varargs</tt> | <q>second argument to 'va_arg' is of non-POD type %0</q> |
| <tt>-Wnon-pod-varargs</tt> | <q>cannot pass object of %select{non-POD|non-trivial}0 type %1 through variadic %select{function|block|method|constructor}2 call will abort at runtime</q> |
| <tt>-Wnon-virtual-dtor</tt> | <q>%0 has virtual functions but non-virtual destructor</q> |
| <tt>-Wnonnull</tt> | <q>null passed to a callee which requires a non-null argument</q> |
| <tt>-Wnull-arithmetic</tt> | <q>use of NULL in arithmetic operation</q> |
| <tt>-Wnull-arithmetic</tt> | <q>comparison between NULL and non-pointer %select{(%1 and NULL)|(NULL and %1)}0</q> |
| <tt>-Wnull-dereference</tt> | <q>indirection of non-volatile null pointer will be deleted, not trap</q> |
| <tt>-Wobjc-autosynthesis-property-ivar-name-match</tt> | <q>autosynthesized property %0 will use %select{|synthesized}1 instance variable %2, not existing instance variable %3</q> |
| <tt>-Wobjc-forward-class-redefinition</tt> | <q>redefinition of forward class %0 of a typedef name of an object type is ignored</q> |
| <tt>-Wobjc-interface-ivars</tt> | <q>declaration of instance variables in the interface is deprecated</q> |
| <tt>-Wobjc-literal-compare</tt> | <q>direct comparison of %select{an array literal|a dictionary literal|a numeric literal|a boxed expression|}0 has undefined behavior</q> |
| <tt>-Wobjc-literal-missing-atsign</tt> | <q>string literal must be prefixed by '@'</q> |
| <tt>-Wobjc-method-access</tt> | <q>instance method %objcinstance0 not found (return type defaults to 'id') did you mean %objcinstance2?</q> |
| <tt>-Wobjc-method-access</tt> | <q>class method %objcclass0 not found (return type defaults to 'id') did you mean %objcclass2?</q> |
| <tt>-Wobjc-method-access</tt> | <q>instance method %objcinstance0 not found (return type defaults to 'id')</q> |
| <tt>-Wobjc-method-access</tt> | <q>instance method %0 is being used on 'Class' which is not in the root class</q> |
| <tt>-Wobjc-method-access</tt> | <q>class method %objcclass0 not found (return type defaults to 'id')</q> |
| <tt>-Wobjc-method-access</tt> | <q>instance method %0 found instead of class method %1</q> |
| <tt>-Wobjc-missing-property-synthesis</tt> | <q>"auto property synthesis is synthesizing property not explicitly synthesized</q> |
| <tt>-Wobjc-missing-super-calls</tt> | <q>method possibly missing a [super %0] call</q> |
| <tt>-Wobjc-noncopy-retain-block-property</tt> | <q>"retain'ed block property does not copy the block " "- use copy attribute instead</q> |
| <tt>-Wobjc-nonunified-exceptions</tt> | <q>can not catch an exception thrown with @throw in C++ in the non-unified exception model</q> |
| <tt>-Wobjc-property-implementation</tt> | <q>property %0 requires method %1 to be defined - use @dynamic or provide a method implementation in this category</q> |
| <tt>-Wobjc-property-implementation</tt> | <q>property %0 requires method %1 to be defined - use @synthesize, @dynamic or provide a method implementation in this class implementation</q> |
| <tt>-Wobjc-property-implicit-mismatch</tt> | <q>"primary property declaration is implicitly strong while redeclaration in class extension is weak</q> |
| <tt>-Wobjc-property-matches-cocoa-ownership-rule</tt> | <q>property's synthesized getter follows Cocoa naming convention for returning 'owned' objects</q> |
| <tt>-Wobjc-property-no-attribute</tt> | <q>no 'assign', 'retain', or 'copy' attribute is specified - 'assign' is assumed</q> |
| <tt>-Wobjc-property-no-attribute</tt> | <q>default property attribute 'assign' not appropriate for non-GC object</q> |
| <tt>-Wobjc-property-synthesis</tt> | <q>auto property synthesis will not synthesize property '%0' because it is 'readwrite' but it will be synthesized 'readonly' via another property</q> |
| <tt>-Wobjc-property-synthesis</tt> | <q>"auto property synthesis will not synthesize property '%0' because it cannot share an ivar with another synthesized property</q> |
| <tt>-Wobjc-protocol-method-implementation</tt> | <q>category is implementing a method which will also be implemented by its primary class</q> |
| <tt>-Wobjc-protocol-property-synthesis</tt> | <q>auto property synthesis will not synthesize property declared in a protocol</q> |
| <tt>-Wobjc-redundant-literal-use</tt> | <q>using %0 with a literal is redundant</q> |
| <tt>-Wobjc-root-class</tt> | <q>class %0 defined without specifying a base class</q> |
| <tt>-Wobjc-string-compare</tt> | <q>direct comparison of a string literal has undefined behavior</q> |
| <tt>-Wobjc-string-concatenation</tt> | <q>concatenated NSString literal for an NSArray expression - possibly missing a comma</q> |
| <tt>-Wover-aligned</tt> | <q>type %0 requires %1 bytes of alignment and the default allocator only guarantees %2 bytes</q> |
| <tt>-Woverloaded-shift-op-parentheses</tt> | <q>overloaded operator %select{|}0 has lower precedence than comparison operator</q> |
| <tt>-Woverloaded-virtual</tt> | <q>%q0 hides overloaded virtual %select{function|functions}1</q> |
| <tt>-Woverriding-method-mismatch</tt> | <q>conflicting distributed object modifiers on parameter type in declaration of %0</q> |
| <tt>-Woverriding-method-mismatch</tt> | <q>conflicting parameter types in declaration of %0: %1 vs %2</q> |
| <tt>-Woverriding-method-mismatch</tt> | <q>conflicting variadic declaration of method and its implementation</q> |
| <tt>-Woverriding-method-mismatch</tt> | <q>conflicting distributed object modifiers on return type in declaration of %0</q> |
| <tt>-Woverriding-method-mismatch</tt> | <q>conflicting parameter types in declaration of %0%diff{: $ vs $|}1,2</q> |
| <tt>-Woverriding-method-mismatch</tt> | <q>conflicting return type in declaration of %0%diff{: $ vs $|}1,2</q> |
| <tt>-Woverriding-method-mismatch</tt> | <q>conflicting return type in declaration of %0: %1 vs %2</q> |
| <tt>-Wpacked</tt> | <q>packed attribute is unnecessary for %0</q> |
| <tt>-Wpadded</tt> | <q>padding %select{struct|interface|class}0 %1 with %2 %select{byte|bit}3%select{|s}4 to align anonymous bit-field</q> |
| <tt>-Wpadded</tt> | <q>padding %select{struct|interface|class}0 %1 with %2 %select{byte|bit}3%select{|s}4 to align %5</q> |
| <tt>-Wpadded</tt> | <q>padding size of %0 with %1 %select{byte|bit}2%select{|s}3 to alignment boundary</q> |
| <tt>-Wparentheses</tt> | <q>using the result of an assignment as a condition without parentheses</q> |
| <tt>-Wparentheses</tt> | <q>%0 has lower precedence than %1 %1 will be evaluated first</q> |
| <tt>-Wparentheses</tt> | <q>operator '?:' has lower precedence than '%0' '%0' will be evaluated first</q> |
| <tt>-Wparentheses-equality</tt> | <q>equality comparison with extraneous parentheses</q> |
| <tt>-Wpointer-arith</tt> | <q>subtraction of pointers to type %0 of zero size has undefined behavior</q> |
| <tt>-Wpredefined-identifier-outside-function</tt> | <q>predefined identifier is only valid inside function</q> |
| <tt>-Wprivate-extern</tt> | <q>use of __private_extern__ on a declaration may not produce external symbol private to the linkage unit and is deprecated</q> |
| <tt>-Wprotocol</tt> | <q>method %0 in protocol not implemented</q> |
| <tt>-Wprotocol-property-synthesis-ambiguity</tt> | <q>property of type %0 was selected for synthesis</q> |
| <tt>-Wreadonly-iboutlet-property</tt> | <q>readonly IBOutlet property '%0' when auto-synthesized may not work correctly with 'nib' loader</q> |
| <tt>-Wreadonly-setter-attrs</tt> | <q>property attributes '%0' and '%1' are mutually exclusive</q> |
| <tt>-Wreceiver-expr</tt> | <q>receiver type %0 is not 'id' or interface pointer, consider casting it to 'id'</q> |
| <tt>-Wreceiver-forward-class</tt> | <q>receiver type %0 for instance message is a forward declaration</q> |
| <tt>-Wreceiver-is-weak</tt> | <q>"weak %select{receiver|property|implicit property}0 may be unpredictably set to nil</q> |
| <tt>-Wreinterpret-base-class</tt> | <q>'reinterpret_cast' %select{from|to}3 class %0 %select{to|from}3 its %select{virtual base|base at non-zero offset}2 %1 behaves differently from 'static_cast'</q> |
| <tt>-Wreorder</tt> | <q>%select{field|base class}0 %1 will be initialized after %select{field|base}2 %3</q> |
| <tt>-Wrequires-super-attribute</tt> | <q>%0 attribute cannot be applied to %select{methods in protocols|dealloc}1</q> |
| <tt>-Wreturn-stack-address</tt> | <q>returning address of local temporary object</q> |
| <tt>-Wreturn-stack-address</tt> | <q>returning address of label, which is local</q> |
| <tt>-Wreturn-stack-address</tt> | <q>address of stack memory associated with local variable %0 returned</q> |
| <tt>-Wreturn-stack-address</tt> | <q>reference to stack memory associated with local variable %0 returned</q> |
| <tt>-Wreturn-stack-address</tt> | <q>returning reference to local temporary object</q> |
| <tt>-Wreturn-type</tt> | <q>control may reach end of non-void function</q> |
| <tt>-Wreturn-type</tt> | <q>non-void %select{function|method}1 %0 should return a value, DefaultError</q> |
| <tt>-Wreturn-type</tt> | <q>control reaches end of non-void function</q> |
| <tt>-Wreturn-type-c-linkage</tt> | <q>%0 has C-linkage specified, but returns incomplete type %1 which could be incompatible with C</q> |
| <tt>-Wreturn-type-c-linkage</tt> | <q>%0 has C-linkage specified, but returns user-defined type %1 which is incompatible with C</q> |
| <tt>-Wsection</tt> | <q>section does not match previous declaration</q> |
| <tt>-Wselector</tt> | <q>creating selector for nonexistent method %0</q> |
| <tt>-Wselector-type-mismatch</tt> | <q>multiple selectors named %0 found</q> |
| <tt>-Wself-assign</tt> | <q>explicitly assigning a variable of type %0 to itself</q> |
| <tt>-Wself-assign-field</tt> | <q>assigning %select{field|instance variable}0 to itself</q> |
| <tt>-Wsentinel</tt> | <q>"missing sentinel in %select{function call|method dispatch|block call}0</q> |
| <tt>-Wsentinel</tt> | <q>not enough variable arguments in %0 declaration to fit a sentinel</q> |
| <tt>-Wshadow</tt> | <q>declaration shadows a %select{" "local variable|" "variable in %2|" "static data member of %2|" "field of %2}1</q> |
| <tt>-Wshadow-ivar</tt> | <q>local declaration of %0 hides instance variable</q> |
| <tt>-Wshift-count-negative</tt> | <q>shift count is negative</q> |
| <tt>-Wshift-count-overflow</tt> | <q>shift count = width of type</q> |
| <tt>-Wshift-op-parentheses</tt> | <q>operator '%0' has lower precedence than '%1' '%1' will be evaluated first</q> |
| <tt>-Wshift-overflow</tt> | <q>signed shift result (%0) requires %1 bits to represent, but %2 only has %3 bits</q> |
| <tt>-Wshift-sign-overflow</tt> | <q>signed shift result (%0) sets the sign bit of the shift expression's type (%1) and becomes negative</q> |
| <tt>-Wshorten-64-to-32</tt> | <q>implicit conversion loses integer precision: %0 to %1</q> |
| <tt>-Wsign-compare</tt> | <q>comparison of integers of different signs: %0 and %1</q> |
| <tt>-Wsign-conversion</tt> | <q>implicit conversion changes signedness: %0 to %1</q> |
| <tt>-Wsign-conversion</tt> | <q>operand of ? changes signedness: %0 to %1</q> |
| <tt>-Wsizeof-array-argument</tt> | <q>sizeof on array function parameter will return size of %0 instead of %1</q> |
| <tt>-Wsizeof-array-decay</tt> | <q>sizeof on pointer operation will return size of %0 instead of %1</q> |
| <tt>-Wsizeof-pointer-memaccess</tt> | <q>'%0' call operates on objects of type %1 while the size is based on a " "different type %2</q> |
| <tt>-Wsizeof-pointer-memaccess</tt> | <q>argument to 'sizeof' in %0 call is the same pointer type %1 as the %select{destination|source}2 expected %3 or an explicit length</q> |
| <tt>-Wsometimes-uninitialized</tt> | <q>variable %0 is %select{used|captured}1 uninitialized whenever %select{'%3' condition is %select{true|false}4|'%3' loop %select{is entered|exits because its condition is false}4|'%3' loop %select{condition is true|exits because its condition is false}4|switch %3 is taken|its declaration is reached|%3 is called}2</q> |
| <tt>-Wstatic-local-in-inline</tt> | <q>non-constant static local variable in inline function may be different in different files</q> |
| <tt>-Wstatic-self-init</tt> | <q>static variable %0 is suspiciously used within its own initialization</q> |
| <tt>-Wstrict-selector-match</tt> | <q>multiple methods named %0 found</q> |
| <tt>-Wstring-compare</tt> | <q>result of comparison against %select{a string literal|@encode}0 is unspecified (use strncmp instead)</q> |
| <tt>-Wstring-conversion</tt> | <q>implicit conversion turns string literal into bool: %0 to %1</q> |
| <tt>-Wstring-plus-char</tt> | <q>adding %0 to a string pointer does not append to the string</q> |
| <tt>-Wstring-plus-int</tt> | <q>adding %0 to a string does not append to the string</q> |
| <tt>-Wstrlcpy-strlcat-size</tt> | <q>size argument in %0 call appears to be size of the source expected the size of the destination</q> |
| <tt>-Wstrncat-size</tt> | <q>the value of the size argument in 'strncat' is too large, might lead to a " "buffer overflow</q> |
| <tt>-Wstrncat-size</tt> | <q>size argument in 'strncat' call appears " "to be size of the source</q> |
| <tt>-Wstrncat-size</tt> | <q>the value of the size argument to 'strncat' is wrong</q> |
| <tt>-Wsuper-class-method-mismatch</tt> | <q>method parameter type %diff{$ does not match super class method parameter type $|does not match super class method parameter type}0,1</q> |
| <tt>-Wswitch</tt> | <q>overflow converting case value to switch condition type (%0 to %1)</q> |
| <tt>-Wswitch</tt> | <q>case value not in enumerated type %0</q> |
| <tt>-Wswitch</tt> | <q>%0 enumeration values not handled in switch: %1, %2, %3...</q> |
| <tt>-Wswitch</tt> | <q>enumeration values %0 and %1 not handled in switch</q> |
| <tt>-Wswitch</tt> | <q>enumeration value %0 not handled in switch</q> |
| <tt>-Wswitch</tt> | <q>enumeration values %0, %1, and %2 not handled in switch</q> |
| <tt>-Wswitch-enum</tt> | <q>enumeration values %0, %1, and %2 not explicitly handled in switch</q> |
| <tt>-Wswitch-enum</tt> | <q>enumeration values %0 and %1 not explicitly handled in switch</q> |
| <tt>-Wswitch-enum</tt> | <q>%0 enumeration values not explicitly handled in switch: %1, %2, %3...</q> |
| <tt>-Wswitch-enum</tt> | <q>enumeration value %0 not explicitly handled in switch</q> |
| <tt>-Wtautological-compare</tt> | <q>comparison of %0 unsigned%select{| enum}2 expression is always %1</q> |
| <tt>-Wtautological-compare</tt> | <q>%select{self-|array }0comparison always evaluates to %select{false|true|a constant}1</q> |
| <tt>-Wtautological-compare</tt> | <q>comparison of unsigned%select{| enum}2 expression %0 is always %1</q> |
| <tt>-Wtautological-constant-out-of-range-compare</tt> | <q>comparison of constant %0 with expression of type %1 is always %select{false|true}2</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>locking '%0' that is already locked</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>cannot call function '%0' while mutex '%1' is locked</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>%select{reading|writing}2 the value pointed to by '%0' requires locking %select{'%1'|'%1' exclusively}2</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>unlocking '%0' that was not locked</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>mutex '%0' is locked exclusively and shared in the same scope</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>calling function '%0' requires %select{shared|exclusive}2 lock on '%1'</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>%select{reading|writing}2 variable '%0' requires locking %select{'%1'|'%1' exclusively}2</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>cannot resolve lock expression</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>expecting mutex '%0' to be locked at the end of function</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>mutex '%0' is not locked on every path through here</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>%select{reading|writing}1 the value pointed to by '%0' requires locking %select{any mutex|any mutex exclusively}1</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>%select{reading|writing}1 variable '%0' requires locking %select{any mutex|any mutex exclusively}1</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>mutex '%0' is still locked at the end of function</q> |
| <tt>-Wthread-safety-analysis</tt> | <q>expecting mutex '%0' to be locked at start of each loop</q> |
| <tt>-Wthread-safety-attributes</tt> | <q>ignoring %0 attribute because its argument is invalid</q> |
| <tt>-Wthread-safety-attributes</tt> | <q>%0 attribute only applies to %select{fields and global variables|functions and methods|classes and structs}1</q> |
| <tt>-Wthread-safety-attributes</tt> | <q>%0 attribute requires arguments that are class type or point to class type type here is '%1'</q> |
| <tt>-Wthread-safety-attributes</tt> | <q>%0 attribute can only be applied in a context annotated with 'lockable' attribute</q> |
| <tt>-Wthread-safety-attributes</tt> | <q>%0 attribute requires arguments whose type is annotated with 'lockable' attribute type here is '%1'</q> |
| <tt>-Wthread-safety-attributes</tt> | <q>'%0' only applies to pointer types type here is %1</q> |
| <tt>-Wthread-safety-beta</tt> | <q>Thread safety beta warning.</q> |
| <tt>-Wthread-safety-precise</tt> | <q>%select{reading|writing}2 the value pointed to by '%0' requires locking %select{'%1'|'%1' exclusively}2</q> |
| <tt>-Wthread-safety-precise</tt> | <q>%select{reading|writing}2 variable '%0' requires locking %select{'%1'|'%1' exclusively}2</q> |
| <tt>-Wthread-safety-precise</tt> | <q>calling function '%0' requires %select{shared|exclusive}2 lock on '%1'</q> |
| <tt>-Wtype-safety</tt> | <q>this type tag was not designed to be used with this function</q> |
| <tt>-Wtype-safety</tt> | <q>specified %0 type tag requires a null pointer</q> |
| <tt>-Wtype-safety</tt> | <q>argument type %0 doesn't match specified '%1' type tag %select{that requires %3|}2</q> |
| <tt>-Wundeclared-selector</tt> | <q>undeclared selector %0 did you mean %1?</q> |
| <tt>-Wundeclared-selector</tt> | <q>undeclared selector %0</q> |
| <tt>-Wundefined-inline</tt> | <q>inline function %q0 is not defined</q> |
| <tt>-Wundefined-internal</tt> | <q>%select{function|variable}0 %q1 has internal linkage but is not defined</q> |
| <tt>-Wundefined-reinterpret-cast</tt> | <q>dereference of type %1 that was reinterpret_cast from type %0 has undefined behavior</q> |
| <tt>-Wundefined-reinterpret-cast</tt> | <q>reinterpret_cast from %0 to %1 has undefined behavior</q> |
| <tt>-Wuninitialized</tt> | <q>reference %0 is not yet bound to a value when used within its own initialization</q> |
| <tt>-Wuninitialized</tt> | <q>field %0 is uninitialized when used here</q> |
| <tt>-Wuninitialized</tt> | <q>block pointer variable %0 is uninitialized when captured by block</q> |
| <tt>-Wuninitialized</tt> | <q>variable %0 is uninitialized when used within its own initialization</q> |
| <tt>-Wuninitialized</tt> | <q>variable %0 is uninitialized when %select{used here|captured by block}1</q> |
| <tt>-Wuninitialized</tt> | <q>reference %0 is not yet bound to a value when used here</q> |
| <tt>-Wunneeded-internal-declaration</tt> | <q>%select{function|variable}0 %1 is not needed and will not be emitted</q> |
| <tt>-Wunneeded-internal-declaration</tt> | <q>'static' function %0 declared in header file should be declared 'static inline'</q> |
| <tt>-Wunneeded-member-function</tt> | <q>member function %0 is not needed and will not be emitted</q> |
| <tt>-Wunreachable-code</tt> | <q>will never be executed</q> |
| <tt>-Wunsequenced</tt> | <q>multiple unsequenced modifications to %0</q> |
| <tt>-Wunsequenced</tt> | <q>unsequenced modification and access to %0</q> |
| <tt>-Wunsupported-friend</tt> | <q>dependent nested name specifier '%0' for friend template declaration is not supported ignoring this friend declaration</q> |
| <tt>-Wunsupported-friend</tt> | <q>dependent nested name specifier '%0' for friend class declaration is not supported turning off access control for %1</q> |
| <tt>-Wunsupported-visibility</tt> | <q>target does not support 'protected' visibility using 'default'</q> |
| <tt>-Wunused-comparison</tt> | <q>%select{equality|inequality}0 comparison result unused</q> |
| <tt>-Wunused-const-variable</tt> | <q>unused variable %0</q> |
| <tt>-Wunused-exception-parameter</tt> | <q>unused exception parameter %0</q> |
| <tt>-Wunused-function</tt> | <q>unused function %0</q> |
| <tt>-Wunused-label</tt> | <q>unused label %0</q> |
| <tt>-Wunused-member-function</tt> | <q>unused member function %0</q> |
| <tt>-Wunused-parameter</tt> | <q>unused parameter %0</q> |
| <tt>-Wunused-private-field</tt> | <q>private field %0 is not used</q> |
| <tt>-Wunused-property-ivar</tt> | <q>ivar %0 which backs the property is not referenced in this property's accessor</q> |
| <tt>-Wunused-result</tt> | <q>ignoring return value of function declared with warn_unused_result attribute</q> |
| <tt>-Wunused-value</tt> | <q>ignoring return value of function declared with %0 attribute</q> |
| <tt>-Wunused-value</tt> | <q>expression result unused should this cast be to 'void'?</q> |
| <tt>-Wunused-value</tt> | <q>expression result unused</q> |
| <tt>-Wunused-variable</tt> | <q>unused variable %0</q> |
| <tt>-Wunused-volatile-lvalue</tt> | <q>expression result unused assign into a variable to force a volatile load</q> |
| <tt>-Wused-but-marked-unused</tt> | <q>%0 was marked unused but was used</q> |
| <tt>-Wuser-defined-literals</tt> | <q>user-defined literal suffixes not starting with '_' are reserved%select{ no literal will invoke this operator|}0</q> |
| <tt>-Wvarargs</tt> | <q>second parameter of 'va_start' not last named argument</q> |
| <tt>-Wvarargs</tt> | <q>'va_start' has undefined behavior with reference types</q> |
| <tt>-Wvarargs</tt> | <q>second argument to 'va_arg' is of promotable type %0 this va_arg has undefined behavior because arguments will be promoted to %1</q> |
| <tt>-Wvector-conversion</tt> | <q>incompatible vector types %select{%diff{assigning to $ from $|assigning to different types}0,1|%diff{passing $ to parameter of type $|passing to parameter of different type}0,1|%diff{returning $ from a function with result type $|returning from function with different return type}0,1|%diff{converting $ to type $|converting between types}0,1|%diff{initializing $ with an expression of type $|initializing with expression of different type}0,1|%diff{sending $ to parameter of type $|sending to parameter of different type}0,1|%diff{casting $ to type $|casting between types}0,1}2</q> |
| <tt>-Wvexing-parse</tt> | <q>parentheses were disambiguated as a function declaration</q> |
| <tt>-Wvexing-parse</tt> | <q>empty parentheses interpreted as a function declaration</q> |
| <tt>-Wvisibility</tt> | <q>declaration of %0 will not be visible outside of this function</q> |
| <tt>-Wvisibility</tt> | <q>redefinition of %0 will not be visible outside of this function</q> |
| <tt>-Wvla</tt> | <q>variable length array used</q> |
| <tt>-Wvla-extension</tt> | <q>variable length arrays are a C99 feature</q> |
| <tt>-Wweak-template-vtables</tt> | <q>explicit template instantiation %0 will emit a vtable in every translation unit</q> |
| <tt>-Wweak-vtables</tt> | <q>%0 has no out-of-line virtual method definitions; its vtable will be emitted in every translation unit</q> |

</section>

<section id="lex">

# Lexer Warnings

| Warning | Message |
| --- | --- |
| <tt>-W#pragma-messages</tt> | <q>%0</q> |
| <tt>-W#warnings</tt> | <q>%0</q> |
| <tt>-W#warnings</tt> | <q>%0</q> |
| <tt>-Wambiguous-macro</tt> | <q>ambiguous expansion of macro %0</q> |
| <tt>-Wauto-import</tt> | <q>treating #%select{include|import|include_next|__include_macros}0 as an import of module '%1'</q> |
| <tt>-Wbackslash-newline-escape</tt> | <q>backslash and newline separated by space</q> |
| <tt>-Wc++11-compat</tt> | <q>identifier after literal will be treated as a user-defined literal suffix in C++11</q> |
| <tt>-Wc++11-compat</tt> | <q>'%0' is a keyword in C++11</q> |
| <tt>-Wc++98-c++11-compat</tt> | <q>digit separators are incompatible with C++ standards before C++1y</q> |
| <tt>-Wc++98-c++11-compat-pedantic</tt> | <q>binary integer literals are incompatible with C++ standards before C++1y</q> |
| <tt>-Wc++98-compat</tt> | <q>raw string literals are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>unicode literals are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>universal character name referring to a control character is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>'::' is treated as digraph ':' (aka '[') followed by ':' in C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>using this character in an identifier is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>specifying character '%0' with a universal character name is incompatible with C++98</q> |
| <tt>-Wc++98-compat-pedantic</tt> | <q>variadic macros are incompatible with C++98</q> |
| <tt>-Wc++98-compat-pedantic</tt> | <q>#line number greater than 32767 is incompatible with C++98</q> |
| <tt>-Wc++98-compat-pedantic</tt> | <q>C++98 requires newline at end of file</q> |
| <tt>-Wc++98-compat-pedantic</tt> | <q>empty macro arguments are incompatible with C++98</q> |
| <tt>-Wc99-compat</tt> | <q>unicode literals are incompatible with C99</q> |
| <tt>-Wc99-compat</tt> | <q>%select{using this character in an identifier|starting an identifier with this character}0 is incompatible with C99</q> |
| <tt>-Wcomment</tt> | <q>'/*' within block comment</q> |
| <tt>-Wcomment</tt> | <q>escaped newline between */ characters at block comment end</q> |
| <tt>-Wdisabled-macro-expansion</tt> | <q>disabled expansion of recursive macro</q> |
| <tt>-Wheader-guard</tt> | <q>%0 is used as a header guard here, followed by #define of a different macro</q> |
| <tt>-Wignored-attributes</tt> | <q>unknown attribute '%0'</q> |
| <tt>-Wincomplete-module</tt> | <q>header '%0' is included in module '%1' but not listed in module map</q> |
| <tt>-Wincomplete-umbrella</tt> | <q>umbrella header for module '%0' does not include header '%1'</q> |
| <tt>-Winvalid-token-paste</tt> | <q>pasting formed '%0', an invalid preprocessing token, DefaultError</q> |
| <tt>-Wmalformed-warning-check</tt> | <q>__has_warning expected option name (e.g. \"-Wundef\")</q> |
| <tt>-Wnewline-eof</tt> | <q>no newline at end of file</q> |
| <tt>-Wnull-character</tt> | <q>null character ignored</q> |
| <tt>-Wnull-character</tt> | <q>null character(s) preserved in string literal</q> |
| <tt>-Wnull-character</tt> | <q>null character(s) preserved in character literal</q> |
| <tt>-Wtrigraphs</tt> | <q>ignored trigraph would end block comment</q> |
| <tt>-Wtrigraphs</tt> | <q>trigraph ignored</q> |
| <tt>-Wundef</tt> | <q>%0 is not defined, evaluates to 0</q> |
| <tt>-Wunicode</tt> | <q>universal character names are only valid in C99 or C++ treating as '\\' followed by identifier</q> |
| <tt>-Wunicode</tt> | <q>\\%0 used with no following hex digits treating as '\\' followed by identifier</q> |
| <tt>-Wunicode</tt> | <q>incomplete universal character name treating as '\\' followed by identifier</q> |
| <tt>-Wunicode</tt> | <q>universal character name refers to a surrogate character</q> |
| <tt>-Wunknown-pragmas</tt> | <q>unknown pragma ignored</q> |
| <tt>-Wunknown-pragmas</tt> | <q>pragma STDC FENV_ACCESS ON is not supported, ignoring pragma</q> |
| <tt>-Wunused-macros</tt> | <q>macro is not used</q> |

</section>


<section id="parse">

# Parser Warnings

| Warning | Message |
| --- | --- |
| <tt>-Warc-bridge-casts-disallowed-in-nonarc</tt> | <q>'%0' casts have no effect when not using ARC</q> |
| <tt>-Wattributes</tt> | <q>unknown __declspec attribute %0 ignored</q> |
| <tt>-Wavailability</tt> | <q>'unavailable' availability overrides all other availability information</q> |
| <tt>-Wc++11-compat</tt> | <q>use of right-shift operator ('') in template argument will require parentheses in C++11</q> |
| <tt>-Wc++11-compat</tt> | <q>'auto' storage class specifier is redundant and incompatible with C++11</q> |
| <tt>-Wc++98-c++11-compat</tt> | <q>'decltype(auto)' type specifier is incompatible with C++ standards before C++1y</q> |
| <tt>-Wc++98-compat</tt> | <q>range-based for loop is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>alias declarations are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>in-class initialization of non-static data members is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>defaulted function definitions are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>rvalue references are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>reference qualifiers on functions are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>inline namespaces are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>generalized initializer lists are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>trailing return types are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>enumeration types with a fixed underlying type are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>alignof expressions are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>'%0' keyword is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>'decltype' type specifier is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>deleted function definitions are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>consecutive right angle brackets are incompatible with C++98 (use '> >')</q> |
| <tt>-Wc++98-compat</tt> | <q>static_assert declarations are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>scoped enumerations are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>lambda expressions are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>attributes are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>'alignas' is incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>noexcept specifications are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>literal operators are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>noexcept expressions are incompatible with C++98</q> |
| <tt>-Wc++98-compat</tt> | <q>'nullptr' is incompatible with C++98</q> |
| <tt>-Wc++98-compat-pedantic</tt> | <q>extra '' outside of a function is incompatible with C++98</q> |
| <tt>-Wc++98-compat-pedantic</tt> | <q>extern templates are incompatible with C++98</q> |
| <tt>-Wc++98-compat-pedantic</tt> | <q>commas at the end of enumerator lists are incompatible with C++98</q> |
| <tt>-Wdangling-else</tt> | <q>add explicit braces to avoid dangling else</q> |
| <tt>-Wdeprecated</tt> | <q>Use of 'long' with '__vector' is deprecated</q> |
| <tt>-Wdeprecated-declarations</tt> | <q>use of C-style parameters in Objective-C method declarations is deprecated</q> |
| <tt>-Wdeprecated-register</tt> | <q>'register' storage class specifier is deprecated</q> |
| <tt>-Wduplicate-decl-specifier</tt> | <q>duplicate '%0' declaration specifier</q> |
| <tt>-Wextra-semi</tt> | <q>extra ';' after member function definition</q> |
| <tt>-Wextra-tokens</tt> | <q>"extra tokens at the end of '#pragma omp %0' are ignored</q> |
| <tt>-Wgcc-compat</tt> | <q>GCC does not allow %0 attribute in this position on a function definition</q> |
| <tt>-Wignored-attributes</tt> | <q>attribute %0 ignored, because it is not attached to a declaration</q> |
| <tt>-Wmicrosoft-exists</tt> | <q>dependent %select{__if_not_exists|__if_exists}0 declarations are ignored</q> |
| <tt>-Wmissing-selector-name</tt> | <q>%0 used as the name of the previous parameter rather than as part of the selector</q> |
| <tt>-Wsemicolon-before-method-body</tt> | <q>semicolon before method body is ignored</q> |
| <tt>-Wsource-uses-openmp</tt> | <q>"unexpected '#pragma omp ...' in program</q> |
| <tt>-Wstatic-inline-explicit-instantiation</tt> | <q>ignoring '%select{static|inline}0' keyword on explicit template instantiation</q> |

</section>
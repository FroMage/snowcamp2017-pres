import com.github.tombentley.deck {
    Slide,
    Transition,
    State,
    transitions
}
import ceylon.html {
    Img
}
{Slide|Transition*} part1 => [
    (State state) => State(0, 800),
    Slide{
        """## A quick tour of the language
           
           * I usually teach the language via demos, but
           * I've been told most of you will be C++ users, so
           * I've added slides to describe more of the language.
           * We can skip to an IDE for demos if you want more concrete examples.
        """
    },
    transitions.left,
    Slide{
        id="hello";
        """### `hello()`
           
           Let's start with hello world:
           
               shared void hello(String name) {
                   print("Hello ``name``");
               }
           
           * A function doesn't have to be in a class, it can be declared
             at the top level.
           * The `shared` annotation means the declaration is visible outside 
             its container (in this case outside the module).
           * `print` is a function from 
             the Ceylon language module (`ceylon.language`) that prints 
             to standard output.
           * Double backticks in a string literal is interpolation.
           """
    },
    Slide{
        id="hello-doc";
        """### Documentation
           
           Let's add docs:
           
               "This is _Markdown_ documentation"
               shared void hello(String name) {
                   print("Hello ``name``");
               }
           
           A string literal before a declaration is API documentation.
           
           Syntax sugar for the `doc` annotation:

               doc("This is _Markdown_ documentation")
               shared void hello(String name) {
                   print("Hello ``name``");
               }
           """
    },
    Slide{
        id="null";
        """### `String` means _I need a value_
           
           I can't do this:
           
               hello(null);// error
           
           * Ceylon is very particular about `null`.
           * `String` means "a string" and not
             "a string or null" (like it does in Java or C++).
           * In fact in Ceylon `null` has its own type, `Null`.
           * So I'm not allowed to pass `null` (or something 
             that might be null) to something that's 
             not expecting it: 
             It follows from the language assignability rules."""
    },
    Slide{
        id="null-safety";
        """### `String?`
           
           What if I wanted to permit `hello()` to take a `null` argument?
           
           I would have to declare it slightly differently:
           
               void hello(String? name) {
                   print("Hello ``name``");// error
               }
           
           The `String?` parameter type means "`String` or null".
           
           There's no longer an error at the callsite
           
               hello(null);// now allowed!
           
           But we've got that *new* error where we use `name`."""
    },
    Slide{
        id="if-exists";
        """### `if(exists ...)`
           
           * Since `name` has the type
             "`String` or null" it could be `null`.
           * We can branch 
             to distinguish the two 
             cases:
           
               void hello(String? name) {
                   if (exists name) {
                        print("Hello ``name``");
                   } else {
                        print("Hello world");
                   }
               }
           
           * The `if (exists ...)` construct is (type-narrowing) non-null check
           * Or I could say `if (is String name)`, a combined 
            typecheck-and-downcast in one."""
    },
    Slide{
        id="switch";
        """### `switch`
           
           Another way to do the same thing is using `switch`
           
               void hello(String? name) {
                   switch(name)
                   case (is String) {
                       print("Hello ``name``");
                   } else {
                       print("Hello world");
                   }
               }
           
           * The `case (is String)` is distinguishing the `String`
             case from the `Null` case.
           * There is no need for `break`: `case` never falls through.
           * `else` is like Java's `default`
           """
    },
    Slide{
        id="flow-typing";
        """### Flow typing
           
           * Outside the `if` or `case` the value `name` is a `String?`
           * But within the block guarded by the `if (exists ...)`
             or `case(is ...)` the compiler treats the 
             `name` value as having the narrower type `String`.
           
               // outside if block name has type String?
               // (so "Hello ``name``" is a compile error)
               if (exists name) {
                    // inside block name has type String
                    // (so "Hello ``name``" is allowed)
               }
           
           * This synergy of control flow and 
            type narrowing is called *flow typing*.
           """
    },
    Slide{
        id="flow-typing-assert";
        """### Assertions and flow typing
           
           If you know something has to exist, you don't need `if`
           
               void badlyTypedHello(String? name) {
                   assert(exists name);
                   // from then on, name has type String
                   print("Hello ``name``, how are you?");
               }
           """
    },
    Slide{
        id="union1";
        """### `?` was just sugar
        
           This `String?` type is just syntax sugar. It means
        
               String|Null
               
           (pronounced "string or null"). 
           
           * In a type `|` is an operator which means "or".
           * It lets us list a bunch of cases.
           
           We can use arbitrary other types with `|`.
           
               String|Integer|Boolean
           
           just means "`String` or `Integer` or `Boolean`". 
           
           * We can still use `if` or `switch` to distinguish the cases.
           * We call these types *union types*.
        """
    },
    Slide{
        """### `exists` was just sugar too!
           
           This `exists` operator is just syntax sugar. It means
           
               is Object x
           
           which checks if a value `x` of type `T` is of type `T & Object`.
           
           * In a type `&` is an operator which means "and".
           * It lets us list a bunch of cases that all have to
             be implemented.
           
           We can use arbitrary other types with `&`.
           
               Runnable & Destroyable
           
           just means "`Runnable` and `Destroyable`". 
           
           * We call these types *intersection types*.
           """
    },
    Slide{
        Img{src="type-hierarchy.svg"; width=500; style="float: right";},

        """### What does `String? & Object` mean?
           
           Let's decompose it to `<String | Null> & Object`.
           
           * Let's distribute the intersection:
             * `<String & Object> | <Null & Object>`
           * The top of the object hierarchy is `Anything`.
             * It has two disjoint subtypes: `Object` and `Null`.
           * `String` extends `Object`, so its intersection with
             `Object` is `String`:
             * `String | <Null & Object>`.
           * `Object` and `Null` are disjoint, so their intersection
             is `Nothing` (the bottom type which has no instance):
             * `String | Nothing`
           * So the result is just `String`.
           """
    },
    Slide{
        id="defaulted-parameters";
        """### Defaulted parameters
           
           What if we want to be able to call `hello`
           without passing an argument? 
           
           Ceylon doesn't 
           have method overloading like Java does. 
           But we *can* give parameters a default value.
           
               void hello(String name = "world") {
                    print("Hello ``name``");
                }
           
           then we can call it like this:
           
               // call site
               hello();
               hello("Tom");
           """
    },
    Slide{
        id="hof";
        """### Abstrating away `print()`
        
           `hello()` is nice, but it hard-codes the fact that 
           we're writing to standard output (by using `print`). 
           
           I now 
           want to abstract away where we're sending the 
           greeting."""
    }
];

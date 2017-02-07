import com.github.tombentley.deck {
    Slide,
    Transition,
    State,
    transitions
}
{Slide|Transition*} part1 => [
    (State state) => State(0, 800),
    Slide{
        """## A lightning tour of the language
           
           * Enough of the language to understand the demos.
           * 15 minutes (or so).
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
        id="null";
        """### `String` means 'string'
           
           I can't do this:
           
               hello(null);// error
           
           * Ceylon is very particular about `null`.
           * `String` means "a string" and not
             "a string or null" (like it does in Java).
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
        id="defaulted-parameters";
        """### Defaulted parameters
           
           What if we want to be able to call `hello`
           without passing an argument? 
           
           Ceylon doesn't 
           have method overloading like Java does. 
           But we *can* give parameters a default value.
           
               void hello(String name="world") {
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
    },
    Slide{
        id="hof2";
        """### Types of functions
        
           * I don't need an interface to do this. 
           * All I need is something that consumes `String`s.
           * Any function that takes a single `String` 
             parameter will do.
           
           The type of such a function is
           
               Anything(String)
           
           (`Anything` because I don't care what the 
           function returns).
           
           This is an example of the `Callable` type."""
    },
    Slide{
        id="hof3";
        """### Callables & function references
        
           Let's add a parameter for that:
           
               void hello(String name, 
                          Anything(String) emit) {
                   emit("Hello ``name``");
               }
           
           I invoke the function `emit` by adding an argument list.
           At a call site I have to pass a function:
        
               hello("Tom", print);
                
           `print` (without parentheses) is just a reference to the 
           `print()` function."""
    },
    Slide{
        id="hof4";
        """### Function parameters
           
           Alternatively instead of declaring `emit` as a
           `Callable`-type value parameter,
           I can declare `emit` as a function parameter:
           
               void hello(String name, 
                          void emit(String str)) {
                   emit("Hello ``name``");
               }
           
           It means (almost) exactly the same thing.
        """
    },
    Slide{
        id="hof5";
        """### Function references
           
           With this abstraction I can print to a file, or a 
           socket or whatever:
           
               hello("Tom", fileWriter.write);
               hello("Tom", socket.write);
               hello("Tom", stringBuilder.append);
               // etc.
        """
    },
    Slide{
        id="iterable";
        """### Iteration
           
           What if I want to greet several people? 
           
           I need `names` rather than a single `name`, and I need to 
           be able to iterate it:
           
               void helloAll(void emit(String str), 
                             {String*} names) {
                   for (name in names) {
                       emit("Hello ``name``\n");
                   }
               }
           
           * `{String*}` means "`Iterable` of zero or more `String`s".
           * (There's also `{String+}`
             meaning "`Iterable` of one or more `String`s").
        """
    },
    Slide{
        id="inference";
        """### Look, no types!
               
           Note that I didn't need to explicitly declare the type of
           `name` in that `for` statement.
           
               for (name in names) {
           
           The compiler looks on the right hand side (at `names`), sees an 
           `Iterable<String>` so infers that `name` must be a `String`."""
    },
    Slide{
        id="inference2";
        """### Type inference
           
           In fact the compiler can figure out the type of 
           a declaration from an expression for local 
           values and functions too:
           
               // compiler knows greeting is a String
               value greeting = "Hello ";
           
           * We can usually use the `value` (or `function`) 
             keyword where we  would have to write a type.
           * The compiler always chooses the single 
             most specific type (by looking at the assigned expression).
           * This is called *type inference*.
           
             """
    },
    Slide{
        id="iterable-literals";
        """### Iterable literals
           
           * How might I call `helloAll()`? 
           * I need an iterable.
           * I can use an *iterable literal*:
           
               value names = {"Tom", "Dick", "Harry"};
               helloAll(names);
           
           * The type of `names` is `{String+}` ("`Iterable` of one or more `String`s").
           * `Iterable` literals are *lazily evaluated*.
           """
    },
    Slide{
        id="tuple-literals";
        """###  Tuple literals
           
           Alternatively I could use a `Tuple` to call `helloAll()`
           (`Tuple` inherits `Iterable`):
           
               value names = ["Tom", "Dick", "Harry"];
               helloAll(names);
               
           * The type of `names` is `String[3]` (which means `[String, String, String]`).
           * A `Tuple` knows the type of each of its elements (so I can have
           `[String, Integer, Boolean]` for example).
           * A `[String, Integer, Boolean]` is a `{String|Integer|Boolean+}`
        """
    },
    Slide{
        id="comprehension";
        """### Comprehension
           
           A comprehension lets me create an iterable or tuple by filtering, 
           mapping and combining other iterables.
           
               void greetDogOwners({Animal*} pets) {
                   helloAll({for (pet in pets)
                               if (is Dog pet) 
                                 pet.owner});
               }
           
           * Rather than listing elements in the iterable or tuple literal I use `for` within the brackets,
           * the `if` filters out the non-`Dog`s,
           * then I get the `Dog`'s `owner`.
           * In general, I can combine `for` and `if` arbitrarily.
           * Easier to read that `map()`, `filter()` etc.
           """
    },
    Slide{
        id="class";
        """### A class
           
           Let's use a class to say more than just "hello":
           
               class Greeter(void emit(String str)) {
                   value greeting = "Hello";
                   value parting = "Cheerio";
                   shared void hello(String name) {
                       emit("``greeting`` ``name``");
                   }
                   shared void bye(String name) { /* ... */ }
                   }
               }
           
           * The class has its own parameter list. 
           * I can use `emit` because it is in an outer scope of `hello`.
           * As before, `shared` allows the methods to be visible outside their container
            (`Greeter` in this case).
        """
    },
    Slide{
        id="";
        """### Instantiation and invocation
        
           I instantiate the class just by invoking it 
           (no need for `new`). 
           
           I can do that with positional arguments:
            
               Greeter(print);
           
           Or I can invoke with *named arguments*:
           
               Greeter{
                   emit=print;
               };
           
           Note: each name binding ends with a `;`."""
    },
    Slide{
        id="named-arguments";
        """### Named arguments
           
           With named argument invocation there's some flexibility 
           in how I pass `Iterable` arguments. 
           I can pass them by name:
        
               helloAll{
                   names=["Tom", "Dick", "Harry"];
               };
           
           Or if there is a single unspecified `Iterable` parameter
           I can list them:
        
               helloAll{
                   "Tom", "Dick", "Harry"
               };
        """
    },
    Slide {
        id="enough";
        """### Just enough
           
           We've covered enough of the language that you should be able 
           to understand *most* of the code you're going to see.
           
           If you want to know more about the language, check out 
           the 'Tour of Ceylon' ([http://ceylon-lang.org/documentation/current/tour](http://ceylon-lang.org/documentation/current/tour/))
           
           We are now 
           going to see some real Ceylon code, using Eclipse, 
           IntelliJ and the CLI tools.
           """
    }
];

import com.github.tombentley.deck {
    Slide,
    Transition,
    State,
    transitions
}
{Slide|Transition*} part3 => [
    (State state) => State(0, 2400),
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
    transitions.left,
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
               helloAll(print, names);
           
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
               helloAll(print, names);
               
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
                   helloAll(print, {for (pet in pets)
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
                   emit = print;
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
                   emit  = print;
                   names = ["Tom", "Dick", "Harry"];
               };
           
           Or if there is a single unspecified `Iterable` parameter
           I can list them:
        
               helloAll{
                   emit = print,
                   "Tom", "Dick", "Harry"
               };
        """
    },
    Slide{
        """### More about functions

           We also have: 
           
           * Reified generics
           
               interface Iterable<Element> {
                   Iterable<Element&Type> narrow<Type>()
                      => {for(elem in this) if(is Type elem) elem};
           
           * Even Type Functions in beta.
             * The type of a generic lambda, for example.           
           """
    }
];

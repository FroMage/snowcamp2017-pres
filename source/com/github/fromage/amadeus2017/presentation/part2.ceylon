import com.github.tombentley.deck {
    Slide,
    Transition,
    State,
    transitions
}
{Slide|Transition*} part2 => [
    (State state) => State(0, 1600),
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
           
           This is an example of the `Callable` type: `Callable<Anything,[String]>`."""
    },
    transitions.left,
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
               
           Or with a lambda, of course:
           
               hello("Tom", (x) => print("[log] +"x));
        """
    },
    Slide{
        """### Functions and subtyping 1/3
           
           Hold on, I've been passing `print`:
           
               shared void print(Anything val){...} 
            
           Which is of type `Anything(Anything)`, to
           a functional parameter of type `Anything(String)`…
           
           This follows standard subtyping in Ceylon, which has declaration-site
           covariance and contravariance.
           """
    },
    Slide{
        """### Variance
           
           In Java, we have use-site variance:
           
               class Animal {}
               class Dog extends Animal{}
               class Cat extends Animal{}
               
               List<Dog> dogs = Arrays.asList(new Dog());
               List<Animal> animals = dogs; // ERROR: List is invariant
               // Covariance: anyAnimal contains subtypes of Animal
               List<? extends Animal> anyAnimal = dogs;
               // Contravariance: anyDogSupertype contains supertypes of Dog
               List<? super Dog> anyDogSupertype = animals;
           
           This uses _wildcards_ and _wildcard capture_, which are hard to understand
           and bug prone as well as verbose.           
           """
    },
    Slide{
        """### Declaration-site variance
           
           In Ceylon, we use `in` for contravariance, `out` for covariance:
           
               shared interface Correspondence<in Key, out Item = Anything>
                  given Key satisfies Object {
                   shared formal Item? get(Key key);
               }
               
               Correspondence<Animal, Animal> animalsMap = map { dog -> cat };
               
               // narrow the key, widen the item
               Correspondence<Cat, Object> catMap = animalsMap;
               Object? obj1 = catMap.get(cat); // will be null, but valid

               // widen the key, narrow the item
               Correspondence<Object, Cat> bogusMap = animalsMap; // ERROR
           
           Ceylon supports both declaration-site and use-site variance (for interop).           
           """
    },
    Slide{
        """### Functions and subtyping 2/3
           
               shared native interface Callable<out Return, in Arguments> 
                   given Arguments satisfies Anything[] {}
           
           Roughly speaking, the `Callable` type is a subtype of another:  
           
           * If it returns a narrower type.
             * For example, returning a `String` is also an `Object`.
           * And/or if it takes a broader set of parameter types.
             * If it accepts `Anything`, we can pass it a `String`.
           
           For example, `print`'s `Anything(Anything)`
           is assignable to `Anything(String)`, because subtyping says so, thanks to variance
           and union types.
           """
    },
    Slide{
        """### Functions and subtyping 3/3
           
           What is the type of a function with optional parameters?
           
               String f(Integer i = 2) => "Your int: "+i;
           
           Its type is `String(Integer=)` which means “Takes an int or no arg”.
           
           It's sugar for `Callable<String, [] | [Integer]>`.
           
           It is also assignable to `Object()`, because it always returns an `Object`
           and is fine with taking no parameters (thanks variance!).
           """
    }
];

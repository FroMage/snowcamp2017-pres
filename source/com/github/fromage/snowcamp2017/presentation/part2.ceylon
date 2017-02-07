import ceylon.html {
    P,
    A
}

import com.github.tombentley.deck {
    Slide,
    Transition,
    State,
    transitions
}

{Slide|Transition*} part2 = [
    (State state) => State(0, 1600),
    Slide{
        id="part-2";
        """## A microservice using `ceylon.http.server` 
           
           * Demo in Eclipse
        """
    },
    transitions.left,
    Slide{
        id="number-api";
        """### A number service
           
           * We're going to look at a very simple microservice for exposing 
             a random number generator.
           
           *  Clients will make `GET` requests to
            
           ```plain
           http://localhost:8081/numbers/number?min={min}&max={max}
           ```
           
           * They will receive a response containing a random integer
             between `min` and `max` (inclusive).
        """
        
     },
     Slide {
         """### Implementation
            
            * We're going to use `ceylon.http.server`, part of the Ceylon SDK
            * `ceylon.http.server` uses undertow and xnio (from the JBoss 
              project) under the covers
            * So we benefit from all their engineering efforts "for free"
            """
     },
     Slide {"### Demo"},
     Slide{
         """### Critique
            
            Criticisms of the number service:
            
             * The `ceylon.http.server` API is quite low level, 
               (e.g. had to write convenience method for getting parameters)
             * But the requirements are simple enough that the solution doesn't 
               need to be complex.
             * It works!
             """
     }
];
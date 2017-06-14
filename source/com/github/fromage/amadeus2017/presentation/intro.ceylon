import ceylon.html {
    H2,
    H3
}

import com.github.tombentley.deck {
    Slide,
    transitions,
    Transition,
    State
}

{Slide|Transition*} intro => {
    (State state) => State(0, 0, 0),
    Slide{
        id="title";
        H2{"Introduction to Ceylon: a modern language with modern tooling"},
        H3{"Stéphane Épardaud"},
        H3{"Global Technical Forum, Amadeus, 2017"}
        
    },
    transitions.left,
    Slide{
        id="plan";
        """### The menu for today
           
           * Ceylon language primer
           * Demos (if we have time)
           * Questions
           """
    },
    Slide{
        """### What is Ceylon?
           
           * Modern programming language
           * Based on Java / C#
           * Targets JVM, JavaScript
           * Much boilerplate removed
           * Simpler Functional Programming
           * New type system
           * Modules from the start
           * No-compromise features
           * Great interop (JVM, JavaScript)
           * Runs on mobile (Android, iOS)
           * Modern tooling
           """
    }
};

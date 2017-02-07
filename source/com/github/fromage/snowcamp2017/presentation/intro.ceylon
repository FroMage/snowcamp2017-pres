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
        H2{"Ceylon 1.3 dans tous ses états"},
        H3{"Stéphane Épardaud"},
        H3{"SnowCamp, Grenoble, 2017"}
        
    },
    transitions.left,
    Slide{
        id="ceylon-is";
        """### What is Ceylon?
           
           Ceylon...
           
           * is a modern, type-safe programming language which runs on 
             Java and JavaScript virtual machines,
           * is also a platform coming with its own modular SDK,
           * is supported by discoverable CLI tools,
           * has a mature Eclipse IDE,
           * has an awesome new IntelliJ IDE,
           * is well-suited to developing microservices, and
           * is Android-enabled
           """
    }
};

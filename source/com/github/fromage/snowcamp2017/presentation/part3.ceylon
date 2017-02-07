import com.github.tombentley.deck {
    Slide,
    Transition,
    State,
    transitions
}
import ceylon.html {
    ...
}

{Slide|Transition*} part3 = [
    (State state) => State(0, 2400),
    Slide{
        id="part-3";
        """## Two microservices using Vert.x 
           
           * Demo on the command line"""
    },
    transitions.left,
    Slide{
        id="adjectives";
        """### An adjective server
           
           We're going to see a microservice which returns adjectives
           (e.g. "awesome") 
           or adverbs (e.g. "awesomly") chosen randomly from a 
           hardcoded list.
           
           It will be a client of the random number service.
           
           Using the Vert.x core
           API instead of `ceylon.http.server`."""
    },
    Slide{
        id="what-is-vertx";
        """### What is Vert.x?
        
           [Vert.x](http://vertx.io)
           is a toolkit for building *reactive* applications on the JVM.
           
           * Polyglot (Ceylon plus some niche languages: Java, JavaSript, Ruby & Groovy)
           * Modular building blocks, not an app server
           * Event driven
           * Using multiple event loops to dispatch events
           * Non-blocking
           * Therefore our handlers shouldn't block the event loop
        """
    },
    // Architecture slide
    // cut to vertx demo
    Slide{"### Demo"},
    Slide{
        """### Critique of Vert.x core""",
        Ul{
            Li{"""Using the Vert.x core API is still quite low-level. 
                  It doesn't do any of the following:""",
                Ul{
                    Li{"Routing & path matching"},
                    Li{"Cookies, sessions"},
                    Li{"Forms & uploads"},
                    Li{"Authentication & Authorization"},
                    Li{"etc..."}
               }
           },
           Li{"the callback-based programming model won't suit everyone."},
           Li{"On the other hand, it reactive, non-blocking should scale well"}
       }
    },
    Slide{
        id="verbs";
        """### A verb server
           
           We're going to write a microservice which returns verbs chosen 
           randomly from a hardcoded list.
           
           It will also be a client of the random number service.
           
           We'll do this using Vert.x web, which is a higher level API built 
           on top of Vert.x core."""
    },
    Slide {"### Demo"},
    Slide{"""### Critique of Vert.x web
             
             * Lots more features to play with 
               (e.g. routing, authentication, uploads etc), and
             * a serialization library made life simpler"""}

];
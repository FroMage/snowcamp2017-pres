import com.github.tombentley.deck {
    Slide,
    Transition,
    State,
    transitions
}

{Slide|Transition*} part4 = [
    (State state) => State(0, 3200),
    Slide{
        id="part-4";
        """## A microservice using gyokuro 
           
           * Demo in IntelliJ"""
    },
    transitions.left,
    Slide {
        """### A Rendering Service
           
           We're going to look at another (final, phew!) microservice
           which renders templates by inserting verbs and adjectives, 
           returning a list of phrases/sentences.
           
           It will be a client of all three other services.
        """},
    Slide{
        """### Implemented using gyokuro
           
           * The service will be implemented using [gyokuro](http://bjansen.github.io/gyokuro/)
             (`com.github.bjansen.gyokuro.core`) 
           * Gyokuro is built on top  of `ceylon.http.server`
        """
    },
    Slide {
        """### A Confession
           
           So how is this 
           
           > The most incredible Ceylon presentation you'll ever see?
           
           Well, it could equally be
           
           > I went to a presentation about Ceylon: you'll never guess 
           > what happened next...
           
           Or
           
           > How coding in Ceylon will make you better in bed
           
           Because **we're building a click bait generator here**.
           
           <small>
           So if you really were expecting to see the most incredible 
           Ceylon presentation ever, well, sorry!
           </small>
        """
    },
    Slide {
        """### Demo"""
    },
    Slide{
        """### Critique of gyokuro
           
           * More traditional, Java-like, annotation-based approach
           * Framework supports 'transformers' (for serialization OOTB)
           * And support for popular templating libraries
        """
    }
];

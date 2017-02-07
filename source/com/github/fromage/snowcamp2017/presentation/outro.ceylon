import ceylon.html {
    Img,
    H3
}
import com.github.tombentley.deck {
    Slide,
    State,
    Transition,
    transitions
}
{Slide|Transition*} outro => {
    (State state) => State(0, 4800),
    Slide {
        """### What haven't we seen?
           
           There's **loads** of stuff I've not had time to talk about. 
           Including (but not limited to): Ceylon JS 
           to leverage Cordova for mobile development,
           the module system, the Herd,
           the metamodel,
           serialization,
           Using Maven and NPM repositories,
           interop with Java/JEE,
           Ceylon Dart, TypeScript...
           
           If you're interested then check out
           
           * [http://ceylon-lang.org](http://ceylon-lang.org)
           * [https://gitter.im/ceylon/user](https://gitter.im/ceylon/user)
           * [https://groups.google.com/group/ceylon-users](https://groups.google.com/group/ceylon-users)
           """
    },
    transitions.left,
    
    Slide{
        id="1.3";
        """### Ceylon 1.3
           
           * These demos have been based on Ceylon 1.3.
           * Ceylon 1.3 should be out "next week"
           * So too will new versions of the Eclipse IDE
           * And the IntelliJ plugin
           """,
        """
           Please tell us what you think!
           
           * [http://ceylon-lang.org](http://ceylon-lang.org)
           * [https://gitter.im/ceylon/user](https://gitter.im/ceylon/user)
           * [https://groups.google.com/group/ceylon-users](https://groups.google.com/group/ceylon-users)
           """
    },
    (State state) => state.translate { ẟx = -1500; ẟy = -2400; ẟz = 7000; }.rotate(0, -35, 0),
    Slide{
        id="overview";
    }
};
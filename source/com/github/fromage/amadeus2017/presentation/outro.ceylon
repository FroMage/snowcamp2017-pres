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
    (State state) => State(0, 4000),
    Slide{
        id="1.3.2";
        """### Ceylon 1.3.2 (1.3.x)
           
           * Released March 2017
           * IntelliJ, Android
           * NPM modules interop
           * Services API
           * fat-jar, swarm
           * Slimmer run-time
           * APT processors
           * Java 8 lambdas interop
           * Maven plugin enhancements
           """
    },
    transitions.left,
    Slide{
        id="1.3.x";
        """### Future releases
           
           * Move to Eclipse Foundation
           * Co-routines, async/await
           * Finish TypeScript interop
           * Finish Type Functions support
           * <insert your wish here>
           """
    },
    Slide {
        """### What now?
           
           Much more functionality than I could show…
           
           Check out our site with awesome getting started guide and try the language online.
           
           * [http://ceylon-lang.org](http://ceylon-lang.org)
           * [https://herd.ceylon-lang.org](https://herd.ceylon-lang.org)
           * [https://gitter.im/ceylon/user](https://gitter.im/ceylon/user)
           * [https://groups.google.com/group/ceylon-users](https://groups.google.com/group/ceylon-users)
           """
    },
    (State state) => state.translate { ẟx = -2400; ẟy = -1400; ẟz = 5000; }.rotate(0, -35, 0),
    Slide{
        id="overview";
    }
};
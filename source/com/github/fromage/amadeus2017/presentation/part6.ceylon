import com.github.tombentley.deck {
    Transition,
    Slide,
    State,
    transitions
}
import ceylon.html {
    Img,
    H3
}

{Slide|Transition*} part6 = [
    (State state) => State(0, 2400),
    Slide{
        id="part-6";
        """## Environements
           
           * JBoss Modules
           * Flat classpath
           * Java 9
           * Fat jar
           """
    },
    transitions.left,
    Slide{
        id="part-6b";
        """## Conteneurs
           
           * WildFly
           * WildFly Swarm
           * Spring Boot
           * Spark Framework
           * OSGi / Karaf
           """
    }
];
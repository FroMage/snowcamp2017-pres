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
    (State state) => State(0, 2400),
    Slide{
        id="1.3";
        """### Ceylon 1.3
           
           * Sorti en septembre 2016
           * IntelliJ
           * Android
           * Interop avec modules NPM
           * API de Services
           * fat-jar, swarm
           * Runtime à la diète
           * Processeurs APT
           """
    },
    transitions.left,
    Slide{
        id="1.3.1";
        """### Ceylon 1.3.1
           
           * Sorti en novembre 2016
           * Interop avec les lambdas Java 8
           * Interop avec Spring Boot, Hibernate, RESTEasy, JAXB, JAX-RS,
             Weld, Guice
           * OSGi : Equinox, Karaf, Felix
           * Spark, RxJava, JOGL
           """
    },
    Slide {
        """### Et puis quoi encore ?
           
           Beaucoup d’autres fonctionalités dans Ceylon : types, SDK, JavaScript,
           fonctions…
           
           Ceylon 1.3.2 (encore plus d’interop avec Maven et Maven Central) en février.
           
           * [http://ceylon-lang.org](http://ceylon-lang.org)
           * [https://gitter.im/ceylon/user](https://gitter.im/ceylon/user)
           * [https://groups.google.com/group/ceylon-users](https://groups.google.com/group/ceylon-users)
           """
    },
    (State state) => state.translate { ẟx = -2400; ẟy = -1400; ẟz = 5000; }.rotate(0, -35, 0),
    Slide{
        id="overview";
    }
};
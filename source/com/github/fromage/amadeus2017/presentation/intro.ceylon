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
        id="plan";
        """### Bien sûr que j’ai un plan…
           
           * très peu de slides
           * pas mal de démos
             * certaines piquées à Tom Bentley
             * enfin, adaptées
             * mais pas seulement…
           * et puis un poil de slides ensuite
           * pour la fin
           """
    },
    Slide{
        id="tourne";
        """### Et pourtant, ça tourne !
           
           Ceylon ça tourne
           
           * sur la JVM, sur JavaScript
           * sur JBoss Modules, OSGi, Java 9, classpath, Maven, Gradle
           * sur Vert.x, Gyokuro, WildFly, Swarm, SpringBoot, Spark Framework
           * sur Android, iOS
           * sur Eclipse, IntelliJ, Android Studio, VSCode, Vim
           * sur la ligne de commande
           * sur OpenShift
           """
    }
};

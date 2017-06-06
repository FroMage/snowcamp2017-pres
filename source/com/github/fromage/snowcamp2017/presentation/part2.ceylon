import ceylon.html {
    P,
    A,
    Img
}

import com.github.tombentley.deck {
    Slide,
    Transition,
    State,
    transitions
}

{Slide|Transition*} part2 = [
    (State state) => State(0, 800),
    Slide{
        id="part-2";
        """## Un microservice de nombre aléatoire avec `ceylon.http.server` 
           
           ```plain
           http://localhost:8081/numbers/number?min={min}&max={max}
           ```

           * Demo dans Eclipse
        """
    },
    transitions.left,
    Slide{
        id="part-3";
        """## Deux microservices pour servir des adjectifs et verbes avec Vert.x 
           
           ```plain
           http://localhost:8082/adjective/adjective
           http://localhost:8082/adjective/adverb
           
           http://localhost:8083/verb
           ```
           
           * Demo dans Eclipse
           """
    },
    Slide{
        id="part-4";
        """## Un microservice de générateur click-bait dans gyokuro""",
        Img{src="architecture.svg"; width=780;},
        """
           * Demo dans Eclipse
           """
    },
    Slide{
        id="part-5";
        """## Application Android
           
           * Demo dans Android Studio
           """
    },
    Slide{
        id="part-5b";
        """## Application iOS
           
           * Avec Cordova
           * Demo sur la maudite machine grise
           """
    }
];
import ceylon.html {
    Code,
    Pre
}

import com.github.tombentley.deck {
    Presentation,
    write
}

"Put the given string inside <pre><code>"
Pre code(String text)
        => Pre{clazz="code ceylon";
    Code {
        attributes=["data-language"->"ceylon"];
        text
    }
};

"The presentation"
Presentation presentation =>
    Presentation { 
        title = "Ceylon 1.3 dans tous ses états";
        description = "Depuis la sortie de Ceylon 1.3, Ceylon marche sur quasi tous les environements. 
                       Lors de cette conférence nous vous montrerons comment faire tourner Ceylon 
                       sur un maximum de plate-formes : Vert.x, WildFly, WildFly Swarm, Android, 
                       iPhone, Spring Boot, OSGi, fat-jar et JBoss Modules. Un max de démos, un minimum de bla-bla !"; 
        author = "Stéphane Épardaud"; 
        slides = intro.chain(part1).chain(part2).chain(part3).chain(part4).chain(part5).chain(outro); 
    };

"Generate the presentation as HTML"
shared void run() {
    //serve(presentation);
    write(presentation);
}

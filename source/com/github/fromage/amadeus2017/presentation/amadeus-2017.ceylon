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
        title = "Introduction to Ceylon: a modern language with modern tooling";
        description = "Ceylon is a modern programming language that takes the best of the Java language
                       and adds all you need to efficiently write modern applications: a module system, 
                       a new, more expressive and flexible type system, much reduced boilerplate, 
                       functional programming, great tooling and support for a vast number of deployment 
                       and interoperation with both the JVM (Maven, Jigsaw, OSGi…) world and the JavaScript world (NPM…).

                       In this presentation we will discover Ceylon, some of its unique features and what its strenghts are."; 
        author = "Stéphane Épardaud"; 
        slides = expand{ intro, part1, part2, part3, part4, outro};
    };

"Generate the presentation as HTML"
shared void run() {
    //serve(presentation);
    write(presentation);
}

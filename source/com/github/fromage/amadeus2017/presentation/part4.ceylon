import com.github.tombentley.deck {
    Slide,
    Transition,
    State,
    transitions
}
{Slide|Transition*} part4 => [
    (State state) => State(0, 3200),
    Slide{
        """### Modularity
           
           In Ceylon, everything is a module. If you don't declare one,
           you're in the _default_ module.
           
           The `ceylon.language` module is the only requirement. The rest
           is in a modular SDK, like `ceylon.collection` or `ceylon.io`.
           
           Every tool understands modules, and know how to fetch dependencies,
           and publish new modules. IDEs and CLI will auto-complete modules
           and generally help you.
           
               module com.example "1.0" {
                   import ceylon.collection "1.3.2";
                   import ceylon.json "1.3.2";
                   // Maven modules
                   import maven:org.junit:junit "4.2";
                   // JDK
                   import java.base "8";
               }
           
           This means in many cases you don't need a build tool!
           """
    },
    transitions.left,
    Slide{
        """### Interoperability
           
           Ceylon is fully interoperable with its backends: JVM, JavaScript,
           and experimentally, Dart.
           
           On JVM:
           
           * JDK, Maven, OSGi, JBoss modules. 
           * Ant, Maven, Gradle plugins.
           * Runs on JVM, Java 9, WildFly, Swarm, Spring Boot, OpenShift…
           * Android.
           
           On JavaScript:
           
           * NPM, require.js modules.
           * Runs in browsers, node.js.
           * iOS (via Cordova)
           """
    },
    Slide{
        """### Metaprogramming
           
           Metaprogramming allows you to introspect your Ceylon program:
           
           * list of modules, or a particular one
           * list of packages for a module
           * list of declarations for a package
           * for example, find all functions annotated with `deploy`
           
           Example: this is how we deploy verticles in a list of packages:
           
               deploy(`package`, `package com.example.main`, `package com.example.others`);           
           """
    },
    Slide{
        """### Tooling
           
           Ceylon has two full-featured IDE plugins for Eclipse and IntelliJ.
           
           Support for Android Studio. Also seen modes for Emacs and Vim, prototypes
           for VisualStudio Code.
           
           Great CLI based on Git's CLI, with plugins, auto-completion.
           
               $ ceylon compile, run 
           
           Herd module repository to make module publishing easy.
           """
    }
];

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

{Slide|Transition*} part5 = [
    (State state) => State(0, 4000),
    Slide{
        id="part-5";
        """## An Android app 
           
           * Demo in Android Studio
           * Ceylon supports Android development from Ceylon 1.3.
           """
    },
    transitions.left,
    Slide{
        """### Aside: Cordova
           
           * It's possible to develop 
             mobile applications using Apache Cordova and
             Ceylon JS,
           * Like any Cordova-based app, that would let you target
             iOS and WindowsPhone as well as Android
           * But let's focus on *native Android*..."""
    },
    Slide{
        """### Native Android Development
           
           How do you develop for Android using Ceylon?
           
           * You install the Ceylon plugin into Android Studio,
           * it intregrates via a gradle plugin into the build 
             used by Android Studio
           * and transparently packages the Ceylon runtime and all your 
             module's transitive dependencies into your app. 
           * The ceylon metamodel is supported statically, 
             (avoiding lots of reflection) and it initialized at runtime.
           """
    },
    Slide {"### Demo"},
    Slide {
        id="architecture";
        H3{"What have we seen again?"},
        Img{src="architecture.svg"; width=780;},
        """... using Eclipse, IntelliJ, Android Studio, the CLI"""
    },
    Slide {
        """### Future plans for Android development
           
           In the next version of Ceylon we aim to improve Android interop:
           
           * SAM-type conversion,
           * CharSequence conversion,
           * maybe even some kind of DSL of the Android SDK"""
    }
    /*
     that it comes with 1.3.0, that it runs natively (though you can still use cordova), 
     is supported in the intellij ceylon ide, that it uses a gradle plugin (though it's pretty obvious for anyone running android) 
     and that the next version of ceylon will feature even more 
     support for android by making it easier to interop with it
     things like SAM/CharSequence conversion, or auto-DSL of the Android SDK
     
     */
];
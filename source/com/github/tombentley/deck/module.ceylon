"Generates a HTML presentation (\"slide deck\") using `impress.js`. 
 The presentation is specified as a sequence of [[Slide]]s and 
 3D transitions between them 
 (this frees the user from having to care about exactly where in 3D space 
 each slide is).
 
 The presentation gets rendered as HTML and can either be served over a
 HTTP [[server|serve]] or [[dumped|render]] as `.html` files."
native("jvm")
module com.github.tombentley.deck "1.0.0" {
    import ceylon.collection "1.3.1";
    shared import ceylon.html "1.3.1";
    import ceylon.http.common "1.3.1";
    import ceylon.http.server "1.3.1";
    //TODO support slides in markdown
    import ceylon.markdown.core "1.0.0";
    import ceylon.markdown.html "1.0.0";
    import java.base "8";
}

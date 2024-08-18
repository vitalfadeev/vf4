module gl;

//version (GLES2)
import gl.opengl.gles2;
//version (XCB)
//import gl.xcb;

struct 
GL {
    _GL _gl;

    this (bool _) {
        _gl._init ();
    }

    struct 
    Point {
        X x;
        Y y;

        alias GL_TYPE        = GL_FLOAT;
        alias GL_SHOULD_NORM = GL_FALSE;
    }

    alias X     = float; // GLflost
    alias Y     = float; // GLflost
    alias W     = float; // GLflost
    alias H     = float; // GLflost
    alias Index = uint;  // GLuint
    alias Count = uint;  // GLsize
    alias Enum  = uint;  // GLenum

    enum Enum POINTS         = GL_POINTS;
    enum Enum LINES          = GL_LINES;
    enum Enum LINE_STRIP     = GL_LINE_STRIP;
    enum Enum LINE_LOOP      = GL_LINE_LOOP;
    enum Enum TRIANGLES      = GL_TRIANGLES;
    enum Enum TRIANGLE_STRIP = GL_TRIANGLE_STRIP;
    enum Enum TRIANGLE_FAN   = GL_TRIANGLE_FAN;

    enum Mode : Enum {
        POINTS         = GL_POINTS,
        LINES          = GL_LINES,
        LINE_STRIP     = GL_LINE_STRIP,
        LINE_LOOP      = GL_LINE_LOOP,
        TRIANGLES      = GL_TRIANGLES,
        TRIANGLE_STRIP = GL_TRIANGLE_STRIP,
        TRIANGLE_FAN   = GL_TRIANGLE_FAN,
    }

    alias draw_image = _gl.draw_image;
    //void
    //draw_image (Image* image, Size size, Pos pos) {
    //    _gl.draw_image (image,size,pos);
    //}
}

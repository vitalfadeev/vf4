module output.xcb;

import std.stdio : writeln,writefln;
alias log = writeln;
import xcb.xcb;
import glx.glx      : GLXDrawable,glXSwapBuffers;
import x11.Xlib     : Display,XOpenDisplay,DefaultScreen,True;
import x11.Xlib_xcb : XSetEventQueueOwner,XEventQueueOwner;
import x11.X        : None;
import globals.xcb;
import types;

enum window_h = 64;


struct
Output {
    GLXDrawable drawable;

    void
    _init () {
        // Get the first screen
        // screen = xcb_setup_roots_iterator( xcb_get_setup( c ) )[prefered_screen].data;
        xcb_screen_t* screen;
        new_screen (c,default_screen,screen);

        // Create GL context
        // WINDOW
        xcb_window_t hwnd;
        new_window (c,display,default_screen,screen,hwnd,drawable);                

        // GL
        init_gl ();
    }

    void
    clear () {
        import bindbc.opengl;

        glClearColor (0.2, 0.4, 0.9, 1.0);
        glClear (GL_COLOR_BUFFER_BIT);        
    }

    void
    opCall (Input_Event e) {
        xcb_flush (c);
        glXSwapBuffers (display,drawable);
    }

    import types;
    import image.image;
    void
    draw_image (Image* image, Size size, Pos pos) {
        import bindbc.opengl;
        glClearColor (0.3, 0.5, 0.9, 1.0);
        glClear (GL_COLOR_BUFFER_BIT);        

        import gl.opengl.gles2;
        auto _gl = _GL ();
        _gl._init ();
        _gl.draw_image (image,size,pos);
    }
}

void
new_screen (xcb_connection_t* c, int default_screen, ref xcb_screen_t* screen) {
    xcb_screen_iterator_t screen_iter = 
        xcb_setup_roots_iterator (xcb_get_setup (c));

    for (int screen_num = default_screen; screen_iter.rem && screen_num > 0; screen_num--, xcb_screen_next (&screen_iter)) 
        {}
    screen = screen_iter.data;

    //screen = xcb_setup_roots_iterator (xcb_get_setup (c)).data;
    log ( "Screen: width x height (in pixels): ", screen.width_in_pixels, "x", screen.height_in_pixels );    
}

void
new_window (xcb_connection_t* c, Display* display, int default_screen, xcb_screen_t* screen, ref xcb_window_t hwnd, ref GLXDrawable drawable) {
    import x11.Xlib     : Display,XOpenDisplay,DefaultScreen,True;
    import x11.Xlib_xcb : XSetEventQueueOwner,XEventQueueOwner;
    import x11.X        : None;
    import glx.glx;

    // 1.
    static int[] 
    visual_attribs = [
        GLX_X_RENDERABLE,     True,
        GLX_DRAWABLE_TYPE,    GLX_WINDOW_BIT,
        GLX_RENDER_TYPE,      GLX_RGBA_BIT,
        GLX_X_VISUAL_TYPE,    GLX_TRUE_COLOR,
        GLX_RED_SIZE,         8,
        GLX_GREEN_SIZE,       8,
        GLX_BLUE_SIZE,        8,
        GLX_ALPHA_SIZE,       8,
        GLX_DEPTH_SIZE,       24,
        GLX_STENCIL_SIZE,     8,
        GLX_DOUBLEBUFFER,     True,
        //GLX_SAMPLE_BUFFERS, 1,
        //GLX_SAMPLES,        4,
        None
    ];

    // Query framebuffer configurations that match visual_attribs
    GLXFBConfig* fb_configs;
    int          num_fb_configs;
    fb_configs = glXChooseFBConfig (display, default_screen, visual_attribs.ptr, &num_fb_configs);
    if (!fb_configs || num_fb_configs == 0)
        throw new Exception ("glXGetFBConfigs failed");

    writefln ("FBConfig: Found %d matching FB configs", num_fb_configs);

    // Select first framebuffer config and query visualID
    int visualID;
    GLXFBConfig fb_config = fb_configs[0];
    glXGetFBConfigAttrib (display,fb_config,GLX_VISUAL_ID,&visualID);

    log ("visualID: ", visualID);

    // Create OpenGL context
    GLXContext context = 
        glXCreateNewContext (display,fb_config,GLX_RGBA_TYPE,null,True);
    if (!context)
        throw new Exception ("glXCreateNewContext failed");


    // 2.
    // Create XID's for colormap and window
    // Create colormap
    xcb_colormap_t colormap = xcb_generate_id (c);
    xcb_create_colormap (
        c,
        XCB_COLORMAP_ALLOC_NONE,
        colormap,
        screen.root,
        visualID
    );

    // Ask for our window's Id
    hwnd = xcb_generate_id (c);

    //
    immutable(uint)   eventmask =
        //XCB_EVENT_MASK_EXPOSURE | 
        //XCB_EVENT_MASK_KEY_PRESS;
        XCB_EVENT_MASK_EXPOSURE |
        XCB_EVENT_MASK_KEY_PRESS |
        XCB_EVENT_MASK_KEY_RELEASE |
        XCB_EVENT_MASK_BUTTON_PRESS |
        XCB_EVENT_MASK_BUTTON_RELEASE |
        XCB_EVENT_MASK_POINTER_MOTION |
        XCB_EVENT_MASK_FOCUS_CHANGE |
        XCB_EVENT_MASK_STRUCTURE_NOTIFY;
    immutable(uint[]) value_list = [
        eventmask,
        colormap,
        0
    ];
    immutable(uint)   value_mask = 
        XCB_CW_EVENT_MASK |
        XCB_CW_COLORMAP;

    short h = window_h;
    short y = cast (short) (screen.width_in_pixels - h);

    // Create the window
    auto cookie =  // xcb_void_cookie_t 
        xcb_create_window( 
            c,                             // Connection          
            XCB_COPY_FROM_PARENT,          // depth (same as root)
            hwnd,                          // window Id
            screen.root,                   // parent window       
            0, y,                          // x, y                
            screen.width_in_pixels, h,     // width, height       
            0,                             // border_width
            XCB_WINDOW_CLASS_INPUT_OUTPUT, // class               
            visualID,                      // visual              
            value_mask,                    // masks
            value_list.ptr                 // not used yet 
        );                                 

    // Map the window on the screen
    xcb_map_window (c,hwnd);
    xcb_flush (c);

    // Create GLX Window
    GLXWindow glxwindow = glXCreateWindow (display,fb_config,hwnd,null);
    if (!glxwindow)
        throw new Exception ("glxwindow failed");

    // make OpenGL context current
    drawable = glxwindow;
    if (!glXMakeContextCurrent (display, drawable, drawable, context))
        throw new Exception ("glXMakeContextCurrent failed");

    // Make sure commands are sent before we pause, so window is shown
}

void
init_gl () {
    import bindbc.opengl;

    const GLSupport openglLoaded = loadOpenGL ();
    log (glSupport);
    if ( openglLoaded != glSupport) {
        import std.conv : to;
        throw new Exception ("Error: loadOpenGL: " ~ to!string (openglLoaded));
    }
}

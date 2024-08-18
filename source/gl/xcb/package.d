module gl.xcb;

version (XCB):
import xcb.xcb;
import xau;

alias GL_FLOAT = float;
enum GL_FALSE          = false;
enum GL_POINTS         = 1; // GL_POINTS;
enum GL_LINES          = 2; // GL_LINES;
enum GL_LINE_STRIP     = 3; // GL_LINE_STRIP;
enum GL_LINE_LOOP      = 4; // GL_LINE_LOOP;
enum GL_TRIANGLES      = 5; // GL_TRIANGLES;
enum GL_TRIANGLE_STRIP = 6; // GL_TRIANGLE_STRIP;
enum GL_TRIANGLE_FAN   = 7; // GL_TRIANGLE_FAN;

struct 
_GL {
    bool auth_flag = true;
    xcb_connection_t* c;
    xcb_screen_t*     screen;
    xcb_window_t      hwnd;

    void
    _init () {
        // INIT
        // CONNECT
        new_connection (auth_flag, c);

        // Get the first screen
        // screen = xcb_setup_roots_iterator( xcb_get_setup( c ) )[prefered_screen].data;
        new_screen (c,screen);

        // WINDOW
        new_window (c,screen,hwnd);
    }

    void
    _draw_image (Image* image, Size size, Pos pos) {
        alias uint32_t = uint;
        xcb_gcontext_t foreground = xcb_generate_id (c);
        uint32_t       mask;
        uint32_t[2]    values;                
        mask = XCB_GC_FOREGROUND | XCB_GC_GRAPHICS_EXPOSURES;
        values[0] = screen.black_pixel;
        values[1] = 0;
        xcb_create_gc (c, foreground, hwnd, mask, values.ptr);

        //
        xcb_point_t[] _scaled_points;
        _scaled_points.length = image.points.length;
        foreach (ref rec; recs) {
            foreach (i,p; image.points[rec.first..rec.count]) {
                _scaled_points[i].x = p.x * size.x + pos.x;
                _scaled_points[i].y = p.y * size.y + pos.y;
            }

            switch (rec.mode) {
                case GL.Mode.LINE_STRIP: 
                    xcb_poly_line (c, XCB_COORD_MODE_PREVIOUS, hwnd, foreground, rec.count, _scaled_points.ptr);
                    break;
                default:
            }
        }

        //auto 
        //program = Program (c);
        //program.use ();
        //program.ray (image.points);
        //program.uniform ("u_pos", pos);
        //program.uniform ("u_size", size);
        //program.draw (image.recs);
    }
}

void
new_connection (bool auth_flag, ref xcb_connection_t* c) {
    if (auth_flag) {
        const char* display;
        int         prefered_screen;

        // AUTH
        XAuth auth;
        get_auth (auth);
        c = xcb_connect_to_display_with_auth_info (display, &auth.xcb_auth, &prefered_screen);
        if (xcb_connection_has_error (c))
            throw new XCBException ("Cannot open display", c);
    }
    else {
        // Open the connection to the X server     
        //c = xcb_connect( getenv( "DISPLAY" ), null );
        c = xcb_connect (null, null);
        if (xcb_connection_has_error (c))
            throw new XCBException ("Cannot open display", c);
    }
    
}

void
new_screen (xcb_connection_t* c, ref xcb_screen_t* screen) {
    screen = xcb_setup_roots_iterator (xcb_get_setup (c)).data;
    log ( "width x height (in pixels): ", screen.width_in_pixels, "x", screen.height_in_pixels );    
}

void
new_window (xcb_connection_t* c, xcb_screen_t* screen, ref xcb_window_t hwnd) {
    // Ask for our window's Id
    hwnd = xcb_generate_id (c);

    //
    immutable(uint)   value_mask = 
        XCB_CW_BACK_PIXEL | 
        XCB_CW_EVENT_MASK;
    immutable(uint[]) value_list = [
        screen.white_pixel,
        XCB_EVENT_MASK_EXPOSURE |
        XCB_EVENT_MASK_KEY_PRESS |
        XCB_EVENT_MASK_KEY_RELEASE |
        XCB_EVENT_MASK_BUTTON_PRESS |
        XCB_EVENT_MASK_BUTTON_RELEASE |
        XCB_EVENT_MASK_POINTER_MOTION |
        XCB_EVENT_MASK_FOCUS_CHANGE |
        XCB_EVENT_MASK_STRUCTURE_NOTIFY,
        0
    ];

    short h = 64;
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
            2,                             // border_width        
            XCB_WINDOW_CLASS_INPUT_OUTPUT, // class               
            screen.root_visual,            // visual              
            value_mask,                    // masks
            value_list.ptr                 // not used yet 
        );                                 

    // Map the window on the screen
    xcb_map_window (c, hwnd);

    // Make sure commands are sent before we pause, so window is shown
    xcb_flush (c);    
}

class 
XCBException : Exception {
    import xcb.xcb;

    this (string s, xcb_connection_t* c) {
        auto err = xcb_connection_has_error (c);
        super (xcb_error_to_string (err));
    }
}

string 
xcb_error_to_string (int err) {
    switch (err) {
        case XCB_CONN_ERROR: 
            return ": [XCB_CONN_ERROR]: because of socket errors, pipe errors or other stream errors";
        case XCB_CONN_CLOSED_EXT_NOTSUPPORTED:
            return ": [XCB_CONN_CLOSED_EXT_NOTSUPPORTED]: when extension not supported";
        case XCB_CONN_CLOSED_MEM_INSUFFICIENT:
            return ": [XCB_CONN_CLOSED_MEM_INSUFFICIENT]: when memory not available";
        case XCB_CONN_CLOSED_REQ_LEN_EXCEED:
            return ": [XCB_CONN_CLOSED_REQ_LEN_EXCEED]: exceeding request length that server accepts";
        case XCB_CONN_CLOSED_PARSE_ERR:
            return ": [XCB_CONN_CLOSED_PARSE_ERR]: error during parsing display string";
        case XCB_CONN_CLOSED_INVALID_SCREEN:
            return ": [XCB_CONN_CLOSED_INVALID_SCREEN]: because the server does not have a screen matching the display";
        default:
            return "";
    }    
}


auto 
get_auth (out XAuth xauth) {
    ushort family  = xau.FamilyLocal;
    string address = "ASUS-K53SD";
    string number  = "0";
    string name    = "";
    xau.Xauth xau_auth;
    if (xau.GetAuthByAddr (family, address, number, name, xau_auth)) {
        xauth.from_Xauth (xau_auth);
        return true;
    }

    return false;
}

struct 
XAuth {
    xcb_auth_info_t xcb_auth;
    string         _name;
    ubyte[]        _data;

    void 
    from_Xauth (in xau.Xauth _auth) {
        import std.conv : to;

        _name            = _auth.name.dup;
        xcb_auth.namelen = _name.length.to!(typeof (xcb_auth_info_t.namelen));
        xcb_auth.name    = cast (char*) _name.ptr;
        _data            = _auth.data.dup;
        xcb_auth.datalen = _data.length.to!(typeof (xcb_auth_info_t.namelen));
        xcb_auth.data    = cast (char*) _data.ptr;
    }
}

struct
Program {
    xcb_connection_t* c;
    GL.Point[] _points;
    Pos  pos;
    Size size;

    void
    use () {
        //
    }

    void
    ray (GL.Point[] points, string a_position_name = "a_position") {
        _points = points;
    }

    void
    uniform (string name, Pos b) {
        pos = b;
    }
    void
    uniform (string name, Size b) {
        size = b;
    }

    void
    draw (Rec[] recs) {        
        foreach (ref rec; recs)
            glDrawArrays (rec.mode, rec.first, rec.count);
    }

    void
    glDrawArrays (GL.Mode mode, GL.Index first, GL.Count count) {
        GL.Point[] _scaled_points;
        foreach (i,p; _points[first..count]) {
            _scaled_points[i].x = p.x * size.x + pos.x;
            _scaled_points[i].y = p.y * size.y + pos.y;
        }

        switch (mode) {
            case GL.Mode.LINE_STRIP: 
                xcb_poly_line (c, XCB_COORD_MODE_PREVIOUS, window.hwnd, foreground, count, _scaled_points.ptr);
                break;
            default:
        }
    }
}

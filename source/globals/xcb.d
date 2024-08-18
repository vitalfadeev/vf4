module globals.xcb;

import x11.Xlib     : Display,XOpenDisplay,DefaultScreen,True;
import x11.Xlib_xcb : XSetEventQueueOwner,XEventQueueOwner;
import x11.X        : None;
import xcb.xcb;
import xau;


static xcb_connection_t* c;
static Display*          display;
static int               default_screen;

void
_init () {
    // Open Xlib Display
    new_display (display,default_screen);

    // CONNECT
    bool auth_flag = true;
    new_connection (auth_flag,/*display,*/default_screen,c);
}

void
new_display (ref Display* display, ref int default_screen) {
    display = XOpenDisplay (null);

    if (!display)
        throw new Exception ("Can't open display");

    default_screen = DefaultScreen (display);
}

void
new_connection (bool auth_flag, /*Display* display, */int default_screen, ref xcb_connection_t* c) {
    //c = XGetXCBConnection (default_screen);
    //XSetEventQueueOwner (display,XEventQueueOwner.XCBOwnsEventQueue);
//version (_0):  
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


static
this () {
    _init ();
}


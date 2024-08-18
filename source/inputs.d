module inputs;

import types;


struct
Inputs {
    // input.app
    // input.xcb
    //   -> fetch app
    //   -> fetch xcb
    //     get time app
    //     get time xcb
    //     compare
    //       return small time event
    import input.app; 
    import input.xcb; 

    static input.app.Input app;
    static input.xcb.Input xcb;

    enum 
    Source {
        APP,
        XCB,
    }

    Source source;

    _Input_Event 
    front () {
        final
        switch (source) {
            case Source.APP: return app.front ();
            case Source.XCB: return xcb.front ();
        }
    }

    void 
    popFront () {
        final
        switch (source) {
            case Source.APP: app.popFront (); break;
            case Source.XCB: xcb.popFront (); break;
        }
    }

    bool
    empty () {
        bool app_empty = app.empty ();
        bool xcb_empty = xcb.empty ();

        if (!app_empty && !xcb_empty) {
            auto app_time = app.front.time;
            auto xcb_time = xcb.front.time;

            // app || xcb -> select by time
            if (app_time.tv_sec < xcb_time.tv_sec) {
                // app
                source = Source.APP;
                return false;
            }
            else {
                // xcb
                source = Source.XCB;
                return false;
            }
        }
        else
        if (!app_empty) {
            // app
            source = Source.APP;
            return false;
        }
        else
        if (!xcb_empty) {
            // xcb
            source = Source.XCB;
            return false;
        }
        else {
            // empty
            // wait xcb
            source = Source.XCB;
            return 
                xcb.wait_for_event () ? 
                    false : 
                    true;
        }
    }

    auto
    save () {
        return this;
    }
}

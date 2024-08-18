module input.app;

import types;

struct
Input {
    _Input_Event[] s;

    ref _Input_Event
    front () {
        return s[0];
    }

    bool
    empty () {
        return s.length == 0;
    }

    void
    popFront () {
        import std.range;
        s.popFront ();
    }

    void
    opOpAssign (string op : "~") (Input_Event b) {
        import core.sys.posix.sys.time : gettimeofday, timeval;
        timeval tv;
        gettimeofday (&tv,null);
        s ~= _Input_Event (tv,b);
    }

    auto
    save () {
        return this;
    }
}


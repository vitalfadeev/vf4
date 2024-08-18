module select.errno_exception;


class
Errno_exception :Exception{
    this (string msg) {
        import std.conv;
        import core.sys.linux.errno : errno;
        super (msg~": "~(errno.to!string)~": "~format_error (errno));
    }
}

string 
format_error (int err) {
    import core.stdc.string : strerror_r,strlen;

    char[80] buf;
    const(char)* cs;
    cs = strerror_r (err, buf.ptr, buf.length);

    auto len = strlen (cs);

    if (cs[len - 1] == '\n')
        len--;
    if (cs[len - 1] == '\r')
        len--;

    return cs[0 .. len].idup;
}


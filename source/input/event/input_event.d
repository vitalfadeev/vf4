module input.event.input_event;

import input.event.codes;
import types : IFUNC,REG,Iptr,R;


struct
_Input_Event {
    timeval     time;  // tv_sec,tv_usec ulong,ulong
    Input_Event input_event;

    import core.sys.posix.sys.time : timeval;
    //struct timeval {
    //    time_t      tv_sec;
    //    suseconds_t tv_usec;
    //}
    // alias c_long    time_t;
    // alias slong_t   suseconds_t;
}

union
Input_Event {
    REG type_code_value;
    struct {
        Type   type;
        ushort code;
        uint   value;
    }

    this (Type type, ushort code) {
        this.type = type;
        this.code = code;
    }

    this (Type type, ushort code, uint value) {
        this.type  = type;
        this.code  = code;
        this.value = value;
    }

    string
    toString () {
        import std.format;
        return format!"%s (%s,%d)" (typeof (this).stringof, type, code);
    }

    alias Type  = .Type;
    alias Code  = ushort;
    alias Value = uint;
}

enum Type : ushort {
    SYN       = EV_SYN,
    KEY       = EV_KEY,
    REL       = EV_REL,
    ABS       = EV_ABS,
    MSC       = EV_MSC,
    SW        = EV_SW,
    LED       = EV_LED,
    SND       = EV_SND,
    REP       = EV_REP,
    FF        = EV_FF,
    PWR       = EV_PWR,
    FF_STATUS = EV_FF_STATUS,
    MAX       = EV_MAX,
    CNT       = EV_CNT,
    GUI       = EV_CNT + 1,
    APP       = EV_CNT + 2,
}

struct
Funcs {
    mixin (fields_from_enum!(Type,IFUNC) ());
    // IFUNC f_0;
    // IFUNC f_1;
    // IFUNC f_2;
    // ...
    // IFUNC f_35;
}


//
string
fields_from_enum (ENUM,T) () {
    import std.conv;
    import std.range;
    import std.format;
    import std.algorithm.iteration;
    import std.string;

    string s;
    foreach (i; iota (0, ENUM.max+1, 1))
        s ~= format!"%s f_%d;" (T.stringof, i);

    return s;
}

template
module_funcs_from_enum (T,ENUM,SYMBOL,string prefix="") {
    import std.meta;
    import std.range;
    import std.string;
    import std.algorithm;
    import std.traits;

    enum module_funcs_from_enum = 
        T.stringof ~ " (" ~ _fncs!(SYMBOL,ENUM,prefix).join (",") ~ ")";
}

string[]
_fncs (SYMBOL,ENUM,string prefix) () {
    string[] ss;

    static foreach (i; 0..ENUM.max+1)
        ss ~= funcs_func!(SYMBOL,ENUM,i,prefix);

    return ss;
}

template
funcs_func (SYMBOL,ENUM,int i,string prefix) {
    enum _func_name = funcs_func_name!(SYMBOL,ENUM,i,prefix);

    static if (_func_name.length && module_has_function!(SYMBOL,_func_name))
        enum funcs_func = "&" ~ _func_name;
    else
        enum funcs_func = "null";
}

template
funcs_func_name (alias MODULE,ENUM,int i,string prefix) {
    import std.traits;
    import std.string;
    import std.algorithm.searching;
    import std.conv;

    static if ((cast (int[]) [EnumMembers!ENUM]).canFind (i))
        enum funcs_func_name = prefix ~ (cast (ENUM) i).to!string.toLower;
    else
        enum funcs_func_name = "";
}

template 
module_has_function (SYMBOL,string NAME) {
    import std.traits;

    static if (
        NAME.length && 
        __traits (hasMember,SYMBOL,NAME) && 
        isSomeFunction!(__traits (getMember,SYMBOL,NAME))
    )
        enum module_has_function = true;
    else
        enum module_has_function = false;
}

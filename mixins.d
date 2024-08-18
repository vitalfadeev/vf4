// expansion at /usr/include/dmd/druntime/import/core/internal/atomic.d(502,13)

                asm pure nothrow @nogc @trusted
                {
                    mov DL, value;
                    mov AL, compare;

                    mov RCX, dest;
                    lock; cmpxchg [RCX], DL;

                    setz success;
                }


// expansion at /usr/include/dmd/druntime/import/core/internal/atomic.d(502,13)

                asm pure nothrow @nogc @trusted
                {
                    mov DX, value;
                    mov AX, compare;

                    mov RCX, dest;
                    lock; cmpxchg [RCX], DX;

                    setz success;
                }


// expansion at /usr/include/dmd/druntime/import/core/internal/atomic.d(502,13)

                asm pure nothrow @nogc @trusted
                {
                    mov RDX, value;
                    mov RAX, compare;

                    mov RCX, dest;
                    lock; cmpxchg [RCX], RDX;

                    setz success;
                }


// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /usr/include/dmd/phobos/std/format/spec.d(170,13)
private ubyte _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf;@property bool flDash() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 1U) != 0;}
@property void flDash(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 1U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))1U);}
@property bool flZero() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 2U) != 0;}
@property void flZero(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 2U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))2U);}
@property bool flSpace() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 4U) != 0;}
@property void flSpace(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 4U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))4U);}
@property bool flPlus() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 8U) != 0;}
@property void flPlus(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 8U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))8U);}
@property bool flHash() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 16U) != 0;}
@property void flHash(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 16U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))16U);}
@property bool flEqual() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 32U) != 0;}
@property void flEqual(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 32U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))32U);}
@property bool flSeparator() @safe pure nothrow @nogc const { return (_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf & 64U) != 0;}
@property void flSeparator(bool v) @safe pure nothrow @nogc { if (v) _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf |= 64U;else _flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf &= cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))(-1-cast(typeof(_flDash_flZero_flSpace_flPlus_flHash_flEqual_flSeparator__bf))64U);}

// expansion at /usr/include/dmd/phobos/std/functional.d(452,16)
cast(T)a < cast(T) b

// expansion at /usr/include/dmd/phobos/std/functional.d(452,16)
cast(T)a < cast(T) b

// expansion at /usr/include/dmd/phobos/std/functional.d(222,13)
alias a = __a ;

// expansion at /usr/include/dmd/phobos/std/functional.d(223,13)
alias b = __b ;

// expansion at /usr/include/dmd/phobos/std/functional.d(224,20)
a == b

// expansion at /usr/include/dmd/phobos/std/typecons.d(467,13)
enum int data = 0;

// expansion at /usr/include/dmd/phobos/std/typecons.d(467,13)
enum int count = 0;

// expansion at /usr/include/dmd/phobos/std/typecons.d(654,9)
alias _0LU = Identity!(field[0LU]);alias data = _0LU;alias _1LU = Identity!(field[1LU]);alias count = _1LU;

// expansion at /usr/include/dmd/phobos/std/typecons.d(654,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at source/input/event/input_event.d(73,5)
Iptr function(R*, Input_Event, void*, void*) f_0;Iptr function(R*, Input_Event, void*, void*) f_1;Iptr function(R*, Input_Event, void*, void*) f_2;Iptr function(R*, Input_Event, void*, void*) f_3;Iptr function(R*, Input_Event, void*, void*) f_4;Iptr function(R*, Input_Event, void*, void*) f_5;Iptr function(R*, Input_Event, void*, void*) f_6;Iptr function(R*, Input_Event, void*, void*) f_7;Iptr function(R*, Input_Event, void*, void*) f_8;Iptr function(R*, Input_Event, void*, void*) f_9;Iptr function(R*, Input_Event, void*, void*) f_10;Iptr function(R*, Input_Event, void*, void*) f_11;Iptr function(R*, Input_Event, void*, void*) f_12;Iptr function(R*, Input_Event, void*, void*) f_13;Iptr function(R*, Input_Event, void*, void*) f_14;Iptr function(R*, Input_Event, void*, void*) f_15;Iptr function(R*, Input_Event, void*, void*) f_16;Iptr function(R*, Input_Event, void*, void*) f_17;Iptr function(R*, Input_Event, void*, void*) f_18;Iptr function(R*, Input_Event, void*, void*) f_19;Iptr function(R*, Input_Event, void*, void*) f_20;Iptr function(R*, Input_Event, void*, void*) f_21;Iptr function(R*, Input_Event, void*, void*) f_22;Iptr function(R*, Input_Event, void*, void*) f_23;Iptr function(R*, Input_Event, void*, void*) f_24;Iptr function(R*, Input_Event, void*, void*) f_25;Iptr function(R*, Input_Event, void*, void*) f_26;Iptr function(R*, Input_Event, void*, void*) f_27;Iptr function(R*, Input_Event, void*, void*) f_28;Iptr function(R*, Input_Event, void*, void*) f_29;Iptr function(R*, Input_Event, void*, void*) f_30;Iptr function(R*, Input_Event, void*, void*) f_31;Iptr function(R*, Input_Event, void*, void*) f_32;Iptr function(R*, Input_Event, void*, void*) f_33;Iptr function(R*, Input_Event, void*, void*) f_34;

// expansion at source/gui/gui.d(18,5)
Iptr function(R*, Input_Event, void*, void*) f_0;Iptr function(R*, Input_Event, void*, void*) f_1;Iptr function(R*, Input_Event, void*, void*) f_2;

// expansion at /usr/include/dmd/phobos/std/functional.d(222,13)
alias a = __a ;

// expansion at /usr/include/dmd/phobos/std/functional.d(223,13)
alias b = __b ;

// expansion at /usr/include/dmd/phobos/std/functional.d(224,20)
a == b

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at source/gui/button.d(33,22)
Funcs (null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,&gui,null)

// expansion at source/gui/button.d(34,22)
GUI_Funcs (null,null,&gui_draw)

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs < rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs < rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs < rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs < rhs

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /usr/include/dmd/phobos/std/typecons.d(467,13)
enum int schema = 0;

// expansion at /usr/include/dmd/phobos/std/typecons.d(467,13)
enum int sequence = 0;

// expansion at /usr/include/dmd/phobos/std/typecons.d(654,9)
alias _0LU = Identity!(field[0LU]);alias schema = _0LU;alias _1LU = Identity!(field[1LU]);alias sequence = _1LU;

// expansion at /usr/include/dmd/phobos/std/typecons.d(654,9)
alias _0LU = Identity!(field[0LU]);alias _1LU = Identity!(field[1LU]);

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/internal/memory.d(32,18)
onOutOfMemoryError();

// expansion at /usr/include/dmd/phobos/std/functional.d(222,13)
alias a = __a ;

// expansion at /usr/include/dmd/phobos/std/functional.d(223,13)
alias b = __b ;

// expansion at /usr/include/dmd/phobos/std/functional.d(224,20)
a == b

// expansion at /usr/include/dmd/phobos/std/functional.d(222,13)
alias a = __a ;

// expansion at /usr/include/dmd/phobos/std/functional.d(223,13)
alias b = __b ;

// expansion at /usr/include/dmd/phobos/std/functional.d(224,20)
a == b

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /usr/include/dmd/druntime/import/core/atomic.d(542,9)
*cast(T*)&val+=mod

// expansion at /usr/include/dmd/druntime/import/core/internal/atomic.d(264,13)

                asm pure nothrow @nogc @trusted
                {
                    naked;
                    lock; xadd[RSI], EDI;
                    mov EAX, EDI;
                    ret;
                }


// expansion at /usr/include/dmd/phobos/std/stdio.d(5251,38)
core.stdc.stdio.stdin

// expansion at /usr/include/dmd/druntime/import/core/atomic.d(542,9)
*cast(T*)&val+=mod

// expansion at /usr/include/dmd/druntime/import/core/atomic.d(542,9)
*cast(T*)&val-=mod

// expansion at /usr/include/dmd/druntime/import/core/atomic.d(542,9)
*cast(T*)&val+=mod

// expansion at /usr/include/dmd/phobos/std/stdio.d(5251,38)
core.stdc.stdio.stdout

// expansion at /usr/include/dmd/druntime/import/core/atomic.d(542,9)
*cast(T*)&val+=mod

// expansion at /usr/include/dmd/druntime/import/core/atomic.d(542,9)
*cast(T*)&val-=mod

// expansion at /usr/include/dmd/druntime/import/core/atomic.d(542,9)
*cast(T*)&val+=mod

// expansion at /usr/include/dmd/phobos/std/stdio.d(5251,38)
core.stdc.stdio.stderr

// expansion at /usr/include/dmd/druntime/import/core/atomic.d(542,9)
*cast(T*)&val+=mod

// expansion at /usr/include/dmd/druntime/import/core/atomic.d(542,9)
*cast(T*)&val-=mod

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /usr/include/dmd/phobos/std/meta.d(965,13)
auto e0LU = el;

// expansion at /usr/include/dmd/phobos/std/meta.d(965,13)
auto e1LU = el;

// expansion at /usr/include/dmd/phobos/std/meta.d(965,13)
auto e2LU = el;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /usr/include/dmd/phobos/std/functional.d(222,13)
alias a = __a ;

// expansion at /usr/include/dmd/phobos/std/functional.d(223,13)
alias b = __b ;

// expansion at /usr/include/dmd/phobos/std/functional.d(224,20)
a == b

// expansion at /usr/include/dmd/phobos/std/functional.d(222,13)
alias a = __a ;

// expansion at /usr/include/dmd/phobos/std/functional.d(223,13)
alias b = __b ;

// expansion at /usr/include/dmd/phobos/std/functional.d(224,20)
a == b

// expansion at /usr/include/dmd/phobos/std/file.d(1227,21)
statbuf.st_ctime

// expansion at /usr/include/dmd/phobos/std/file.d(1230,26)
statbuf.st_ctim

// expansion at /usr/include/dmd/phobos/std/file.d(1233,26)
statbuf.st_ctimensec

// expansion at /usr/include/dmd/phobos/std/file.d(1234,20)
statbuf.st_ctimensec

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs == rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs < rhs

// expansion at /usr/include/dmd/phobos/std/typecons.d(539,31)
lhs < rhs

// expansion at
.object.size_t h = 0;foreach (i, T; typeof(p.tupleof))    static if(is(T* : const(.object.Object)*))         h = h * 33 + typeid(const(.object.Object)).getHash(cast(const void*)&p.tupleof[i]);    else         h = h * 33 + typeid(T).getHash(cast(const void*)&p.tupleof[i]);return h;

// expansion at /usr/include/dmd/druntime/import/core/internal/atomic.d(138,13)

                asm pure nothrow @nogc @trusted
                {
                    push RBX; // call preserved

                    mov EDX, 0;
                    mov EAX, 0;
                    mov RCX, src;
                    lock; cmpxchg [RCX], EDX;
                    lea RBX, resultValuePtr;
                    mov RBX, [RBX];
                    mov [RBX], EAX;

                    pop RBX;
                }


// expansion at /usr/include/dmd/druntime/import/core/atomic.d(542,9)
*cast(T*)&val+=mod


module gui.button;

import types;

struct
Button {
static:
    Tree _super = {null,null,Iptr(&I)};
    alias _super this;

    Iptr
    I (Tree* tree, Input_Event type_code_value, REG r3, REG r4) {
        return call_event_type_func (&funcs, tree, type_code_value, r3, r4);
    }

    Iptr
    gui (Tree* tree, Input_Event type_code_value, REG r3, REG r4) {
        return call_event_code_func (&gui_funcs, tree, type_code_value, r3, r4);
    }

    Iptr
    gui_draw (Tree* tree, Input_Event type_code_value, REG r3, REG r4) {
        // pressed
        const Image_id image_id = 1;  // normal
        draw_image (tree,image_id,r3,r4);
        import std.stdio; alias log = writeln;
        log ("DRAW");
        return Iptr (&I);
    }

    //
    import input.event.input_event : module_funcs_from_enum;
    auto funcs     = mixin (module_funcs_from_enum!(Funcs,Input_Event.Type,Button));
    auto gui_funcs = mixin (module_funcs_from_enum!(GUI_Funcs,GUI.Code,Button,"gui_"));
}

//
pragma (inline, true)
Iptr
call_event_type_func (const void* funcs, Tree* tree, Input_Event type_code_value, REG r3, REG r4) {
    auto ifunc   = *(cast (IFUNC*) (funcs + ((void*).sizeof * type_code_value.type)));  // like lea EAX, [base + index * size]
    if (ifunc !is null)
        return (ifunc) (tree,type_code_value,r3,r4);
    else
        return Iptr (&I);
}

pragma (inline, true)
Iptr
call_event_code_func (const void* funcs, Tree* tree, Input_Event type_code_value, REG r3, REG r4) {
    auto ifunc   = *(cast (IFUNC*) (funcs + ((void*).sizeof * type_code_value.code)));  // like lea EAX, [base + index * size]
    if (ifunc !is null)
        return (ifunc) (tree,type_code_value,r3,r4);
    else
        return Iptr (&I);
}


//
void
draw_image (Tree* tree, Image_id image_id, REG r3, REG r4) {
    import globals;
    auto img = globals.app.images[image_id];

    Size size = * cast (Size*) cast (REG*) &r3;
    globals.app.output.draw_image (&img, size, Pos (0.0,0.0));
    //output.draw_image (&img, *cast (Size*) cast(void*) &r3, *cast (Pos*) cast(void*) &r4);
    //gui_events.add (&button._this, GUI.Code.REDRAW, null, null);    
}


//template 
//module_has_function (SYMBOL,string NAME) {
//    import std.traits;

//    static if (
//        NAME.length && 
//        __traits (hasMember,SYMBOL,NAME) && 
//        isSomeFunction!(__traits (getMember,SYMBOL,NAME))
//    )
//        enum module_has_function = true;
//    else
//        enum module_has_function = false;
//}

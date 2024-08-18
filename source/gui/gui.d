module gui.gui;

import input.event.input_event : fields_from_enum,Input_Event;
import types : IFUNC,REG,Iptr,R;

struct
GUI {
    enum 
    Code : ushort {
        HIT_TEST,
        UPDATE,
        DRAW,
    }
}

struct
GUI_Funcs {
    mixin (fields_from_enum!(GUI.Code,IFUNC) ());
    // IFUNC f_0;
    // IFUNC f_1;
    // IFUNC f_2;
    // ...
    // IFUNC f_35;
}

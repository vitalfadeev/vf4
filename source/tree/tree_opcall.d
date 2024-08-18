module tree.tree_opcall;

import std.stdio;
alias log = writeln;
import globals;
import types;


void
tree_opCall (Tree* tree, Input_Event type_code_value) {
    log ();
    log (type_code_value);

    switch (type_code_value.type) {
        case Input_Event.Type.KEY: { // keyboard,mouse key
            REG r3;
            REG r4;
            call_tree (tree,type_code_value,r3,r4);
            globals.app.update (tree);
            globals.app.draw (tree);
            break;
        }
        case Input_Event.Type.GUI: { // draw,update GUI
            if (type_code_value.code == GUI.Code.DRAW)
                globals.app.draw (tree);
            break;
        }
        case Input_Event.Type.APP: { // do COMMAND
            static if (__traits (hasMember,globals.app.Code,"OPEN_APP_SELECTOR"))
            switch (type_code_value.code) {
                case globals.app.Code.OPEN_APP_SELECTOR: globals.app.open_app_selector (); break;
                default:
            }
            break;
        }
        default:
    }
}


void
call_tree (Tree* tree, Input_Event type_code_value, REG r3, REG r4) {
    if (tree.i !is null ) {
        auto i = (cast (IFUNC) tree.i) (tree, type_code_value, r3, r4);
        if (tree.i != i)
            tree.i = i;
    }
}

// in deep
// recursive
void
recursive_call_tree (Tree* tree, Input_Event type_code_value, REG r3, REG r4) {
    //
}


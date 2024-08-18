import gl;
public import tree.tree   : I,Iptr,R,Tree;
public import gui.gui     : GUI,GUI_Funcs;
public import input.event.input_event : _Input_Event,Input_Event,Funcs;

alias IFUNC = Iptr function (Tree* tree, Input_Event type_code_value, REG r3, REG r4);
alias REG   = void*;
alias X     = GL.X;
alias Y     = GL.Y;
alias W     = GL.W;
alias H     = GL.H;
alias Point = GL.Point;
alias Image_id = size_t;

struct
Pos {
    X x;
    Y y;
}

struct
Size {
    W w;
    H h;
    alias x = w;
    alias y = h;
}

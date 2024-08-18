import std.stdio;
alias log = writeln;
import globals;

void 
main() {
	globals.app.main ();
}

struct
App {
    import types;
    import inputs      : Inputs;
    import output.xcb  : Output;
    import image.image : Image;

    Inputs  inputs;
    Output  output;
    Tree*   tree;
    Image[] images;

    void
    main () {
        load_tree ();
        load_images ();

        foreach (ref e; inputs) {
            event  (e.input_event);
            output (e.input_event);     // e.DRAW -> swap_buffers
        }
    }    

    void 
    _init () {
        output._init ();
    }

    void
    event (Input_Event type_code_value) {
    	import tree.tree_opcall : tree_opCall;
        tree_opCall (tree,type_code_value);
    }

    //void
    //_init () {
    //    load_tree ();
    //    load_images ();
    //}

    void
    load_tree () {
        //import square_size : Square_size;
        import gui.button : Button;

    	auto i  = new Tree ();
    	auto b  = new Button ();
    	i.add_in (cast (R*) b);

    	tree = i;
    }

    auto
    test_image_1 () {
        import gl;
        import image.image : Image;
        return 
            Image (
                [GL.Point (0f,1f), GL.Point (1f,0f), GL.Point (0f,-1f), GL.Point (-1f,0f)],
                [Image.Rec (GL.Mode.LINE_LOOP, 0, 4)]
            );
    }

    auto
    test_image_2 () {
        import gl;
        import image.image : Image;
        return 
            Image (
                [GL.Point (0f,0.8f), GL.Point (0.8f,0f), GL.Point (0f,-0.8f), GL.Point (-0.8f,0f)],
                [Image.Rec (GL.Mode.LINE_LOOP, 0, 4)]
            );
    }

    auto
    test_image_3 () {
        import gl;
        import image.image : Image;
        return 
            Image (
                [GL.Point (0f,0.5f), GL.Point (0.5f,0f), GL.Point (0f,-0.5f), GL.Point (-0.5f,0f)],
                [Image.Rec (GL.Mode.LINE_LOOP, 0, 4)]
            );
    }

    void
    test_images () {
        images ~= test_image_1 ();
        images ~= test_image_2 ();
        images ~= test_image_3 ();
    }


    void
    load_images () {
        test_images ();
    }

    void
    update (Tree* tree) {
        import types;

        auto type_code_value = Input_Event (Input_Event.Type.GUI, GUI.Code.UPDATE);
        Size size = Size (1.0,1.0);
        auto r3 = *cast (REG*) cast (void*) &size;
        auto r4 = null;    

        //call_tree (tree,type_code_value,r3,r4);    
    }

    void
    draw (Tree* tree) {
        import types;
        import tree.tree_opcall : call_tree;

        output.clear ();

        //auto redraw_pos  = Pos (expose_e.x, expose_e.y);
        //auto redraw_size = Size (expose_e.width, expose_e.height);

        auto type_code_value = Input_Event (Input_Event.Type.GUI, GUI.Code.DRAW);
        Size size = Size (1.0,1.0);
        auto r3 = *cast (REG*) cast (void*) &size;
        auto r4 = null;
        //recursive_call_tree (&tree,type_code_value,r3,r4);
        call_tree (tree,type_code_value,r3,r4);    
    }

    void
    open_app_selector () {
        log ("OPEN_APP_SELECTOR");
    } 

    enum 
    Code : ushort {
        OPEN_APP_SELECTOR,
    }
}


//   -----------------------
//  |                       |
//  V                       |
// Event                    |
//   -> R1, R2, R3, R4      |
//   call [fn1]             |
//   call [fn2]             |
//   call [fn3]             |
//   ...                    |
//   call [fn1000]          |
//     new_event -> pool  --
//     modify memory



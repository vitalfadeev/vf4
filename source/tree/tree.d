module tree.tree;

import types : Input_Event,REG;

// I
Iptr
I (Tree* tree, Input_Event type_code_value, REG r3, REG r4) {
    import std.stdio; alias log = writeln;
    log ("STUB: I()");
    //foreach (t; tree.ins) {
    //    call_tree (t,type_code_value,r3,r4);
    //}
    return Iptr (&I);
}

struct
Iptr {
    void* _super = &I;
    alias _super this;
}

// I -> I
//  
//   -> I -> I ->
//
//   -> I -> I ->
// /              \
// \              /
//   ------------
//
//          I
//          |
//          Rr 
//     r /     \
// I - R         R - I
//       \     / r
//        r R
//          |
//          I
version (_)
struct 
R {
    R* r;
    I* i;
}

//          I                       I         
//          |                       |         
//          Rr                      Rr         
//     r /     \               r /     \      
// I - R         R - I     I - R         R - I
//       \     / r               \     / r    
//        r R                     r R         
//          |                       |         
//          I                       I         
//                     
//          |                       |           
//          r                       r           
//          RR        rr->          RR

version (_)
struct 
RR {
    RR* rr;
    R*  r;
}

//
//                                  I                                  
//                                  |                                  
//                                  R r                                
//                             r /     \                               
//                         I - R         R  - I                        
//                               \     / r                             
//                               r  R                                  
//                                  |                                  
//                                  I                                  
// 
//           I                      R                      I           
//           |                      |                      |           
//           R r                    RR rr                  R r         
//      r /     \             rr /     \              r /     \        
// I -  R         R  - I  R - RR         RR - R  I -  R         R  - I 
//        \     / r              \     / rr             \     / r      
//         r R                  rr RR                    r R           
//           |                      |                      |           
//           I                      R                      I           
//
//                                  I                                  
//                                  |                                  
//                                  R r                                
//                             r /     \                               
//                         I - R         R  - I                        
//                               \     / r                             
//                               r  R                                  
//                                  |                                  
//                                  I                                  
// 
// 4 independednt rings
// 1 ring-of-rings

version (_)
struct 
RR {
    RR* rr; // ring in ring  =null when "ring of I",    =right_rr when "ring of ring"
    R*  r;  // i in ring     =null when "one I",        =right_r  when ""
    I*  i;  // I             =null when "ring in ring", =i        when "ring of I"
}

// for 1 memory allocation
struct 
R {
    R*   rr;  // first child
    R*   r;   // right sibling
    Iptr i;   // value: function I

    alias THIS = typeof (this);

    void
    add_r (R* b) {
        if (r is null)
            r = b;
        else { // find last, add to last
            last.rr = b;
        }
    }

    void
    add_in (R* b) {
        if (rr is null)
            rr = b;
        else { // find last, add to last
            rr.last.rr = b;
        }
    }

    auto 
    last () {
        return last (r);
    }

    pragma (inline, true)
    auto
    last (R* start) {
        assert (start !is null);

        auto a=start.r;

        for (auto _a=a; _a !is null; a=_a,_a=_a.r) {}

        return a;
    }
}
// universal

alias Tree = R;

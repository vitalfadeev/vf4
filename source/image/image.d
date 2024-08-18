module image.image;

import gl;
import types;


struct
Image {
    GL.Point[] points;
    Rec[]      recs;

    // scale:
    // move:
    //   size
    //   pos

    // ray:
    //   auto a_position = attrib (a_position_name);
    //   glVertexAttribPointer (
    //       /* index */      a_position, 
    //       /* size */       GL_Point.tupleof.length, 
    //       /* type */       GL_Point.GL_TYPE, 
    //       /* normalized */ GL_Point.GL_SHOULD_NORM,  // GL_TRUE - will be converted to [-1.0..1.0]
    //       /* stride */     0, 
    //       /* pointer */    points.ptr
    //   );
    //   glEnableVertexAttribArray (a_position);

    // draw:
    //   foreach (ref rec; recs)
    //     glDrawArray (rec.mode, rec.first, rec.count);

    struct
    Rec {
        // glDrawArray (type,first,count);
        GL.Mode  mode;
        GL.Index first;
        GL.Count count;
    }
}


//struct
//Images {
//    Image[] s;  // image_id = 0  ==  s[0]
//}


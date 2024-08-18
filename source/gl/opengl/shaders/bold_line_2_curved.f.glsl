// vec4 gl_FragCoord;   // window coord
// int  gl_PointCoord;  // 0.0 to 1.0 coord
// precision highp float;

const float Pi = 3.1415926535897932384626433832795;

//  0 on the line AB
// +1 on one side
// -1 on the other side
// | x2-x1  x3-x1 |
// | y2-y1  y3-y1 |
float 
sign (vec2 a, vec2 b, vec2 p) {
    return (b.y - p.y) * (a.x - p.x) - (b.x - p.x) * (a.y - p.y);
}

bool 
point_in_triangle (vec2 pt, vec2 v1, vec2 v2, vec2 v3) {
    float d1, d2, d3;
    bool  has_neg, has_pos;

    d1 = sign (pt, v1, v2);
    d2 = sign (pt, v2, v3);
    d3 = sign (pt, v3, v1);

    has_neg = (d1 < 0.0) || (d2 < 0.0) || (d3 < 0.0);
    has_pos = (d1 > 0.0) || (d2 > 0.0) || (d3 > 0.0);

    return !(has_neg && has_pos);
}

bool 
point_in_circle (vec2 p, vec2 c, float r) {
    vec2 _p;
    float s;

    _p = p - c;
    s = (_p.x * _p.x + _p.y * _p.y) - r * r;

    if (s == 0.0) {  // on circle
        return true;
    }
    else
    if (s < 0.0) {  // in circle
        return true;
    }
    else
    if (s > 0.0) {  // out circle
        return false;
    }
}

void 
main () {
    int mode = 1;

    if (mode == 0) {  // all
        gl_FragColor = vec4 ( 1.0, 1.0, 1.0, 1.0 );
    }
    else
    if (mode == 1) {  // triangle
        float cx = 250.0;
        float cy = 250.0;
        float w  = 50.0;
        if (point_in_triangle (gl_FragCoord.xy, vec2 (cx-w,cy-w), vec2 (cx,cy+w), vec2 (cx+w,cy-w)))
            gl_FragColor = vec4 ( 1.0, 1.0, 1.0, 1.0 );
        else
            discard;
    }
}

// contur cw
//   point right of vec
// contur un-cw
//   point left of vec
// 
// functions:
//   point right of vec
//   point left of vec
//
// sign (a,b,p)

// A-B
//   norm_a_b
//     norm_a_b to left
//     norm_a_b to right
//   norm_a_b * w
//     norm_a_b * w (t)
//       l_norm_a_b * w (t)
//       r_norm_a_b * w (t)

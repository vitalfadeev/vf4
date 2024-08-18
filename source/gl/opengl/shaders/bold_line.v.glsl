// A -> B
// ab_0 = B-A
// ab_0_1 = ab_0.normalize ()
// al = ab_0_1.rotate ( 90.deg) * wl
// ar = ab_0_1.rotate (-90.deg) * wr
// pl = al + p
// pr = ar + p
// line (pl,pr)
//
// 4 Vertex - position
// A 
// B
// wl
// wr
// GLfloat[4] ray = [0,0,0,0]
// uniform vec2 A
// uniform vec2 B
// uniform vec2 (wl,wr)
//"precision highp float;       \n" ~

attribute vec2  a_position;   
uniform   vec2  u_a;            
uniform   vec2  u_b;            
uniform   float u_wl;          
uniform   float u_wr;          

vec2 
rotate (vec2 v, float a) {
    float s = sin (a);
    float c = cos (a);
    mat2  m = mat2 (c, s, -s, c);
    return m * v;
}

void 
main () {
    if (a_position.x == 0.0) {
        vec2 ba = u_b - u_a;
        vec2 _al = u_a + rotate (normalize (ba), 3.14159 / 2.0) * u_wl;
        gl_Position = vec4 (_al.x, _al.y, 0.0, 1.0); 
    }
    else
    if (a_position.x == 1.0) {
        vec2 ba = u_b - u_a;
        vec2 _ar = u_a + rotate (normalize (ba), -3.14159 / 2.0) * u_wr;
        gl_Position = vec4 (_ar.x, _ar.y, 0.0, 1.0); 
    }
    else
    if (a_position.x == 2.0) {
        vec2 ba = u_b - u_a;
        vec2 _bl = u_b + rotate (normalize (ba), -3.14159 / 2.0) * u_wl;
        gl_Position = vec4 (_bl.x, _bl.y, 0.0, 1.0); 
    }
    else
    if (a_position.x == 3.0) {
        vec2 ba = u_b - u_a;
        vec2 _br = u_b + rotate (normalize (ba), 3.14159 / 2.0) * u_wr;
        gl_Position = vec4 (_br.x, _br.y, 0.0, 1.0); 
    }
    else {
        gl_Position = vec4 (a_position, 0.0, 1.0); 
    }
}

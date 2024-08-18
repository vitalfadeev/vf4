attribute vec2  a_position;   
uniform   vec2  u_pos;
uniform   vec2  u_size;

void 
main () {
    gl_Position = vec4 (
        a_position.x * u_size.x + u_pos.x, 
        a_position.y * u_size.y + u_pos.y, 
        0.0, 
        1.0
    ); 
}

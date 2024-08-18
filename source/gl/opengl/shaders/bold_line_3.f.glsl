// vec4 gl_FragCoord;   // window coord
// int  gl_PointCoord;  // 0.0 to 1.0 coord
// precision highp float;

const float Pi = 3.1415926535897932384626433832795;

void 
main () {
    gl_FragColor = vec4 ( 1.0, 1.0, 1.0, 1.0 );
}

// A-B
//   norm_a_b
//     norm_a_b to left
//     norm_a_b to right
//   norm_a_b * w
//     norm_a_b * w (t)
//       l_norm_a_b * w (t)
//       r_norm_a_b * w (t)
//       -> lines

module gl.opengl.gles2;

import std.string;
import std.file;
import types;
import image.image;


//import bindbc.gles.egl;
version (Android) {
public import bindbc.gles.gles;
}
else
version (linux) {
public import bindbc.opengl;
alias GLfixed = int;
}
else {
    static assert (0, "unsupported platform");
}

alias Program_Id = GLuint;
alias Shader_Id  = GLuint;
alias Attrib_Id  = GLuint;
alias Uniform_Id = GLuint;

struct
_GL {
    Program draw_image_program;

    void
    _init () {
        load_programs ();
    }

    void
    load_programs () {
        draw_image_program = 
            Program (
                readText ("source/gl/opengl/shaders/draw_image_program.v.glsl"),
                readText ("source/gl/opengl/shaders/draw_image_program.f.glsl")
            );
    }


    void
    draw_scene () {
        _clear_buffer ();
        _render_scene ();
        _update_window ();
    }

    void
    _clear_buffer (int w=512, int h=512) {
        glViewport (0,0,w,h);
        glClearColor (0.2f, 0.2f, 0.2f, 1.0f);
        glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    }

    void
    _render_scene () {
        //
    }

    void
    _update_window () {
        //SDL_GL_SwapWindow (ad.window);
    }    

    void
    draw_image (Image* image, Size size, Pos pos) {
        auto 
        program = draw_image_program;
        program.use ();
        program.ray (image.points);
        program.uniform ("u_pos")  = pos;
        program.uniform ("u_size") = size;

        foreach (ref rec; image.recs)
            glDrawArrays (rec.mode, rec.first, rec.count);

        // scale:
        //   size

        // move:
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
    }
}


struct
Program {
    Program_Id id;

    this (string vShaderStr, string fShaderStr) {
        if (!load_program (vShaderStr,fShaderStr))
            this.id = 0;
    }

    bool
    load_program (string vertShaderSrc, string fragShaderSrc) {
        GLint linked;

        // Load the vertex/fragment shaders
        Shader vertex_shader;
        Shader fragment_shader;
        try {
            vertex_shader   = Shader (GL_VERTEX_SHADER, vertShaderSrc);
            fragment_shader = Shader (GL_FRAGMENT_SHADER, fragShaderSrc);
        } catch (Exception e) {            
            if (vertex_shader.id != 0) {
               glDeleteShader (vertex_shader.id);
               throw e;
            }
        }

        // Create the program object
        auto program_id = glCreateProgram ();
        
        if (program_id == 0)
           throw new Exception ("glCreateProgram");

        glAttachShader (program_id, vertex_shader.id);
        glAttachShader (program_id, fragment_shader.id);

        // Link the program
        glLinkProgram (program_id);

        // Check the link status
        glGetProgramiv (program_id, GL_LINK_STATUS, &linked);

        if (!linked)
            throw new Program_Exception (program_id, "glGetProgramiv");

        // Free up no longer needed shader resources
        glDeleteShader (vertex_shader.id);
        glDeleteShader (fragment_shader.id);

        this.id = program_id;
        return true;
    }

    Attrib
    attrib (string name) {
        import std.string : toStringz;

        auto loc = glGetAttribLocation (
            /* program */ id, 
            /* name */    name.toStringz
        );

        if (loc == -1)
            throw new Exception ("glGetAttribLocation: " ~ name);

        return Attrib (loc);
    }

    Uniform
    uniform (string name) {
        import std.string : toStringz;

        auto loc = glGetUniformLocation (
            /* program */ id, 
            /* name */    name.toStringz
        );

        if (loc == -1)
            throw new Exception ("glGetUniformLocation: " ~ name);

        return Uniform (loc);
    }

    void
    use () {
        glUseProgram (id);
    }

    void
    ray (Point[] points, string a_position_name = "a_position") {
        auto a_position = attrib (a_position_name);

        glVertexAttribPointer (
            /* index */      a_position, 
            /* size */       Point.tupleof.length, 
            /* type */       Point.GL_TYPE, 
            /* normalized */ Point.GL_SHOULD_NORM,  // GL_TRUE - will be converted to [-1.0..1.0]
            /* stride */     0, 
            /* pointer */    points.ptr
        );

        glEnableVertexAttribArray (a_position);
    }

    struct
    Attrib {
        Attrib_Id id;
        alias id this;
    }

    struct
    Uniform {
        Uniform_Id id;
        alias id this;

        void
        opAssign (Pos b) {
            glUniform2fv (id,1,cast(float*)&b);
        }

        void
        opAssign (Size b) {
            glUniform2fv (id,1,cast(float*)&b);
        }
    }

    class 
    Program_Exception : Exception {
        this (Program_Id program_object, string msg) {
            GLint info_len = 0;

            glGetProgramiv (program_object,GL_INFO_LOG_LENGTH,&info_len);

            if (info_len > 1) {
                 string info;
                 info.length = info_len;

                 glGetProgramInfoLog (
                     program_object, 
                     info_len, 
                     null, 
                     cast (char*) info.ptr
                 );

                 info.length--;

                 glDeleteProgram (program_object);
                 super (msg ~ ": Error linking program: \n" ~ info);
            }
            else {
                glDeleteProgram (program_object);
                super (msg);
            }
        }
    }
}


struct
Shader {
    Shader_Id id;

    this (GLenum type, string shader_src) {
        if (!load_shader (type,shader_src))
            this.id = 0;
    }

    bool 
    load_shader (GLenum type, string shader_src) {
        Shader_Id shader;
        GLint compiled;
       
        // Create the shader object
        shader = glCreateShader (type);

        if (shader == 0)
            throw new Exception ("glCreateShader");

        // Load the shader source
        const GLchar* ptr = shader_src.ptr;
        glShaderSource (shader, 1, &ptr, null);
       
        // Compile the shader
        glCompileShader (shader);

        // Check the compile status
        glGetShaderiv (shader, GL_COMPILE_STATUS, &compiled);

        if (!compiled)
            throw new Shader_Exception (shader,"glGetShaderiv",shader_src);

        this.id = shader;
 
        return true;
    }    

    class 
    Shader_Exception : Exception {
        this (Shader_Id shader, string msg, string shader_src) {
             GLint info_len = 0;

             glGetShaderiv (shader, GL_INFO_LOG_LENGTH, &info_len);
               
             if (info_len > 1) {
                 string info;
                 info.length = info_len;

                 glGetShaderInfoLog (
                     shader, 
                     info_len, 
                     null, 
                     cast (char*) info.ptr
                 );

                 info.length--;

                 glDeleteShader (shader);
                 super (msg ~ ": Error compiling shader: \n" ~info ~ "\n" ~ shader_src);
             }
             else {
                glDeleteShader (shader);
                super (msg);
             }
       }
    }
}

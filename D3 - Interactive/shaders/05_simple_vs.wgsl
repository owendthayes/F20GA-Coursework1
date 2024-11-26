struct VSOutputStruct {
    @builtin(position) position: vec4f,
    @location(0) color: vec4f,
};

struct Vertex{
    @location(0) position:vec2f,
};

@vertex fn vs(
    @builtin(vertex_index) vertexIndex : u32,
    vertice: Vertex,
    ) 
    -> VSOutputStruct {
    
    let color = array(
        vec3f(1.0, 0.0, 0.0), // red
        vec3f(0.0, 1.0, 0.0), // green
        vec3f(0.0, 0.0, 1.0), // blue

        vec3f(0.0, 0.0, 1.0), // blue
        vec3f(1.0, 1.0, 1.0), // 
        vec3f(1.0, 0.0, 0.0) // red
    );

    var vsOutput : VSOutputStruct;
    vsOutput.position = vec4f(vertice.position, 0.0, 1.0);
    vsOutput.color = vec4f(color[vertexIndex], 1.0);
    return vsOutput;
};
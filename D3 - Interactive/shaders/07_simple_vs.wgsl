struct VSOutputStruct {
    @builtin(position) position: vec4f,
    @location(0) color: vec4f,
};

struct Vertex{
    @location(0) position:vec2f,
    @location(1) color:vec4f,
};

@vertex fn vs(
    @builtin(vertex_index) vertexIndex : u32,
    vertice: Vertex,
    ) 
    -> VSOutputStruct {

    var vsOutput : VSOutputStruct;
    vsOutput.position = vec4f(vertice.position, 0.0, 1.0);
    vsOutput.color = vertice.color;
    return vsOutput;
};
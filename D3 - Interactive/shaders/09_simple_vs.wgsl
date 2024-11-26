struct VSOutputStruct {
    @builtin(position) position: vec4f,
    @location(0) color: vec4f,
};

struct Vertex{
    @location(0) position:vec2f,
    @location(1) color:vec4f,
};

@group(0) @binding(0) var<uniform> modelMatrix: mat4x4f;
@group(0) @binding(1) var<uniform> projectionMatrix: mat4x4f;

@vertex fn vs(
        @builtin(vertex_index) vertexIndex : u32,
        vertice: Vertex,
    ) 
    -> VSOutputStruct {

    var vsOutput : VSOutputStruct;
    vsOutput.position =   projectionMatrix * modelMatrix * vec4f(vertice.position, 0.0, 1.0);
    vsOutput.color = vertice.color;
    return vsOutput;
};
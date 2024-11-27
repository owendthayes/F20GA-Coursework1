struct VSOutputStruct {
    @builtin(position) position: vec4f, 
    @location(0) color: vec4f, 
    @location(1) uv: vec2f, 
    @location(2) normal : vec4f, 
    @location(3) fragPos : vec4f, 
    @location(4) viewPos : vec4f, 
    @location(5) lightPos : vec4f, 
};

struct Vertex{
    @location(0) position:vec3f,
    @location(1) color:vec4f,
    @location(2) uv:vec2f,
    @location(3) normal:vec3f
};

@group(0) @binding(0) var<uniform> modelMatrix: mat4x4f;
@group(0) @binding(1) var<uniform> projectionMatrix: mat4x4f;
@group(0) @binding(2) var<uniform> viewMatrix: mat4x4f;

@group(0) @binding(6) var<uniform> normalMatrix: mat4x4f;
@group(0) @binding(7) var<uniform> cameraPosition: vec3f;

@vertex fn vs(
        @builtin(vertex_index) vertexIndex : u32,
        vertice: Vertex,
    ) 
    -> VSOutputStruct {

    var vsOutput : VSOutputStruct;
    vsOutput.position =   projectionMatrix * viewMatrix * modelMatrix * vec4f(vertice.position, 1.0);
    vsOutput.color = vertice.color;
    vsOutput.uv = vertice.uv;
    
    vsOutput.fragPos = modelMatrix * vec4f(vertice.position, 1.0);
    vsOutput.normal =  normalMatrix * vec4f(vertice.normal, 0.0);
    vsOutput.viewPos =  vec4f(cameraPosition, 1.0);

    return vsOutput;
};
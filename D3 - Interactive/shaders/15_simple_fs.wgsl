struct VSOutputStruct {
    @builtin(position) position: vec4f,
    @location(0) color: vec4f,
    @location(1) uv: vec2f,
};

@group(0) @binding(3) var sam : sampler;
@group(0) @binding(4) var tex : texture_2d<f32>;


@fragment fn fs(fsInput : VSOutputStruct) 
    -> @location(0) vec4f {
    
    let colorTexture = textureSample(tex, sam, fsInput.uv); // reading texture samples
    let color = fsInput.color;                              // reading previous colours
    let output = vec4f(colorTexture.r * color.r, colorTexture.g * color.g, colorTexture.b * color.b, 1.0);  // mult
    return output;  

}

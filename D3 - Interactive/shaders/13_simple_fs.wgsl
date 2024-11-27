struct VSOutputStruct {
    @builtin(position) position: vec4f,
    @location(0) color: vec4f,
};

@fragment fn fs(fsInput : VSOutputStruct) 
    -> @location(0) vec4f {
    return fsInput.color;
}

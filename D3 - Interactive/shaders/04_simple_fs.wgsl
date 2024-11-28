struct VSOutputStruct {
    @builtin(position) position: vec4f,
    @location(0) color: vec4f,
};

@fragment fn fs(fsInput : VSOutputStruct) 
    -> @location(0) vec4f {
    //return vec4f(0.0, 0.0, 0.7, 1.0);
    return fsInput.color;
}

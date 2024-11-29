struct VSOutputStruct {
    @builtin(position) position: vec4f,
    @location(0) color: vec4f,
};

@fragment fn fs(fsInput : VSOutputStruct) 
    -> @location(0) vec4f {
    
   /* if (fsInput.color.r > 0.75 || fsInput.color.g > 0.75 || fsInput.color.b > 0.75){
        discard;
    }
    return vec4(fsInput.color.r, fsInput.color.g, fsInput.color.b, 0.5);
    */
     return vec4(fsInput.color.rgb, 1.0);         // Original
    // return vec4f(0.0, 0.0, 1.0, 1.0); // Simple color       
    // return vec4f(0.0, 0.0, 1.0, 0.5); // alpha - need to enable correct context
}

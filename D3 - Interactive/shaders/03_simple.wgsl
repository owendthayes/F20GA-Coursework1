@vertex fn vs(
    @builtin(vertex_index) vertexIndex : u32
    ) -> @builtin(position) vec4f {
    let pos = array(
        vec2f(-0.5,  0.5),  // top left
        vec2f(-0.5, -0.5),  // bottom left
        vec2f( 0.5, -0.5),   // bottom right

        vec2f( 0.5, -0.5),   // bottom right
        vec2f( 0.5,  0.5),  // top right
        vec2f(-0.5,  0.5)  // top left
    );

    return vec4f(pos[vertexIndex], 0.0, 1.0);
}

@fragment fn fs() -> @location(0) vec4f {
    return vec4f(0.0, 0.0, 0.7, 1.0);
}
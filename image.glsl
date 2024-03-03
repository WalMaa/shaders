#ifdef GL_ES
precision mediump float;
#endif

#iChannel0 "file://wave.jpg"

float random2d(vec2 coord){
    return fract(sin(dot(coord.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void main(){
    vec2 coord = gl_FragCoord.xy / iResolution.xy;
    vec3 color = vec3(0.);
    vec4 image = texture2D(iChannel0, coord);
    float grain = 0.0;
    grain = random2d(vec2(coord / 9.) * iTime);
    
    color = mix(color, image.rgb, image.a);

    color += grain * -0.1;
    gl_FragColor = vec4(color, 1.0);
}
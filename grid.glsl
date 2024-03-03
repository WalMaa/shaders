#ifdef GL_ES
precision mediump float;
#endif


void main(){
    vec2 coord = gl_FragCoord.xy / iResolution.xy;
    vec3 color = vec3(0.0);

    color += sin(coord.x * cos(iTime / 60.) * 60.) + sin(coord.y * cos(iTime / 60.)* 10.);
    color += cos(coord.y * sin(iTime / 30.) * 10.) + cos(coord.x * sin(iTime / 20.)* 10.);

    color *= sin(iTime / 10.) * 0.5;

    gl_FragColor = vec4(color, 1.0);
}
#ifdef GL_ES
precision mediump float;
#endif




void main(){
    vec2 coord = 6. *  ( gl_FragCoord.xy / iResolution.xy);
    vec3 color = vec3(0.0);

    for(int n = 1; n < 20; n++){
        float i = float(n);
    coord += vec2( 0.7 / i * sin( i * coord.y + iTime / 3. + 0.3 * i) + 0.8, 0.4 / i * sin(coord.x + iTime / 3. + 0.3 * i) + 1.6);
        
    }

    color = vec3( 0.5 * sin(coord.x) + .2, 0.1 * sin(coord.y) + .1, .8 * sin(coord.x + coord.y) + 1.) * .1;
    gl_FragColor = vec4(color, 1.0);
}
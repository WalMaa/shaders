#ifdef GL_ES
precision mediump float;
#endif

#iChannel0"file://wave.jpg"
#iChannel1"file://disp.jpg"

float random2d(vec2 coord) {
    return fract(sin(dot(coord.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void main() {
    vec2 coord = gl_FragCoord.xy / iResolution.xy;
    vec3 color = vec3(0.);
    float mX = iMouse.x / iResolution.x;

    vec4 displace = texture2D(iChannel1, coord * .6);
    vec2 displacedUV = vec2(coord.x , coord.y );
    displacedUV = mix(coord, displace.xy, mX / 10.);


    color = texture2D(iChannel0, displacedUV).rgb;
    color.b = texture2D(iChannel0, displacedUV + vec2(0.05, 0.) * mX).b;
    color.g = texture2D(iChannel0, displacedUV + vec2(0.02, 0.) * mX).g;





    gl_FragColor = vec4(color, 1.);
}
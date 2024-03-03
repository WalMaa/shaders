#ifdef GL_ES
precision mediump float;
#endif

#iChannel0 "file://wave.jpg"

float map(float value, float min1, float max1, float min2, float max2) {
  return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}

void main(){
    vec2 coord = gl_FragCoord.xy / iResolution.xy;
    vec2 mouse = iMouse.xy / iResolution.xy;



    vec2 direction = normalize(coord - mouse);
    float distance = length(coord - mouse) ;

    float prox = 1.5 - map( distance, 0.0, 0.1, 0., 1.);

    prox = clamp(prox, 0., 1.);



    vec2 zoomedUV = mix(coord , mouse , prox * 0.5);

    vec4 image = texture2D(iChannel0, zoomedUV);

    gl_FragColor = image;
}
#ifdef GL_ES
precision mediump float;
#endif

const float PI = 3.14159265359;


float circle( vec2 position, float radius ){
    return step(radius, length(position -vec2(0.5)));
}

float rect(vec2 position, vec2 scale) {
    scale = vec2(0.5) - scale * 0.5;
    vec2 shaper = vec2(step(scale.x, position.x), step(scale.y, position.y));
    shaper *= vec2(step(scale.x, 1.0 -position.x), step(scale.y, 1.0 -position.y));
    return shaper.x * shaper.y;
}

float polygon(vec2 position, float radius, float sides) {

    position = position - vec2(0.5);
    float angle = atan(position.x , position.y);
    float slice = PI * 2.0 / sides ;

    return step(radius, cos(floor( 0.5 + angle / slice) * slice - angle) * length(position));
}

mat2 scale (vec2 scale) {
    return mat2(scale.x, 0.0, 0.0, scale.y);
}

mat2 rotate (float angle) {
    return mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
}


void main(){

    vec2 coord = (gl_FragCoord.xy / iResolution.xy);
    vec3 color = vec3(0.0);
    vec2 translate = vec2(sin(iTime) *.5, cos(iTime) *.5);

    coord += translate * 0.5;
    coord -= vec2(0.5);
    coord += scale(vec2(sin(iTime) + 2.)) * coord;
    coord = rotate(iTime) * coord;
    coord += vec2(0.5);
    float circle = circle(coord, 0.2);
    float polygon = polygon(coord, 0.2, 6.);

    color += vec3(polygon);

    gl_FragColor = vec4(color, 1.);
}
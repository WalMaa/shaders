#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;


void main() {
  vec2 position = gl_FragCoord.xy / u_resolution.xy;

  vec3 color = vec3(0.0);
  // Set gl_Position
  gl_FragColor = vec4(color, 1.0);
}
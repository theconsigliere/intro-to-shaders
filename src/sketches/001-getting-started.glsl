precision highp float;

varying vec2 vUv;
uniform float uTime;

// The most basic shader
void main(){
  vec3 color = vec3(1., 0., 0.);

  if (vUv.x > 0.5) {
    color = vec3(0.0, 0.0, 1.0);
  }

  gl_FragColor = vec4(color, 1.0);
}

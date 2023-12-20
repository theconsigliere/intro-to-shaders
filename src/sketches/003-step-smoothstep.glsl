precision highp float;

varying vec2 vUv;
uniform float uTime;


float normalSin(float val){
  return sin(val) * 0.5 + 0.5;
}

float gradient (float attr) {
// To avoid this range issue, we have to fix the range of the sine wave. Instead of -1 to 1, we'll make it 0 to 1:
 float edge = normalSin(uTime); 

 return step(edge, attr);
}

void main(){
  vec3 color = vec3(1.);

  color = vec3 (gradient(vUv.x), 0., 0.);

  gl_FragColor = vec4(color, 1.0);
}


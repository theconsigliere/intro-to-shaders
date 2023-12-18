precision highp float;

varying vec2 vUv;
uniform float uTime;

float square(vec2 uv, float size, vec2 pos){
  float halfSize = size/2.;
  // square 
 // In the function, we are subtracting half the size of each edge 
 // because each edge is exactly half the size of the square from the center. 
 // With this, we can re-create what we had before a single function.

// POSITIONS uv 
  uv += pos;

  // FIXED CORNERS
// float left   = step(0.5 - halfSize, uv.x);
  float right  = step(uv.x, 0.5 + halfSize);
 
  float top    = step(0.5 - halfSize, uv.y);
  float bottom = step(uv.y, 0.5 + halfSize );

// GRADIENT
// This transforms our horizontal gradient (uv.x) into a smaller gradient that's completely black before lowerbounds (first value) 
// completely white after upper bounds (second value), 
// and has a smooth transition between white and black in the middle.
 float left = smoothstep(0.5 - halfSize, 1. - (0.5 - halfSize), uv.x);

// You could even mimic a step function with a smoothstep by using the same lower and upper edge:

// These two are the same
// smoothstep(0.5, 0.5, vUv.x) == step(0.5, vUv.x)

 // combine edges by multiplying them
  float result = left * right * top * bottom;
 
  return result;
}

float circle(vec2 uv, vec2 size) {

// Move circle
  vec2 circlePos = vec2(cos(uTime ), sin(uTime )) * 0.2 ;
  float sizeChange = sin(uTime) * 0.2;
  
  float circleGradient = distance(size, uv + circlePos);
  // NON GRADIENT
  //float circle = step(0.4 + sizeChange, circleGradient);
  // GRADIENT
  float circle = smoothstep( 0.2 + sizeChange, 0.4 + sizeChange,  circleGradient);

  return circle;
}

void main(){
  vec3 color = vec3(1.);
 // animates black across and back
 // float result = step(cos(uTime), vUv.x);

 // half black half white
 // float result = step(0.5, vUv.x);

// SQUARE FUNCTION
//float square = square(vUv, 0.8, vec2(0., 0.));
// color = vec3(square);

// CIRCLE FUNCTION
float circle = circle(vUv, vec2(0.5, 0.5));
color = vec3(circle);

  gl_FragColor = vec4(color, 1.0);
}


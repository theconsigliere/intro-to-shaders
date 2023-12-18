Shader Cheatsheet
// ----------------------------

1. vec3 means a vector with 3 floats, an object with 3 numbers
2. gl_FragColor is a vec4 because it holds 3 colour values and a transparency value
3. Add the dot “.” to your numbers. Numbers without the dot are considered “ints”. Most of the time you'll be working with floats.
4. uniforms are how we communicate from our javascript (CPU) to the shaders
5. Varyings are parameters we can send from the vertex shader to the fragment shader
6. Naming conventions | Uniforms are commonly denoted with an “u” at the beginning, uTime or uProgress. Varyings are commonly denoted with an “v” at the beginning, vUv or vPosition.
7. What are UVs? | UVs are 2D coordinates ( x" and "y" ) that are generally normalized from 0 to 1
8. step function | An incredibly useful trick to flip the result of step is to flip the parameters.
9. combine two layers by multiplying them

precision highp float;

uniform sampler2D uDiffuseMap;
uniform float uTime;

varying vec3 Normal;
varying vec2 TexCoord;
varying vec3 Position;

void main()
{
    gl_FragColor =  vec4(TexCoord.x,TexCoord.y,0.0,1.0);
}


precision highp float;

uniform sampler2D uDiffuseMap;
uniform float uTime;
uniform vec2 uResolution;
uniform vec2 uMousePos;

varying vec3 Normal;
varying vec2 TexCoord;
varying vec3 Position;

void main()
{
    uTime *= 0.4;
    vec2 uv = vec2(gl_FragCoord.x / uResolution.x, gl_FragCoord.y / uResolution.y);
    uv.y -= 1.5;
    uv.x += .2;
    //uv.x -= 0.5;
    
    float offsetTime = .5;
    
    vec2 p = uv;
    float t1 = uTime * 3. * offsetTime;
    float t2 = uTime * 1. * offsetTime;
    
    p.y *= (p.x*p.y) * sin(p.y*p.x*2. + t1);
    
    float d = length(p*.7);
    
    //uv.x *= iResolution.x/iResolution.y;
    //uv -= 0.5;
    //uv.x *= iResolution.x/iResolution.y;
    //float d = length(uv);
    
    vec3 c0 = vec3(1.);
    vec3 c1 = vec3(.365, .794, .935);
    vec3 c2 = vec3(.973, .671, .961);
    vec3 c3 = vec3(.973, .843, .439);
    vec3 c4 = vec3(.973, .671, .961);
    vec3 c5 = vec3(.365, .794, .935);
    vec3 c6 = vec3(1.);
    
    
    float offset = 1.2;
    float step1 = .05*offset + sin(t2*3.)*.1;
    float step2 = 0.3*offset + sin(t2)*.15;
    float step3 = 0.6*offset + sin(t2)*.1;
    float step4 = 1.2*offset + sin(t2*3.)*.2;
    float step5 = 1.7*offset;
    
    float step6 = 3.2;
    float step7 = 4.0;
    
    vec3 col = mix(c0, c1, smoothstep(step1, step2, d));
    col = mix(col, c2, smoothstep(step2, step3, d));
    col = mix(col, c3, smoothstep(step3, step4, d));

    float distMod = distance(vec2(uMousePos.x, 1.0 - uMousePos.y), gl_FragCoord.xy);
    float colourMod = mix(0.5,0.3,clamp(distMod * 0.002,0.0,1.0));

    gl_FragColor =  vec4(col * colourMod,1.0);
    //gl_FragColor =  vec4(vec2(gl_FragCoord.x / uResolution.x, gl_FragCoord.y / uResolution.y),0.0,1.0);
}


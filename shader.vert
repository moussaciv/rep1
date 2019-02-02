
#version 450

/*vec2 positions[3] = vec2[](
    vec2(0.0, -0.5),
    vec2(0.5, 0.5),
    vec2(-0.5, 0.5)
);

vec3 colors[3] = vec3[](
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 1.0)
);*/


layout(binding = 0) uniform UniformBufferObject1
{
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo[2];



layout(location = 0) in vec2 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inTexCoord;

layout(location = 0) out vec3 fragColor;
layout(location = 1) out vec2 outTexCoord;

void main()
{
	uint ind = 1;
    //gl_Position = vec4(positions[gl_VertexIndex], 0.0, 1.0);
	//fragColor = colors[gl_VertexIndex];

	gl_Position = ubo[ind].proj * ubo[ind].view * ubo[ind].model * vec4(inPosition, 0.0, 1.0);
	fragColor = inColor;
	outTexCoord = inTexCoord;
}

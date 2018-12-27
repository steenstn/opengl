#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 atexCoord;
uniform mat4 transform;
uniform mat4 projection;
uniform mat4 view;
out vec3 Normal;
out vec3 FragPos;
out vec2 TexCoord;

void main()
{
	gl_Position = projection * view * transform * vec4(aPos, 1.0f);
	FragPos = vec3(transform * vec4(aPos, 1.0));
	Normal = mat3(transpose(inverse(transform))) * aNormal;
	TexCoord = atexCoord;
}
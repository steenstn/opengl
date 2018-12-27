#version 330 core
out vec4 FragColor;
uniform vec3 theColor;
uniform vec3 lightPos;
in vec3 Normal;
in vec3 FragPos;

void main()
{
	vec3 norm = normalize(Normal);
	vec3 lightDir = normalize(lightPos - FragPos);

	float diff = max(dot(norm,lightDir),0.0);
	vec3 diffuseColor = diff * theColor;
	FragColor = vec4(diffuseColor, 1.0);
}
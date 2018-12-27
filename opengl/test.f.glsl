#version 330 core
out vec4 FragColor;
uniform vec3 theColor;
uniform vec3 lightPos;
in vec3 Normal;
in vec3 FragPos;
in vec2 TexCoord;

uniform sampler2D ourTexture;

void main()
{
	vec3 norm = normalize(Normal);
	vec3 lightDir = normalize(lightPos - FragPos);

	float diff = max(dot(norm,lightDir),0.0);
	vec3 ambientColor = vec3(0.2,0.2,0.2);
	vec3 diffuseColor = diff * vec3(1.0,1.0,1.0);
	FragColor = texture(ourTexture, TexCoord)*(vec4(diffuseColor, 1.0)+vec4(0.2,0.2,0.2,0.0));
}
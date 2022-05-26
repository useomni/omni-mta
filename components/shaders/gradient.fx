texture tex;
float4 startColor;
float4 endColor;

sampler Sampler0 = sampler_state
{
    Texture = (tex);
};

float4 PixelShaderFunction(float2 TexCoord : TEXCOORD0) : COLOR
{
	float4 color = tex2D(Sampler0,TexCoord);
	return startColor* (1.0f - TexCoord.x)+endColor * TexCoord.x;
}

technique tec0
{
	pass P0
	{
        PixelShader = compile ps_2_0 PixelShaderFunction();
	}
}

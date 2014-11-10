Shader "Custom/Refraction" 
{
	Properties 
	{
		_Color ("Main Color", Color) = (1,1,1,1)
		_SpecColor ("Specular Color", Color) = (0.5,0.5,0.5,1)
		_Shininess ("Shininess", Range (0.01, 1)) = 0.078125
		_ChromaticDispersion ("_ChromaticDispersion", Range(0.0,4.0)) = 0.1
		_Refraction ("Refraction", Range (0.00, 100.0)) = 1.0
		_ReflToRefrExponent ("_ReflToRefrExponent", Range(0.00,4.00)) = 1.0
		_ReflectColor ("Reflection Color", Color) = (1,1,1,0.5)
		_BumpReflectionStr ("_BumpReflectionStr", Range(0.00,1.00)) = 0.5
		_MainTex ("Base (RGB) RefStrGloss (A)", 2D) = "white" {}
		_ReflectionTex ("_ReflectionTex", CUBE) = "white" {}
		_BumpMap ("Normalmap", 2D) = "bump" {}
		//_Up ("_Up", Vector) = (0,1,0,1)
	}
}

SubShader 
{
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}

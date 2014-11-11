// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:0,limd:1,uamb:False,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:2,dpts:2,wrdp:True,ufog:False,aust:False,igpj:False,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:0,x:33338,y:32442|gloss-76-OUT,transm-29-OUT,lwrap-29-OUT,alpha-22-OUT,refract-14-OUT;n:type:ShaderForge.SFN_Slider,id:13,x:34085,y:32752,ptlb:Refraction Intensity,ptin:_RefractionIntensity,min:0,cur:0.974359,max:1;n:type:ShaderForge.SFN_Multiply,id:14,x:33731,y:32861|A-16-OUT,B-220-OUT;n:type:ShaderForge.SFN_ComponentMask,id:16,x:33847,y:32651,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-25-RGB;n:type:ShaderForge.SFN_Vector1,id:22,x:33677,y:32651,v1:0.3;n:type:ShaderForge.SFN_Tex2d,id:25,x:34085,y:32566,ptlb:Refraction,ptin:_Refraction,tex:80286949e259c2d44876306923857245,ntxv:3,isnm:True|UVIN-27-OUT;n:type:ShaderForge.SFN_TexCoord,id:26,x:34702,y:32354,uv:0;n:type:ShaderForge.SFN_Multiply,id:27,x:34296,y:32338|A-26-UVOUT,B-28-OUT;n:type:ShaderForge.SFN_Vector1,id:28,x:34561,y:32599,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:29,x:33677,y:32577,v1:1;n:type:ShaderForge.SFN_Vector1,id:75,x:33677,y:32430,v1:6;n:type:ShaderForge.SFN_Vector1,id:76,x:33677,y:32486,v1:0.8;n:type:ShaderForge.SFN_Lerp,id:215,x:33847,y:32524|A-216-OUT,B-25-RGB,T-13-OUT;n:type:ShaderForge.SFN_Vector3,id:216,x:34085,y:32445,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Fresnel,id:217,x:33847,y:32284;n:type:ShaderForge.SFN_ConstantLerp,id:219,x:33677,y:32284,a:0.02,b:0.2|IN-217-OUT;n:type:ShaderForge.SFN_Multiply,id:220,x:33995,y:32861|A-13-OUT,B-221-OUT;n:type:ShaderForge.SFN_Vector1,id:221,x:34229,y:32861,v1:0.2;proporder:13-25;pass:END;sub:END;*/

Shader "Shader Forge/Examples/Refraction" {
    Properties {
        _RefractionIntensity ("Refraction Intensity", Range(0, 1)) = 0.974359
        _Refraction ("Refraction", 2D) = "bump" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles xbox360 ps3 flash 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float _RefractionIntensity;
            uniform sampler2D _Refraction; uniform float4 _Refraction_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 screenPos : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 node_26 = i.uv0;
                float2 node_27 = (node_26.rg*0.5);
                float3 node_25 = UnpackNormal(tex2D(_Refraction,TRANSFORM_TEX(node_27, _Refraction)));
                float2 node_14 = (node_25.rgb.rg*(_RefractionIntensity*0.2));
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + node_14;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float3 finalColor = 0;
/// Final Color:
                return fixed4(lerp(sceneColor.rgb, finalColor,0.3),1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

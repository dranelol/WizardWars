// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32529,y:32699|emission-14-OUT;n:type:ShaderForge.SFN_ScreenPos,id:4,x:33812,y:32748,sctp:2;n:type:ShaderForge.SFN_Add,id:5,x:33553,y:32630|A-4-U,B-15-OUT;n:type:ShaderForge.SFN_Append,id:6,x:33355,y:32674|A-5-OUT,B-4-V;n:type:ShaderForge.SFN_Append,id:7,x:33355,y:32810|A-8-OUT,B-4-V;n:type:ShaderForge.SFN_Add,id:8,x:33529,y:32882|A-4-U,B-9-OUT;n:type:ShaderForge.SFN_Negate,id:9,x:33697,y:32961|IN-15-OUT;n:type:ShaderForge.SFN_SceneColor,id:10,x:33118,y:32710|UVIN-6-OUT;n:type:ShaderForge.SFN_SceneColor,id:11,x:33118,y:32846|UVIN-7-OUT;n:type:ShaderForge.SFN_SceneColor,id:12,x:33122,y:32982|UVIN-4-UVOUT;n:type:ShaderForge.SFN_Append,id:13,x:32898,y:32639|A-10-R,B-11-G;n:type:ShaderForge.SFN_Append,id:14,x:32766,y:32763|A-13-OUT,B-12-B;n:type:ShaderForge.SFN_Slider,id:15,x:34436,y:32641,ptlb:Aberration Amount,ptin:_AberrationAmount,min:0,cur:0,max:0.01;n:type:ShaderForge.SFN_Sin,id:30,x:34663,y:32849|IN-36-OUT;n:type:ShaderForge.SFN_Time,id:31,x:35015,y:32702;n:type:ShaderForge.SFN_ConstantClamp,id:32,x:34484,y:32849,min:-1,max:1|IN-30-OUT;n:type:ShaderForge.SFN_Divide,id:33,x:34296,y:32838|A-32-OUT,B-34-OUT;n:type:ShaderForge.SFN_Vector1,id:34,x:34484,y:33077,v1:600;n:type:ShaderForge.SFN_Multiply,id:36,x:34840,y:32788|A-31-T,B-37-OUT;n:type:ShaderForge.SFN_Vector1,id:37,x:35005,y:32875,v1:4;proporder:15;pass:END;sub:END;*/

Shader "Shader Forge/ChromaticAberation" {
    Properties {
        _AberrationAmount ("Aberration Amount", Range(0, 0.01)) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float _AberrationAmount;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 screenPos : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
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
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float2 node_4 = sceneUVs;
                float3 emissive = float3(float2(tex2D(_GrabTexture, float2((node_4.r+_AberrationAmount),node_4.g)).r,tex2D(_GrabTexture, float2((node_4.r+(-1*_AberrationAmount)),node_4.g)).g),tex2D(_GrabTexture, node_4.rg).b);
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

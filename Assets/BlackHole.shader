// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:31820,y:32470|alpha-669-A,refract-829-OUT;n:type:ShaderForge.SFN_TexCoord,id:3,x:34222,y:32692,uv:0;n:type:ShaderForge.SFN_Vector2,id:4,x:34220,y:32857,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:5,x:34025,y:32745|A-3-UVOUT,B-4-OUT;n:type:ShaderForge.SFN_Vector1,id:14,x:34024,y:32883,v1:2;n:type:ShaderForge.SFN_Multiply,id:15,x:33851,y:32745|A-5-OUT,B-14-OUT;n:type:ShaderForge.SFN_Slider,id:20,x:33487,y:32918,ptlb:node_20,ptin:_node_20,min:0,cur:0.3229506,max:1;n:type:ShaderForge.SFN_Multiply,id:22,x:33157,y:32811|A-888-OUT,B-20-OUT,C-655-OUT;n:type:ShaderForge.SFN_Rotator,id:24,x:32966,y:32631|UVIN-646-UVOUT,ANG-22-OUT;n:type:ShaderForge.SFN_Multiply,id:455,x:33487,y:32611|A-15-OUT,B-456-OUT;n:type:ShaderForge.SFN_Vector1,id:456,x:33663,y:32680,v1:1;n:type:ShaderForge.SFN_OneMinus,id:457,x:33310,y:32611|IN-455-OUT;n:type:ShaderForge.SFN_TexCoord,id:646,x:33138,y:32631,uv:0;n:type:ShaderForge.SFN_Tau,id:655,x:33487,y:33014;n:type:ShaderForge.SFN_Tex2d,id:669,x:32560,y:32320,ptlb:node_669,ptin:_node_669,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ComponentMask,id:824,x:32773,y:32631,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-24-UVOUT;n:type:ShaderForge.SFN_Multiply,id:825,x:32560,y:32631|A-457-OUT,B-824-R;n:type:ShaderForge.SFN_Multiply,id:826,x:32560,y:32496|A-457-OUT,B-824-G;n:type:ShaderForge.SFN_Append,id:828,x:32365,y:32580|A-826-OUT,B-825-OUT;n:type:ShaderForge.SFN_Multiply,id:829,x:32137,y:32607|A-669-A,B-828-OUT;n:type:ShaderForge.SFN_OneMinus,id:887,x:33663,y:32745|IN-15-OUT;n:type:ShaderForge.SFN_Clamp01,id:888,x:33487,y:32745|IN-887-OUT;proporder:20-669;pass:END;sub:END;*/

Shader "Shader Forge/BlackHole" {
    Properties {
        _node_20 ("node_20", Range(0, 1)) = 0.3229506
        _node_669 ("node_669", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
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
            uniform float _node_20;
            uniform sampler2D _node_669; uniform float4 _node_669_ST;
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
                float2 node_895 = i.uv0;
                float4 node_669 = tex2D(_node_669,TRANSFORM_TEX(node_895.rg, _node_669));
                float node_15 = (distance(i.uv0.rg,float2(0.5,0.5))*2.0);
                float node_457 = (1.0 - (node_15*1.0));
                float node_24_ang = (saturate((1.0 - node_15))*_node_20*6.28318530718);
                float node_24_spd = 1.0;
                float node_24_cos = cos(node_24_spd*node_24_ang);
                float node_24_sin = sin(node_24_spd*node_24_ang);
                float2 node_24_piv = float2(0.5,0.5);
                float2 node_24 = (mul(i.uv0.rg-node_24_piv,float2x2( node_24_cos, -node_24_sin, node_24_sin, node_24_cos))+node_24_piv);
                float2 node_824 = node_24.rg;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (node_669.a*float2((node_457*node_824.g),(node_457*node_824.r)));
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float3 finalColor = 0;
/// Final Color:
                return fixed4(lerp(sceneColor.rgb, finalColor,node_669.a),1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

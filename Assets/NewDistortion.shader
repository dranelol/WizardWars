// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32549,y:32702|emission-36-RGB,alpha-24-OUT;n:type:ShaderForge.SFN_TexCoord,id:14,x:34206,y:32661,uv:0;n:type:ShaderForge.SFN_Distance,id:18,x:34003,y:32731|A-14-UVOUT,B-19-OUT;n:type:ShaderForge.SFN_Vector2,id:19,x:34217,y:32825,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Vector1,id:24,x:32905,y:32968,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:26,x:34003,y:32349|A-27-OUT,B-14-UVOUT;n:type:ShaderForge.SFN_Vector1,id:27,x:34192,y:32270,v1:0;n:type:ShaderForge.SFN_Multiply,id:29,x:34003,y:32514|A-30-OUT,B-14-UVOUT;n:type:ShaderForge.SFN_Vector1,id:30,x:34225,y:32439,v1:1;n:type:ShaderForge.SFN_Power,id:33,x:33594,y:32618|VAL-38-OUT,EXP-34-OUT;n:type:ShaderForge.SFN_Vector1,id:34,x:33835,y:32674,v1:-1;n:type:ShaderForge.SFN_Lerp,id:35,x:33520,y:32381|A-19-OUT,B-29-OUT,T-33-OUT;n:type:ShaderForge.SFN_Tex2d,id:36,x:32936,y:32547,ptlb:node_36,ptin:_node_36,tex:acbd817afdd1f874b8aa11f145712557,ntxv:0,isnm:False|UVIN-41-OUT;n:type:ShaderForge.SFN_Multiply,id:38,x:33835,y:32792|A-18-OUT,B-39-OUT;n:type:ShaderForge.SFN_Vector1,id:39,x:34024,y:32907,v1:1.5;n:type:ShaderForge.SFN_Add,id:41,x:33357,y:32490|A-35-OUT,B-43-OUT;n:type:ShaderForge.SFN_OneMinus,id:43,x:33594,y:32792|IN-38-OUT;proporder:36;pass:END;sub:END;*/

Shader "Shader Forge/NewDistortion" {
    Properties {
        _node_36 ("node_36", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
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
            uniform sampler2D _node_36; uniform float4 _node_36_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float2 node_19 = float2(0.5,0.5);
                float2 node_14 = i.uv0;
                float node_18 = distance(node_14.rg,node_19);
                float node_38 = (node_18*1.5);
                float2 node_35 = lerp(node_19,(1.0*node_14.rg),pow(node_38,(-1.0)));
                float2 node_41 = (node_35+(1.0 - node_38));
                float3 emissive = tex2D(_node_36,TRANSFORM_TEX(node_41, _node_36)).rgb;
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,0.5);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

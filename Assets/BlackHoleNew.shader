// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:0,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:30805,y:32436|custl-50-OUT;n:type:ShaderForge.SFN_TexCoord,id:2,x:34292,y:32822,uv:0;n:type:ShaderForge.SFN_OneMinus,id:4,x:33812,y:32886|IN-5-OUT;n:type:ShaderForge.SFN_Length,id:5,x:33996,y:32886|IN-8-OUT;n:type:ShaderForge.SFN_Subtract,id:6,x:33996,y:33028|A-2-UVOUT,B-10-OUT;n:type:ShaderForge.SFN_Divide,id:7,x:33812,y:33028|A-6-OUT,B-10-OUT;n:type:ShaderForge.SFN_Abs,id:8,x:33607,y:33028|IN-7-OUT;n:type:ShaderForge.SFN_Clamp01,id:9,x:33607,y:32886|IN-4-OUT;n:type:ShaderForge.SFN_Vector1,id:10,x:34182,y:33109,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:11,x:33398,y:32675|A-13-UVOUT,B-12-OUT;n:type:ShaderForge.SFN_Vector1,id:12,x:33398,y:32610,v1:0.5;n:type:ShaderForge.SFN_Rotator,id:13,x:33607,y:32675|UVIN-2-UVOUT,ANG-15-OUT;n:type:ShaderForge.SFN_Multiply,id:14,x:33295,y:32882|A-9-OUT,B-16-OUT;n:type:ShaderForge.SFN_Add,id:15,x:33116,y:32882|A-14-OUT,B-20-OUT;n:type:ShaderForge.SFN_Slider,id:16,x:33515,y:33159,ptlb:TwirlAmt,ptin:_TwirlAmt,min:-8,cur:2.735043,max:8;n:type:ShaderForge.SFN_Multiply,id:17,x:33369,y:33223|A-22-T,B-23-OUT;n:type:ShaderForge.SFN_Frac,id:19,x:33188,y:33223|IN-17-OUT;n:type:ShaderForge.SFN_Multiply,id:20,x:33001,y:33223|A-19-OUT,B-24-OUT;n:type:ShaderForge.SFN_Time,id:22,x:33651,y:33225;n:type:ShaderForge.SFN_Slider,id:23,x:33609,y:33391,ptlb:SpinSpeed,ptin:_SpinSpeed,min:-1,cur:-0.06837607,max:1;n:type:ShaderForge.SFN_Tau,id:24,x:33188,y:33390;n:type:ShaderForge.SFN_Divide,id:25,x:33191,y:32675|A-11-OUT,B-12-OUT;n:type:ShaderForge.SFN_Abs,id:26,x:33021,y:32675|IN-25-OUT;n:type:ShaderForge.SFN_ComponentMask,id:27,x:32829,y:32675,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-26-OUT;n:type:ShaderForge.SFN_ArcTan2,id:29,x:32612,y:32675|A-27-G,B-27-R;n:type:ShaderForge.SFN_Multiply,id:30,x:32402,y:32675|A-29-OUT,B-31-OUT;n:type:ShaderForge.SFN_Slider,id:31,x:32663,y:32862,ptlb:Arms,ptin:_Arms,min:0,cur:1.34188,max:3;n:type:ShaderForge.SFN_Frac,id:33,x:32663,y:32961|IN-30-OUT;n:type:ShaderForge.SFN_Clamp01,id:34,x:32501,y:32979|IN-33-OUT;n:type:ShaderForge.SFN_RemapRange,id:35,x:32324,y:32979,frmn:0,frmx:1,tomn:-1,tomx:1|IN-34-OUT;n:type:ShaderForge.SFN_Abs,id:37,x:32163,y:32979|IN-35-OUT;n:type:ShaderForge.SFN_Multiply,id:38,x:31983,y:32840|A-9-OUT,B-37-OUT;n:type:ShaderForge.SFN_Power,id:39,x:31983,y:32662|VAL-9-OUT,EXP-40-OUT;n:type:ShaderForge.SFN_Slider,id:40,x:32135,y:32503,ptlb:CenterPower,ptin:_CenterPower,min:0.5,cur:1.333333,max:3;n:type:ShaderForge.SFN_Add,id:41,x:31790,y:32725|A-39-OUT,B-38-OUT;n:type:ShaderForge.SFN_Clamp01,id:42,x:31596,y:32735|IN-41-OUT;n:type:ShaderForge.SFN_Multiply,id:43,x:31364,y:33023|A-42-OUT,B-44-OUT;n:type:ShaderForge.SFN_Slider,id:44,x:31518,y:33179,ptlb:RefractStrength,ptin:_RefractStrength,min:0.01,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:45,x:31173,y:33023|A-43-OUT,B-43-OUT;n:type:ShaderForge.SFN_ScreenPos,id:46,x:31364,y:32853,sctp:2;n:type:ShaderForge.SFN_Rotator,id:47,x:31163,y:32853|UVIN-46-UVOUT,ANG-45-OUT;n:type:ShaderForge.SFN_SceneColor,id:48,x:31364,y:32706|UVIN-47-UVOUT;n:type:ShaderForge.SFN_Clamp01,id:49,x:31163,y:32706|IN-48-RGB;n:type:ShaderForge.SFN_Lerp,id:50,x:31163,y:32552|A-49-OUT,B-51-RGB,T-42-OUT;n:type:ShaderForge.SFN_Color,id:51,x:31163,y:32388,ptlb:Color,ptin:_Color,glob:False,c1:0.3,c2:0,c3:0,c4:1;proporder:16-23-31-40-44-51;pass:END;sub:END;*/

Shader "Shader Forge/BlackHoleNew" {
    Properties {
        _TwirlAmt ("TwirlAmt", Range(-8, 8)) = 2.735043
        _SpinSpeed ("SpinSpeed", Range(-1, 1)) = -0.06837607
        _Arms ("Arms", Range(0, 3)) = 1.34188
        _CenterPower ("CenterPower", Range(0.5, 3)) = 1.333333
        _RefractStrength ("RefractStrength", Range(0.01, 1)) = 1
        _Color ("Color", Color) = (0.3,0,0,1)
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
            uniform float4 _TimeEditor;
            uniform float _TwirlAmt;
            uniform float _SpinSpeed;
            uniform float _Arms;
            uniform float _CenterPower;
            uniform float _RefractStrength;
            uniform float4 _Color;
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
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
                float2 node_2 = i.uv0;
                float node_10 = 0.5;
                float node_9 = saturate((1.0 - length(abs(((node_2.rg-node_10)/node_10)))));
                float4 node_22 = _Time + _TimeEditor;
                float node_13_ang = ((node_9*_TwirlAmt)+(frac((node_22.g*_SpinSpeed))*6.28318530718));
                float node_13_spd = 1.0;
                float node_13_cos = cos(node_13_spd*node_13_ang);
                float node_13_sin = sin(node_13_spd*node_13_ang);
                float2 node_13_piv = float2(0.5,0.5);
                float2 node_13 = (mul(node_2.rg-node_13_piv,float2x2( node_13_cos, -node_13_sin, node_13_sin, node_13_cos))+node_13_piv);
                float node_12 = 0.5;
                float2 node_27 = abs(((node_13-node_12)/node_12)).rg;
                float node_42 = saturate((pow(node_9,_CenterPower)+(node_9*abs((saturate(frac((atan2(node_27.g,node_27.r)*_Arms)))*2.0+-1.0)))));
                float node_43 = (node_42*_RefractStrength);
                float node_47_ang = (node_43*node_43);
                float node_47_spd = 1.0;
                float node_47_cos = cos(node_47_spd*node_47_ang);
                float node_47_sin = sin(node_47_spd*node_47_ang);
                float2 node_47_piv = float2(0.5,0.5);
                float2 node_47 = (mul(sceneUVs.rg-node_47_piv,float2x2( node_47_cos, -node_47_sin, node_47_sin, node_47_cos))+node_47_piv);
                float3 finalColor = lerp(saturate(tex2D(_GrabTexture, node_47).rgb),_Color.rgb,node_42);
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

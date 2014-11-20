// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32543,y:32759|diff-580-RGB,alpha-580-A,refract-465-OUT;n:type:ShaderForge.SFN_TexCoord,id:3,x:34693,y:33025,uv:0;n:type:ShaderForge.SFN_Vector2,id:4,x:34693,y:33203,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Distance,id:5,x:34522,y:33147|A-3-UVOUT,B-4-OUT;n:type:ShaderForge.SFN_Vector1,id:14,x:34546,y:33317,v1:2;n:type:ShaderForge.SFN_Multiply,id:15,x:34379,y:33244|A-5-OUT,B-14-OUT;n:type:ShaderForge.SFN_OneMinus,id:16,x:34152,y:33287|IN-15-OUT;n:type:ShaderForge.SFN_Clamp01,id:17,x:33975,y:33287|IN-16-OUT;n:type:ShaderForge.SFN_Slider,id:20,x:34059,y:33767,ptlb:node_20,ptin:_node_20,min:1,cur:1.810791,max:10;n:type:ShaderForge.SFN_Tau,id:21,x:34110,y:33630;n:type:ShaderForge.SFN_Multiply,id:22,x:33745,y:33450|A-17-OUT,B-38-OUT,C-21-OUT,D-20-OUT;n:type:ShaderForge.SFN_Rotator,id:24,x:33563,y:33273|UVIN-3-UVOUT,ANG-22-OUT;n:type:ShaderForge.SFN_Sin,id:38,x:34285,y:33545|IN-39-TTR;n:type:ShaderForge.SFN_Time,id:39,x:34601,y:33670;n:type:ShaderForge.SFN_Vector1,id:402,x:32862,y:32839,v1:0;n:type:ShaderForge.SFN_Multiply,id:455,x:33401,y:33056|A-15-OUT,B-456-OUT;n:type:ShaderForge.SFN_Vector1,id:456,x:33620,y:33157,v1:1.2;n:type:ShaderForge.SFN_OneMinus,id:457,x:33121,y:32934|IN-455-OUT;n:type:ShaderForge.SFN_ComponentMask,id:459,x:33318,y:33269,cc1:1,cc2:0,cc3:-1,cc4:-1|IN-24-UVOUT;n:type:ShaderForge.SFN_Multiply,id:461,x:33144,y:33136|A-457-OUT,B-459-R;n:type:ShaderForge.SFN_Multiply,id:464,x:33122,y:33298|A-457-OUT,B-459-G;n:type:ShaderForge.SFN_Append,id:465,x:32965,y:33184|A-461-OUT,B-464-OUT;n:type:ShaderForge.SFN_Tex2d,id:466,x:33240,y:32650,ptlb:node_466,ptin:_node_466,tex:7bb91c50e0c30a444aad41c42750c406,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:537,x:34116,y:33024,ptlb:node_537,ptin:_node_537,tex:144320da2c130914ab48edac6e33b494,ntxv:0,isnm:False|UVIN-3-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:580,x:33068,y:32746,ptlb:node_580,ptin:_node_580,tex:7bb91c50e0c30a444aad41c42750c406,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Clamp01,id:602,x:32946,y:32655|IN-466-A;proporder:20-466-537-580;pass:END;sub:END;*/

Shader "Shader Forge/BlackHole" {
    Properties {
        _node_20 ("node_20", Range(1, 10)) = 1.810791
        _node_466 ("node_466", 2D) = "white" {}
        _node_537 ("node_537", 2D) = "white" {}
        _node_580 ("node_580", 2D) = "white" {}
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
            uniform float4 _LightColor0;
            uniform sampler2D _GrabTexture;
            uniform float4 _TimeEditor;
            uniform float _node_20;
            uniform sampler2D _node_580; uniform float4 _node_580_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 screenPos : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
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
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 node_3 = i.uv0;
                float node_15 = (distance(node_3.rg,float2(0.5,0.5))*2.0);
                float node_457 = (1.0 - (node_15*1.2));
                float4 node_39 = _Time + _TimeEditor;
                float node_24_ang = (saturate((1.0 - node_15))*sin(node_39.a)*6.28318530718*_node_20);
                float node_24_spd = 1.0;
                float node_24_cos = cos(node_24_spd*node_24_ang);
                float node_24_sin = sin(node_24_spd*node_24_ang);
                float2 node_24_piv = float2(0.5,0.5);
                float2 node_24 = (mul(node_3.rg-node_24_piv,float2x2( node_24_cos, -node_24_sin, node_24_sin, node_24_cos))+node_24_piv);
                float2 node_459 = node_24.gr;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + float2((node_457*node_459.r),(node_457*node_459.g));
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float2 node_624 = i.uv0;
                float4 node_580 = tex2D(_node_580,TRANSFORM_TEX(node_624.rg, _node_580));
                finalColor += diffuseLight * node_580.rgb;
/// Final Color:
                return fixed4(lerp(sceneColor.rgb, finalColor,node_580.a),1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _GrabTexture;
            uniform float4 _TimeEditor;
            uniform float _node_20;
            uniform sampler2D _node_580; uniform float4 _node_580_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 screenPos : TEXCOORD3;
                LIGHTING_COORDS(4,5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float2 node_3 = i.uv0;
                float node_15 = (distance(node_3.rg,float2(0.5,0.5))*2.0);
                float node_457 = (1.0 - (node_15*1.2));
                float4 node_39 = _Time + _TimeEditor;
                float node_24_ang = (saturate((1.0 - node_15))*sin(node_39.a)*6.28318530718*_node_20);
                float node_24_spd = 1.0;
                float node_24_cos = cos(node_24_spd*node_24_ang);
                float node_24_sin = sin(node_24_spd*node_24_ang);
                float2 node_24_piv = float2(0.5,0.5);
                float2 node_24 = (mul(node_3.rg-node_24_piv,float2x2( node_24_cos, -node_24_sin, node_24_sin, node_24_cos))+node_24_piv);
                float2 node_459 = node_24.gr;
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + float2((node_457*node_459.r),(node_457*node_459.g));
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL) * attenColor;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                float2 node_625 = i.uv0;
                float4 node_580 = tex2D(_node_580,TRANSFORM_TEX(node_625.rg, _node_580));
                finalColor += diffuseLight * node_580.rgb;
/// Final Color:
                return fixed4(finalColor * node_580.a,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:31848,y:32568|diff-211-OUT;n:type:ShaderForge.SFN_Tex2d,id:22,x:33263,y:32084,ptlb:LargeSphere,ptin:_LargeSphere,tex:3a5a96df060a5cf4a9cc0c59e13486b7,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:24,x:33084,y:32258|A-22-R,B-155-OUT;n:type:ShaderForge.SFN_TexCoord,id:27,x:33084,y:32084,uv:0;n:type:ShaderForge.SFN_Add,id:29,x:32893,y:32220|A-27-UVOUT,B-24-OUT;n:type:ShaderForge.SFN_Panner,id:30,x:32716,y:32220,spu:1,spv:1|UVIN-29-OUT;n:type:ShaderForge.SFN_TexCoord,id:35,x:34272,y:32212,uv:0;n:type:ShaderForge.SFN_Subtract,id:39,x:33354,y:32406|A-54-OUT,B-40-OUT;n:type:ShaderForge.SFN_Vector1,id:40,x:33749,y:32539,v1:0.5;n:type:ShaderForge.SFN_Append,id:54,x:33901,y:32225|A-35-U,B-55-OUT;n:type:ShaderForge.SFN_OneMinus,id:55,x:34093,y:32327|IN-35-V;n:type:ShaderForge.SFN_Multiply,id:56,x:33249,y:32566|A-39-OUT,B-57-OUT;n:type:ShaderForge.SFN_Vector1,id:57,x:33517,y:32662,v1:-1;n:type:ShaderForge.SFN_Multiply,id:60,x:33081,y:32676|A-56-OUT,B-65-OUT;n:type:ShaderForge.SFN_Add,id:62,x:32917,y:32729|A-60-OUT,B-63-OUT;n:type:ShaderForge.SFN_Vector1,id:63,x:33081,y:32823,v1:0.5;n:type:ShaderForge.SFN_ConstantClamp,id:65,x:33260,y:32779,min:0,max:1|IN-68-OUT;n:type:ShaderForge.SFN_Tex2d,id:66,x:33887,y:33010,ptlb:CoreTex,ptin:_CoreTex,tex:e976c6d3ebc1e4a85aa7186a3192d8c5,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:67,x:33663,y:32956,v1:2;n:type:ShaderForge.SFN_Multiply,id:68,x:33472,y:32802|A-66-R,B-67-OUT;n:type:ShaderForge.SFN_Multiply,id:70,x:33663,y:33111|A-66-R,B-71-OUT;n:type:ShaderForge.SFN_Vector1,id:71,x:33919,y:33210,v1:3;n:type:ShaderForge.SFN_Vector1,id:72,x:33919,y:33320,v1:2;n:type:ShaderForge.SFN_Multiply,id:73,x:33663,y:33259|A-66-R,B-72-OUT;n:type:ShaderForge.SFN_Clamp01,id:74,x:33417,y:33111|IN-70-OUT;n:type:ShaderForge.SFN_Clamp01,id:75,x:33417,y:33259|IN-73-OUT;n:type:ShaderForge.SFN_OneMinus,id:76,x:32457,y:32903|IN-75-OUT;n:type:ShaderForge.SFN_Slider,id:155,x:33275,y:32323,ptlb:HoleSize,ptin:_HoleSize,min:0,cur:0.4816947,max:1;n:type:ShaderForge.SFN_Panner,id:157,x:32710,y:32729,spu:1,spv:1|UVIN-62-OUT;n:type:ShaderForge.SFN_TexCoord,id:186,x:35104,y:32378,uv:0;n:type:ShaderForge.SFN_Append,id:191,x:34557,y:32428|A-186-U,B-192-OUT;n:type:ShaderForge.SFN_OneMinus,id:192,x:34722,y:32512|IN-193-OUT;n:type:ShaderForge.SFN_Multiply,id:193,x:34900,y:32543|A-186-V,B-194-OUT;n:type:ShaderForge.SFN_Vector1,id:194,x:35104,y:32593,v1:0.8;n:type:ShaderForge.SFN_Subtract,id:195,x:34255,y:32577|A-201-UVOUT,B-196-OUT;n:type:ShaderForge.SFN_Vector1,id:196,x:34585,y:32598,v1:-0.5;n:type:ShaderForge.SFN_Multiply,id:197,x:34422,y:32770|A-195-OUT,B-195-OUT;n:type:ShaderForge.SFN_ComponentMask,id:198,x:34213,y:32739,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-197-OUT;n:type:ShaderForge.SFN_ComponentMask,id:199,x:34213,y:32895,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-197-OUT;n:type:ShaderForge.SFN_Add,id:200,x:34031,y:32775|A-198-OUT,B-199-OUT;n:type:ShaderForge.SFN_TexCoord,id:201,x:34351,y:32382,uv:0;n:type:ShaderForge.SFN_SceneColor,id:209,x:32461,y:32566|UVIN-157-UVOUT;n:type:ShaderForge.SFN_SceneColor,id:210,x:32461,y:32426|UVIN-30-UVOUT;n:type:ShaderForge.SFN_Lerp,id:211,x:32195,y:32716|A-210-RGB,B-209-RGB,T-76-OUT;proporder:66-22-155;pass:END;sub:END;*/

Shader "Shader Forge/BlackHole" {
    Properties {
        _CoreTex ("CoreTex", 2D) = "white" {}
        _LargeSphere ("LargeSphere", 2D) = "white" {}
        _HoleSize ("HoleSize", Range(0, 1)) = 0.4816947
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
            uniform sampler2D _LargeSphere; uniform float4 _LargeSphere_ST;
            uniform sampler2D _CoreTex; uniform float4 _CoreTex_ST;
            uniform float _HoleSize;
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
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
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
                float4 node_229 = _Time + _TimeEditor;
                float2 node_228 = i.uv0;
                float2 node_30 = ((i.uv0.rg+(tex2D(_LargeSphere,TRANSFORM_TEX(node_228.rg, _LargeSphere)).r*_HoleSize))+node_229.g*float2(1,1));
                float2 node_35 = i.uv0;
                float4 node_66 = tex2D(_CoreTex,TRANSFORM_TEX(node_228.rg, _CoreTex));
                float2 node_62 = ((((float2(node_35.r,(1.0 - node_35.g))-0.5)*(-1.0))*clamp((node_66.r*2.0),0,1))+0.5);
                float2 node_157 = (node_62+node_229.g*float2(1,1));
                float node_76 = (1.0 - saturate((node_66.r*2.0)));
                finalColor += diffuseLight * lerp(tex2D(_GrabTexture, node_30).rgb,tex2D(_GrabTexture, node_157).rgb,node_76);
/// Final Color:
                return fixed4(finalColor,1);
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
            uniform sampler2D _LargeSphere; uniform float4 _LargeSphere_ST;
            uniform sampler2D _CoreTex; uniform float4 _CoreTex_ST;
            uniform float _HoleSize;
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
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
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
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5;
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
                float4 node_231 = _Time + _TimeEditor;
                float2 node_230 = i.uv0;
                float2 node_30 = ((i.uv0.rg+(tex2D(_LargeSphere,TRANSFORM_TEX(node_230.rg, _LargeSphere)).r*_HoleSize))+node_231.g*float2(1,1));
                float2 node_35 = i.uv0;
                float4 node_66 = tex2D(_CoreTex,TRANSFORM_TEX(node_230.rg, _CoreTex));
                float2 node_62 = ((((float2(node_35.r,(1.0 - node_35.g))-0.5)*(-1.0))*clamp((node_66.r*2.0),0,1))+0.5);
                float2 node_157 = (node_62+node_231.g*float2(1,1));
                float node_76 = (1.0 - saturate((node_66.r*2.0)));
                finalColor += diffuseLight * lerp(tex2D(_GrabTexture, node_30).rgb,tex2D(_GrabTexture, node_157).rgb,node_76);
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

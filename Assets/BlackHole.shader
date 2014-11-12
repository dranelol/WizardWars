// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:31838,y:33308|diff-457-OUT,alpha-108-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6,x:34806,y:32846,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-294-OUT;n:type:ShaderForge.SFN_Abs,id:7,x:34313,y:32843|IN-363-OUT;n:type:ShaderForge.SFN_Multiply,id:8,x:34139,y:32881|A-7-OUT,B-9-OUT;n:type:ShaderForge.SFN_Vector1,id:9,x:34332,y:32995,v1:3;n:type:ShaderForge.SFN_ComponentMask,id:10,x:34806,y:33048,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-294-OUT;n:type:ShaderForge.SFN_Abs,id:14,x:34343,y:33093|IN-364-OUT;n:type:ShaderForge.SFN_Multiply,id:16,x:34139,y:33081|A-14-OUT,B-9-OUT;n:type:ShaderForge.SFN_Append,id:17,x:33090,y:33112|A-8-OUT,B-16-OUT;n:type:ShaderForge.SFN_Vector1,id:21,x:33120,y:33297,v1:3;n:type:ShaderForge.SFN_Divide,id:22,x:32910,y:33277|A-17-OUT,B-21-OUT;n:type:ShaderForge.SFN_Multiply,id:24,x:33503,y:33542|A-125-R,B-25-OUT;n:type:ShaderForge.SFN_Vector1,id:25,x:33702,y:33646,v1:2;n:type:ShaderForge.SFN_Add,id:28,x:32634,y:33407|A-22-OUT,B-144-OUT;n:type:ShaderForge.SFN_TexCoord,id:42,x:35580,y:32902,uv:0;n:type:ShaderForge.SFN_ConstantClamp,id:45,x:33329,y:33465,min:0,max:1|IN-24-OUT;n:type:ShaderForge.SFN_Vector1,id:108,x:32104,y:33530,v1:0.7;n:type:ShaderForge.SFN_Tex2dAsset,id:124,x:32836,y:34120,ptlb:CoreTex,ptin:_CoreTex,glob:False,tex:e976c6d3ebc1e4a85aa7186a3192d8c5;n:type:ShaderForge.SFN_Tex2d,id:125,x:33747,y:33443,tex:e976c6d3ebc1e4a85aa7186a3192d8c5,ntxv:0,isnm:False|TEX-124-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:126,x:33033,y:34120,ptlb:BlackHole,ptin:_BlackHole,glob:False,tex:3a5a96df060a5cf4a9cc0c59e13486b7;n:type:ShaderForge.SFN_Tex2d,id:127,x:33761,y:32507,tex:3a5a96df060a5cf4a9cc0c59e13486b7,ntxv:0,isnm:False|TEX-126-TEX;n:type:ShaderForge.SFN_Multiply,id:128,x:33566,y:32618|A-127-R,B-129-OUT;n:type:ShaderForge.SFN_Vector1,id:129,x:33761,y:32718,v1:0.3;n:type:ShaderForge.SFN_TexCoord,id:133,x:33567,y:32476,uv:0;n:type:ShaderForge.SFN_Add,id:134,x:32634,y:33222|A-133-UVOUT,B-128-OUT;n:type:ShaderForge.SFN_Tex2d,id:137,x:33391,y:33733,tex:e976c6d3ebc1e4a85aa7186a3192d8c5,ntxv:0,isnm:False|TEX-124-TEX;n:type:ShaderForge.SFN_Multiply,id:138,x:33196,y:33790|A-137-R,B-139-OUT;n:type:ShaderForge.SFN_Vector1,id:139,x:33391,y:33880,v1:3;n:type:ShaderForge.SFN_Multiply,id:140,x:33208,y:33940|A-137-R,B-141-OUT;n:type:ShaderForge.SFN_Vector1,id:141,x:33391,y:33974,v1:2;n:type:ShaderForge.SFN_ConstantClamp,id:142,x:32972,y:33757,min:0,max:1|IN-138-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:143,x:32972,y:33911,min:0,max:1|IN-140-OUT;n:type:ShaderForge.SFN_OneMinus,id:144,x:32737,y:33911|IN-143-OUT;n:type:ShaderForge.SFN_Lerp,id:177,x:32395,y:33516|A-134-OUT,B-28-OUT,T-142-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:287,x:33190,y:34153,ptlb:TestTex,ptin:_TestTex,glob:False,tex:acbd817afdd1f874b8aa11f145712557;n:type:ShaderForge.SFN_Tex2d,id:288,x:32567,y:32927,tex:acbd817afdd1f874b8aa11f145712557,ntxv:0,isnm:False|UVIN-417-OUT,TEX-287-TEX;n:type:ShaderForge.SFN_Multiply,id:294,x:34996,y:32907|A-337-OUT,B-295-OUT;n:type:ShaderForge.SFN_Vector1,id:295,x:35223,y:33175,v1:1;n:type:ShaderForge.SFN_Append,id:337,x:35152,y:32907|A-42-U,B-338-OUT;n:type:ShaderForge.SFN_OneMinus,id:338,x:35369,y:33000|IN-42-V;n:type:ShaderForge.SFN_Subtract,id:363,x:34522,y:32843|A-6-OUT,B-365-OUT;n:type:ShaderForge.SFN_Subtract,id:364,x:34522,y:33093|A-10-OUT,B-365-OUT;n:type:ShaderForge.SFN_Vector1,id:365,x:34670,y:33001,v1:0.5;n:type:ShaderForge.SFN_Divide,id:376,x:33918,y:32947|A-16-OUT,B-8-OUT;n:type:ShaderForge.SFN_ArcTan,id:377,x:33747,y:32947|IN-376-OUT;n:type:ShaderForge.SFN_Divide,id:378,x:33559,y:32947|A-377-OUT,B-379-OUT;n:type:ShaderForge.SFN_Pi,id:379,x:33682,y:33102;n:type:ShaderForge.SFN_Append,id:399,x:34840,y:33309|A-8-OUT,B-16-OUT;n:type:ShaderForge.SFN_Dot,id:400,x:34621,y:33309,dt:0|A-399-OUT,B-399-OUT;n:type:ShaderForge.SFN_Sqrt,id:401,x:33549,y:32350|IN-400-OUT;n:type:ShaderForge.SFN_Append,id:417,x:33015,y:32969|A-378-OUT,B-401-OUT;n:type:ShaderForge.SFN_SceneColor,id:419,x:32341,y:33101|UVIN-417-OUT;n:type:ShaderForge.SFN_TexCoord,id:427,x:34331,y:32159,uv:0;n:type:ShaderForge.SFN_Vector1,id:430,x:34331,y:32089,v1:0.6;n:type:ShaderForge.SFN_Vector1,id:431,x:34331,y:32390,v1:0.3;n:type:ShaderForge.SFN_Multiply,id:432,x:34100,y:32000|A-437-OUT,B-430-OUT;n:type:ShaderForge.SFN_Multiply,id:433,x:34100,y:32436|A-438-OUT,B-431-OUT;n:type:ShaderForge.SFN_Multiply,id:436,x:34100,y:32159|A-437-OUT,B-427-UVOUT;n:type:ShaderForge.SFN_Slider,id:437,x:34296,y:31989,ptlb:Scale0,ptin:_Scale0,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:438,x:34297,y:32320,ptlb:Scale1,ptin:_Scale1,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:439,x:34100,y:32291|A-427-UVOUT,B-438-OUT;n:type:ShaderForge.SFN_Subtract,id:443,x:33936,y:32136|A-430-OUT,B-436-OUT;n:type:ShaderForge.SFN_Subtract,id:444,x:33936,y:32291|A-439-OUT,B-431-OUT;n:type:ShaderForge.SFN_Subtract,id:445,x:33742,y:32009|A-432-OUT,B-443-OUT;n:type:ShaderForge.SFN_Subtract,id:446,x:33936,y:32414|A-433-OUT,B-431-OUT;n:type:ShaderForge.SFN_Subtract,id:447,x:33746,y:32334|A-444-OUT,B-446-OUT;n:type:ShaderForge.SFN_Lerp,id:448,x:33032,y:32063|A-445-OUT,B-447-OUT,T-451-OUT;n:type:ShaderForge.SFN_Multiply,id:451,x:33227,y:32234|A-401-OUT,B-452-OUT;n:type:ShaderForge.SFN_Vector1,id:452,x:33420,y:32400,v1:-1;n:type:ShaderForge.SFN_Fresnel,id:457,x:32143,y:32912;proporder:124-126-287;pass:END;sub:END;*/

Shader "Shader Forge/BlackHole" {
    Properties {
        _CoreTex ("CoreTex", 2D) = "white" {}
        _BlackHole ("BlackHole", 2D) = "white" {}
        _TestTex ("TestTex", 2D) = "white" {}
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
            uniform float4 _LightColor0;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
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
                float node_457 = (1.0-max(0,dot(normalDirection, viewDirection)));
                finalColor += diffuseLight * float3(node_457,node_457,node_457);
/// Final Color:
                return fixed4(finalColor,0.7);
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
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
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
                float node_457 = (1.0-max(0,dot(normalDirection, viewDirection)));
                finalColor += diffuseLight * float3(node_457,node_457,node_457);
/// Final Color:
                return fixed4(finalColor * 0.7,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

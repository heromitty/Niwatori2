Shader "Niwatori/color"
{
	Properties
	{
		_Color ("Color", Color) = (1,1,1,1)
	}
	SubShader
	{
		//タグ	いつどのようにしてレンダリングエンジンでレンダリングするかを示します。
		//	Queueタグ：レンダリング順指定
		//		・Geometry	不透明なジオメトリはこのキューを使用します。
		Tags { "Queue"="Geometry" }
		LOD 100
		Cull Off 
		Blend SrcAlpha OneMinusSrcAlpha
		ZWrite On
		//ZTest Always
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			fixed4 _Color;

			struct ApplyData
			{
				float4 vertex : POSITION;
			};

			struct InputVertex
			{
				float4 vertex : SV_POSITION;
			};

			InputVertex vert (ApplyData v)
			{
				InputVertex o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				return o;
			}
			
			fixed4 frag (InputVertex i) : SV_Target
			{
				return _Color;
			}
			ENDCG
		}
	}
}

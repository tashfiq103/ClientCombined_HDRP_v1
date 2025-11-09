void WorldPosToUV_Triplanar_float(float3 worldPos, float3 worldNormal, float scale, float2 offset, out float2 UV)
{
    float3 projNormal = saturate(pow(worldNormal * 1.4, 4));

    float2 x = frac(worldPos.zy * scale) * abs(worldNormal.x);
    float2 y = frac(worldPos.zx * scale) * abs(worldNormal.y);
    float2 z = frac(worldPos.xy * scale) * abs(worldNormal.z);

    UV = z;
    UV = lerp(UV, x, projNormal.x);
    UV = lerp(UV, y, projNormal.y);

    // float3 w = abs(worldNormal) + 1e-6;       // avoid zero
    // w /= (w.x + w.y + w.z);                  // normalize weights

    // float2 uvX = worldPos.yz * scale + offset; // projection for X-axis (use Y,Z)
    // float2 uvY = worldPos.xz * scale + offset; // projection for Y-axis (use X,Z)
    // float2 uvZ = worldPos.xy * scale + offset; // projection for Z-axis (use X,Y)

    // UV = uvX * w.x + uvY * w.y + uvZ * w.z;
}
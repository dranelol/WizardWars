using UnityEngine;
using System.Collections;

public class CombatMath : MonoBehaviour 
{
    public static Vector3 GetCenter(Transform entityTransform)
    {
        return entityTransform.transform.TransformPoint(entityTransform.GetComponent<CapsuleCollider>().center);
    }

    public static Vector3 ForwardRayCastToMouse(Vector3 origin)
    {
        int terrainMask = LayerMask.NameToLayer("Terrain");
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit rayCastTarget;
        Physics.Raycast(ray, out rayCastTarget, Mathf.Infinity, 1 << terrainMask);
        Vector3 vectorToMouse = rayCastTarget.point - origin;
        Vector3 forward = new Vector3(vectorToMouse.x, origin.y, vectorToMouse.z).normalized;

        return forward;
    }

    public static bool DistanceGreaterThan(Vector3 positionA, Vector3 positionB, float distance)
    {
        return (positionB - positionA).sqrMagnitude > distance * distance;
    }

    public static bool DistanceLessThan(Vector3 positionA, Vector3 positionB, float distance)
    {
        return (positionB - positionA).sqrMagnitude < distance * distance;
    }

    public static bool DistanceGreaterThanEqual(Vector3 positionA, Vector3 positionB, float distance)
    {
        return (positionB - positionA).sqrMagnitude >= distance * distance;
    }

    public static bool DistanceLessThanEqual(Vector3 positionA, Vector3 positionB, float distance)
    {
        return (positionB - positionA).sqrMagnitude <= distance * distance;
    }
}

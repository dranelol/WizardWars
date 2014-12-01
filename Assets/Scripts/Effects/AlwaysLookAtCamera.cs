using UnityEngine;
using System.Collections;

public class AlwaysLookAtCamera : MonoBehaviour 
{
    Transform mainCam;
	// Use this for initialization
	void Start () 
    {
        mainCam = Camera.main.transform;
	}
	
	// Update is called once per frame
	void Update () 
    {
        transform.rotation = Quaternion.LookRotation(-1 *(mainCam.position - transform.position).normalized);
	}   
}

using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ProjectileBehaviour : MonoBehaviour 
{

    /// <summary>
    /// If this projectile needs a target, this is it
    /// </summary>
    public Vector3 TargetPosition = Vector3.zero;

    /// <summary>
    /// if the projectile needs to home to an object, this is it
    /// </summary>
    public GameObject TargetObject = null;

    /// <summary>
    /// Is this a homing projectile?
    /// </summary>
    public bool homing = false;

    /// <summary>
    /// Speed of the projectile
    /// </summary>
    public float speed;

    /// <summary>
    /// acceleration of the projectile
    /// </summary>
    public float acceleration;


    public string Name;


    void Awake()
    {
    }

	void Start () 
    {
	    
	}

	void Update () 
    {
        if (TargetObject != null)
        {
            transform.LookAt(TargetObject.transform.position);
        }

        if (TargetPosition != null)
        {
            transform.LookAt(TargetPosition);
        }
        // if this is a homing projectile, rotate towards our homing target

        if (homing == true)
        {
            if (TargetObject != null)
            {
                Vector3 direction = TargetObject.transform.position - transform.position;

                Vector3 newDirection = Vector3.RotateTowards(transform.forward, direction, 0.3f, 0f);
                transform.rotation = Quaternion.LookRotation(newDirection);
            }
            else
            {

                Vector3 direction = TargetPosition - transform.position;

                Vector3 newDirection = Vector3.RotateTowards(transform.forward, direction, 0.3f, 0f);
                transform.rotation = Quaternion.LookRotation(newDirection);
            }

            
        }

        // move along the path
        transform.position = transform.position + transform.forward * Time.deltaTime * speed;
        speed += acceleration * Time.deltaTime;

        


	}

    public void DetachParticleSystem()
    {

        ParticleSystem[] particles = GetComponentsInChildren<ParticleSystem>();

        foreach (ParticleSystem item in particles)
        {
            item.transform.parent = null;
            item.emissionRate = 0;
            //item.enableEmission = false; 
        }
        //particles.GetComponent<ParticleAnimator>().autodestruct = true;
    }
}

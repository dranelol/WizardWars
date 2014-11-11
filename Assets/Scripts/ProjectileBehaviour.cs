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
    public bool Ballistic = false;

    /// <summary>
    /// Speed of the projectile
    /// </summary>
    public float Speed;

    /// <summary>
    /// acceleration of the projectile
    /// </summary>
    public float Acceleration;


    public string Name;

    public bool frozen = false;


    void Awake()
    {
    }

	void Start () 
    {
	    
	}

	void Update () 
    {
        if (frozen == false)
        {
            if (TargetObject != null)
            {
                transform.LookAt(TargetObject.transform.position);
            }

            if (TargetPosition != null)
            {
                transform.LookAt(TargetPosition);
            }
            // if this is a ballistic projectile, rotate towards our homing target

            if (Ballistic == true)
            {
                if (TargetObject != null)
                {
                    Vector3 direction = TargetObject.transform.position - transform.position;

                    Vector3 newDirection = Vector3.RotateTowards(transform.forward, direction, 0.3f, 0f);
                    if (newDirection != Vector3.zero)
                    {
                        transform.rotation = Quaternion.LookRotation(newDirection);
                    }

                }
                else if (TargetPosition != null)
                {

                    Vector3 direction = TargetPosition - transform.position;

                    Vector3 newDirection = Vector3.RotateTowards(transform.forward, direction, 0.3f, 0f);
                    if (newDirection != Vector3.zero)
                    {
                        transform.rotation = Quaternion.LookRotation(newDirection);
                    }
                }


            }

            // move along the path
            transform.position = transform.position + transform.forward * Time.deltaTime * Speed;
            Speed += Acceleration * Time.deltaTime;

        }


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

    void OnTriggerEnter(Collider other)
    {
        Debug.Log("hi");

        if (other.gameObject.layer == LayerMask.NameToLayer("Environment")
         || other.gameObject.layer == LayerMask.NameToLayer("Terrain"))
        {
            
            if (frozen == false)
            {
                frozen = true;
            }
        }
    }
}

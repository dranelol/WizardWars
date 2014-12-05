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

    public bool CollidesWithTerrain = false;

    public bool CollidesWithEnvironment = false;


    public string Name;

    public bool frozen = false;

    public float InitialUpwardsForwardRotation;


    void Awake()
    {
        // start by angling the projectile upwards according to the initial forward rotation

        

       // GetComponent<Rigidbody>().velocity = transform.forward * Speed;
    }

	void Start () 
    {
        Vector3 startPos = transform.position;

        Vector3 forwardProject = transform.position + transform.forward;

        float dist = Vector3.Distance(startPos, forwardProject);

        float height = dist * (Mathf.Sin(InitialUpwardsForwardRotation) / Mathf.Sin(90 - InitialUpwardsForwardRotation));

        Vector3 lookPoint = new Vector3(forwardProject.x, forwardProject.y + height, forwardProject.z);

        Vector3 lookVector = lookPoint - transform.position;

        transform.rotation = Quaternion.LookRotation(lookVector);

        Debug.Log(Vector3.Angle(lookVector, forwardProject - startPos));
	}

	void Update () 
    {
        if (frozen == false)
        {

            // if this is a ballistic projectile, rotate towards our homing target

            if (Ballistic == true)
            {
                if (TargetObject != null)
                {
                    Vector3 direction = TargetObject.transform.position - transform.position;

                    Vector3 newDirection = Vector3.RotateTowards(transform.forward, direction, Time.deltaTime * Speed * 0.05f, 0f);
                    if (newDirection != Vector3.zero)
                    {
                        transform.rotation = Quaternion.LookRotation(newDirection);
                    }

                }
                else if (TargetPosition != null)
                {

                    Vector3 direction = TargetPosition - transform.position;

                    Vector3 newDirection = Vector3.RotateTowards(transform.forward, direction, Time.deltaTime * Speed * 0.05f, 0f);
                    if (newDirection != Vector3.zero)
                    {
                        transform.rotation = Quaternion.LookRotation(newDirection);
                    }
                }


            }

            else
            {
                if (TargetObject != null)
                {
                    transform.LookAt(TargetObject.transform.position);
                }

                if (TargetPosition != null)
                {
                    transform.LookAt(TargetPosition);
                }
            }
            

            // move along the path
            transform.position = transform.position + transform.forward * Time.deltaTime * Speed;
            Speed += Acceleration * Time.deltaTime;

            //GetComponent<Rigidbody>().velocity = transform.forward * Speed;

            Debug.Log("distance:" + Vector3.Distance(transform.position, TargetPosition));
            Debug.Log("forward speed: " + transform.forward.magnitude * Time.deltaTime * Speed);
            // checks to stop

            if (TargetPosition != null)
            {
                if (Vector3.Distance(transform.position, TargetPosition) <= transform.forward.magnitude * Time.deltaTime * Speed)
                {
                    Debug.Log("asd");
                    frozen = true;

                    GetComponent<Rigidbody>().velocity = Vector3.zero;

                    Messenger.Broadcast(Name + "ProjectileFrozen");
                }
            }

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

        if (other.gameObject.layer == LayerMask.NameToLayer("Environment") && CollidesWithEnvironment == true)
        {
            if (frozen == false)
            {
                frozen = true;

                GetComponent<Rigidbody>().velocity = Vector3.zero;
            }
        }

        if (other.gameObject.layer == LayerMask.NameToLayer("Terrain") && CollidesWithTerrain == true)
        {
            if (frozen == false)
            {
                frozen = true;

                GetComponent<Rigidbody>().velocity = Vector3.zero;
            }
        }
    }

    public void SetFrozen(bool freeze)
    {
        frozen = freeze;

        if (frozen == true)
        {
            GetComponent<Rigidbody>().velocity = Vector3.zero;
        }
    }
}

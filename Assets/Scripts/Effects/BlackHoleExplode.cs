using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BlackHoleExplode : MonoBehaviour
{
    public float TimeToExplode;

    float timeToExplode;

    public GameObject BlackHole;

    public GameObject Particles;

    bool exploding = false;

    public bool Activated = false;

    Collider[] gravityObjects;

    HashSet<Collider> cols2 = new HashSet<Collider>();
	void Awake () 
    {
        timeToExplode = Time.time + TimeToExplode;
        gravityObjects = new Collider[500];

        Messenger.AddListener<Transform>("BlackHoleActivate", Activate);

	}
	
	void Update () 
    {
        if (Time.time > timeToExplode && exploding == false)
        {
            StartCoroutine(Explode());
            
        }
	}

    IEnumerator Explode()
    {
        exploding = true;
        while (Activated == false)
        {
            
            Collider[] cols = Physics.OverlapSphere(transform.position, 500);
            gravityObjects = cols;

            foreach (Collider col in cols)
            {
                if (col != null)
                {
                    if (col.gameObject != gameObject)
                    {
                        if (col.gameObject.layer == LayerMask.NameToLayer("Environment") || col.gameObject.layer == LayerMask.NameToLayer("BlackHoled"))
                        {
                            if (col.gameObject.layer == LayerMask.NameToLayer("Environment"))
                            {
                                col.gameObject.layer = LayerMask.NameToLayer("BlackHoled");
                            }
                            if (col.gameObject.rigidbody == null)
                            {
                                col.gameObject.AddComponent<Rigidbody>();
                            }

                            Rigidbody body = col.gameObject.GetComponent<Rigidbody>();

                            Vector3 distance = transform.position - col.transform.position;
                            /*
                            float xInvert = 1.0f / distance.x;
                            float yInvert = 1.0f / distance.y;
                            float zInvert = 1.0f / distance.z;

                            Mathf.Clamp01(xInvert);
                            Mathf.Clamp01(yInvert);
                            Mathf.Clamp01(zInvert);

                            Vector3 invertDistance = new Vector3(xInvert, yInvert, zInvert);
                            */
                            body.AddForce(distance / 2.0f, ForceMode.Impulse);



                        }
                    }
                }
            }

            yield return new WaitForSeconds(0.1f);
        }
        
       
        

        yield return null;
    }

    void Activate(Transform activator)
    {
        Debug.Log("activated");
        Activated = true;

        if (BlackHole != null)
        {
            StartCoroutine(activate(activator));
        }
    }

    IEnumerator activate(Transform activator)
    {
        float lerpTime = 1.0f;
        float currentLerpTime = 0.0f;

        // scale down
        while (Vector3.Distance(BlackHole.transform.localScale, Vector3.zero) > 0.01f)
        {
            currentLerpTime += Time.deltaTime;

            if (currentLerpTime > lerpTime)
            {
                currentLerpTime = lerpTime;
            }

            float perc = currentLerpTime / lerpTime;

            //Debug.Log(BlackHole.transform.localScale.ToString());
            BlackHole.transform.localScale = Vector3.Lerp(BlackHole.transform.localScale, Vector3.zero, perc);
            //Debug.Log(transform.localScale);

            yield return new WaitForSeconds(0.01f);
        }

        Destroy(BlackHole);

        ParticleSystem[] particleSystems = GetComponentsInChildren<ParticleSystem>();

        // unparent each particle system, and disable emission. we do this to make sure that each particle system has a chance to finish its full cycle before being destroyed
        // each particle system has a script to destroy itself when emission fully stops
        foreach (ParticleSystem item in particleSystems)
        {
            item.transform.parent = null;
            item.emissionRate = 0;
            item.enableEmission = false;

        }

        // fling objects
        foreach (Collider col in gravityObjects)
        {
            Vector3 forcePosition = transform.forward * 20.0f;

            if (col.gameObject.rigidbody != null)
            {
                col.gameObject.rigidbody.velocity = Vector3.zero;
                Vector3 forceDir = forcePosition - col.gameObject.transform.position;
                col.gameObject.rigidbody.AddForce(forceDir * 2.0f, ForceMode.Impulse);
            }
        }

        Activated = false;

        yield return null;
    }

    
}


using UnityEngine;
using System.Collections;

public class BlackHoleExplode : MonoBehaviour
{
    public float TimeToExplode;

    float timeToExplode;

    public GameObject BlackHole;

    public GameObject Particles;

    bool exploded = false;
	void Awake () 
    {
        timeToExplode = Time.time + TimeToExplode;
	}
	
	void Update () 
    {
        Debug.Log(exploded);
        if (Time.time > timeToExplode && exploded == false)
        {
            
            StartCoroutine(Explode());
            exploded = true;
        }
	}

    IEnumerator Explode()
    {
        float lerpTime = 1.0f;
        float currentLerpTime = 0.0f;

        Debug.Log("exploding");
        Collider[] cols = Physics.OverlapSphere(transform.position, 500);

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

        Debug.Log("exploding2");

        foreach (Collider col in cols)
        {
            if (col.gameObject.tag != "Terrain")
            {
                if (col.gameObject.rigidbody == null)
                {
                    col.gameObject.AddComponent<Rigidbody>();
                }
                Rigidbody body = col.gameObject.GetComponent<Rigidbody>();
                body.AddExplosionForce(2000, transform.position, 50);

               
            }
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

        yield return null;
    }
}


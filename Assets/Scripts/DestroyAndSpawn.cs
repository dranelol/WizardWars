using UnityEngine;
using System.Collections;

public class DestroyAndSpawn : MonoBehaviour 
{
    public GameObject ToSpawn;

	void Start () 
    {
	
	}
	
	void Update () 
    {
	    
	}

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            Destroy(gameObject);
            GameObject spawn = (GameObject)Instantiate(ToSpawn, transform.position, Quaternion.identity);
        
            Collider[] cols = Physics.OverlapSphere(transform.position, 500);

            foreach(Collider col in cols)
            {
                if (col.gameObject.tag != "Terrain")
                {
                    Rigidbody body = col.gameObject.AddComponent<Rigidbody>();
                    body.AddExplosionForce(1000, transform.position, 50);
                }
            }
        
        }
    }
}

using UnityEngine;
using System.Collections;

public class PullFistCollide : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}


    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Enemy")
        {
            Messenger.Broadcast<GameObject>("PullFistHit", other.gameObject);
        }
    }
}

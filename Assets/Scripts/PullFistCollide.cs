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
        if (other.gameObject.layer == LayerMask.NameToLayer("Environment"))
        {
            Messenger.Broadcast<GameObject, GameObject>("PullFistHit", gameObject, other.gameObject);
        }
    }
}

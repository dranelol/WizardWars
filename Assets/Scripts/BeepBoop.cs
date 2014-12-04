using UnityEngine;
using System.Collections;

public class BeepBoop : MonoBehaviour
{

    void Awake()
    {
        Messenger.AddListener("PullFistProjectileFrozen", DespawnFist);
        Messenger.AddListener<GameObject>("PullFistHit", PullFist);
    }

	void Start () 
    {
	
	}
	
	void Update () 
    {
	
	}

    void PullFist(GameObject toPull)
    {
        Debug.Log("beep booped " + toPull.name);
        StartCoroutine(Pull(toPull));
    }

    IEnumerator Pull(GameObject toPull)
    {
        yield return null;
    }

    void DespawnFist()
    {
        Debug.Log("missed!");
        StartCoroutine(Despawn());
    }

    IEnumerator Despawn()
    {
        yield return null;
    }
}

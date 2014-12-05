using UnityEngine;
using System.Collections;

public class BeepBoop : MonoBehaviour
{

    void Awake()
    {
        Messenger.AddListener("PullFistProjectileFrozen", DespawnFist);
        Messenger.AddListener<GameObject, GameObject>("PullFistHit", PullFist);
    }

	void Start () 
    {
	
	}
	
	void Update () 
    {
	
	}

    void PullFist(GameObject fist, GameObject toPull)
    {
        Debug.Log("beep booped " + toPull.name);

        fist.GetComponent<ProjectileBehaviour>().SetFrozen(true);

        Destroy(fist.rigidbody);

        fist.transform.parent = toPull.transform;

        StartCoroutine(Pull(toPull));
    }

    IEnumerator Pull(GameObject toPull)
    {
        while (Vector3.Distance(transform.position, toPull.transform.position) > 1.0f)
        {
            Debug.Log("asd");
            toPull.transform.position = Vector3.MoveTowards(toPull.transform.position, transform.position, 1.0f);
            yield return new WaitForSeconds(0.025f);
        }

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

using UnityEngine;
using System.Collections;

public class ScaleUp : MonoBehaviour 
{
    Vector3 startScale;
    public Vector3 EndScale;

    public float TimeToScale;

    void Awake()
    {
        startScale = transform.localScale;
        StartCoroutine(Scale());
    }

	void Start () 
    {
	
	}
	
	// Update is called once per frame
	void Update () 
    {
	
	}

    public IEnumerator Scale()
    {
        Vector3 diff = EndScale - startScale;
        
        while (Vector3.Distance(transform.localScale, EndScale) > 0.1f)
        {
            transform.localScale = Vector3.Lerp(transform.localScale, EndScale, Time.deltaTime * 1.5f);
            //Debug.Log(transform.localScale);
            yield return new WaitForSeconds(0.01f);
        }

        Debug.Log("done scaling");

        yield return null;
    }
}

using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;

public class EffectsTest : MonoBehaviour 
{

    public List<GameObject> Effects;

    public GameObject projectile;

    GameManager gameManager;

    int effectsItr;

    void Awake()
    {
        gameManager = GameObject.FindGameObjectWithTag("GameManager").GetComponent<GameManager>();
        Effects = gameManager.Effects;
    }

	void Start () 
    {

	}
	
	void Update () 
    {
        if (Input.GetKeyDown(KeyCode.Equals))
        {
            Debug.Log("asd");
            effectsItr = Mathf.Clamp(effectsItr + 1, 0, Effects.Count-1);
        }

        if (Input.GetKeyDown(KeyCode.Minus))
        {
            Debug.Log("asd");

            effectsItr = Mathf.Clamp(effectsItr - 1, 0, Effects.Count-1);
        }

        if (Input.GetKeyDown(KeyCode.Return))
        {
            StartCoroutine(DoEffect(Effects[effectsItr], 2.0f));
        }

        if (Input.GetKeyDown(KeyCode.Q))
        {
            Vector3 spawnPos = transform.position;
            spawnPos.y += 10.0f;

            GameObject proj = (GameObject)Instantiate(projectile, spawnPos, Quaternion.identity);
            ProjectileBehaviour projBehaviour = proj.GetComponent<ProjectileBehaviour>();

            // TARGET THE GROUND BASED ON MOUSE IN THE FUTURE
             
            Vector3 targetPos = transform.position + (transform.forward * 10.0f);
            targetPos.y = 0.0f;

            projBehaviour.TargetPosition = targetPos;

            Debug.DrawLine(transform.position, projBehaviour.TargetPosition);

            
        }
	}

    void OnGUI()
    {
        GUI.Box(new Rect(0, 0, Screen.width * 0.1f, Screen.height * 0.1f), "effect: " + effectsItr.ToString());

    }

    IEnumerator DoEffect(GameObject particlePrefab, float time)
    {
        GameObject effect;

        effect = (GameObject)Instantiate(Effects[effectsItr], transform.position, Quaternion.identity);

        yield return new WaitForSeconds(time);

        ParticleSystem[] particles = effect.GetComponentsInChildren<ParticleSystem>();

        foreach (ParticleSystem particle in particles)
        {
            particle.transform.parent = null;
            particle.emissionRate = 0;
            particle.enableEmission = false;
        }

        GameObject.Destroy(effect);

        yield return null;
            
    }
}

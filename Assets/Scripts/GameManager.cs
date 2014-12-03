using UnityEngine;
using System.Collections;
using System;
using System.Collections.Generic;


public class GameManager : MonoBehaviour {

    public List<GameObject> Effects;

    public GameObject Player;
    public Transform PlayerRespawn;
    void Awake()
    {
        Player = GameObject.FindGameObjectWithTag("Player");
    }

	// Use this for initialization
	void Start () 
    {
	    
	}
	
	// Update is called once per frame
	void Update () 
    {
        if (Player.transform.position.y < -1)
        {
            Player.transform.position = PlayerRespawn.position;
        }
	}
}

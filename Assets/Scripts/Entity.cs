using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Entity : MonoBehaviour
{
    protected float currentHP; 
    public float CurrentHP
    {
        get { return currentHP; }
    }

    protected float currentResource;
    public float CurrentResource
    {
        get { return currentResource; }
    }



    public void Awake()
    {

    }

    public void OnApplicationQuit() { }

    public void Start()
    {
    }
    public bool IsDead() { return currentHP <= 0; }

}

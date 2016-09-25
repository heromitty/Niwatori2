using UnityEngine;
using System.Collections;

public class billboard : MonoBehaviour {

	public Transform target_transform_;

	// Use this for initialization
	void Start () {

		if(target_transform_ == null) {
			//MainCameraをターゲットとする
			target_transform_ = GameObject.FindGameObjectWithTag("MainCamera").transform;
		}
	
	}
	
	// Update is called once per frame
	void Update () {
		//カメラの方向を向くようにする
		this.transform.LookAt(target_transform_.position);
	}
}


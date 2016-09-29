//
//  ViewController.swift
//  TripStori
//
//  Created by Jesse Tello Jr. on 9/21/16.
//  Copyright © 2016 Tello. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit

class TSWelcomeViewController: UIViewController {

    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var faceBookLogin: FBSDKLoginButton!
    @IBOutlet weak var googleLogin: UIButton!

    private let dataURL = "gs://tripstori-59fb9.appspot.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebookLogin(_ sender: FBSDKLoginButton) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (loginResult, error) in
            FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            
        }
    }
    
    @IBAction func googleLogin(_ sender: UIButton) {
        
        
        
    }
    
    
}


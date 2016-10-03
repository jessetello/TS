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
import GoogleSignIn

class TSWelcomeViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var facebookButton: FBSDKLoginButton!
    @IBOutlet weak var googleButton: UIButton!
    
    private let dataURL = "gs://tripstori-59fb9.appspot.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        googleButton.layer.cornerRadius = 3
        googleButton.layer.borderWidth = 1
        googleButton.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func facebookLogin(_ sender: FBSDKLoginButton) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email","public_profile","user_friends"], from: self) { loginResult, error in
            let cred = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            AuthenticationManager.sharedInstance.loginWithCredential(credential: cred, completion: { (success) in
                
            })
        }
    }
}


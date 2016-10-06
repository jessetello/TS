//
//  TSLogInViewController.swift
//  TripStori
//
//  Created by Jesse Tello Jr. on 9/30/16.
//  Copyright © 2016 Tello. All rights reserved.
//

import UIKit

class TSLogInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: UIButton) {
        if let email = emailField.text, let password = passwordField.text {
            AuthenticationManager.sharedInstance.signIn(email: email, password: password) { (success) in
                if success {
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    if let mainVC = sb.instantiateViewController(withIdentifier: "TSMainViewController") as? TSMainViewController {
                        self.navigationController?.pushViewController(mainVC, animated: true)
                    }
                }
                else {

                
                }
            }
        }
    }
}

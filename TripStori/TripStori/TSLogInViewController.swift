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
        emailField.underlined()
        passwordField.underlined()  
    }
    
    func validateLogInInfo() -> Bool {
        
        if emailField.text?.isEmpty == true || passwordField.text?.isEmpty == true {
            return false
        }
        
        if let  password = passwordField.text?.characters.count, let email = emailField.text?.characters.count {
            if password <= 3 || email <= 5 {
                return false
            }
        }
        
        return true
    }

    @IBAction func login(_ sender: UIButton) {
        if validateLogInInfo() {
            TSSpinner.show("Logging In...")
            if let email = emailField.text, let password = passwordField.text {
                AuthenticationManager.sharedInstance.signIn(email: email, password: password) { (success) in
                    if success {
                        TSSpinner.hide()
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        if let mainVC = sb.instantiateViewController(withIdentifier: "TSMainViewController") as? TSMainViewController {
                            self.navigationController?.pushViewController(mainVC, animated: true)
                        }
                    }
                    else {
                        TSSpinner.show(duration: 3, title: "Login Failed")
                    }
                }
            }
        }
        else {
            TSSpinner.show(duration: 5, title: "Invalid Credentials")
        }
    }
}

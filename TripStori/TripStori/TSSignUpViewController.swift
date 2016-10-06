//
//  TSSignUpViewController.swift
//  TripStori
//
//  Created by Jesse Tello Jr. on 9/30/16.
//  Copyright © 2016 Tello. All rights reserved.
//

import UIKit

class TSSignUpViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        firstNameField.underlined()
        lastNameField.underlined()
        emailField.underlined()
        passwordField.underlined()
        confirmPasswordField.underlined()
    }
    
    func validateSignupInfo() -> Bool {
        return true
    }

    @IBAction func signUp(_ sender: UIButton) {
        if validateSignupInfo() {
            if let email = emailField.text, let password = passwordField.text {
                AuthenticationManager.sharedInstance.signUp(email: email, password: password, completion: { (success) in
                    if success {
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        if let mainVC = sb.instantiateViewController(withIdentifier: "TSMainViewController") as? TSMainViewController {
                            self.navigationController?.pushViewController(mainVC, animated: true)
                        }
                    }
                    else {
                        
                    }
                })
            }
        }
    }
}

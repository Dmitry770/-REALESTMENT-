//
//  LoginViewController.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 11/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLoginLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        //create cleaned version of the text field
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // sign up is failed
                self.errorLoginLabel.text = "Error! Please, try again"
            }
            else {
                self.performSegue(withIdentifier: "goToMainObjWithLogin", sender: self)
            }
        }
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
    }
    
}

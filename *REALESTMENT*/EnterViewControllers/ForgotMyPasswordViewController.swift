//
//  ForgotMyPasswordViewController.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 17/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class ForgotMyPasswordViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resedTapped(_ sender: Any) {
        let email = emailTextField.text
        if email == "" {
            // display a warning message
            errorLabel.text = "Please type in your e-mail"
        }
        
        Auth.auth().sendPasswordReset(withEmail: email!) { error in
         
            if let error = error {
                // display error message
                self.errorLabel.text = "Error! Please, try again"
            }
            else {
                // display success message
                self.errorLabel.text = "An e-mail message was send to you"
            }
        }
    }
    
}



//
//  SignUpViewController.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 11/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameFieldSign: UITextField!
    
    
    @IBOutlet weak var lastNameFieldSign: UITextField!
    
    @IBOutlet weak var mailFieldSign: UITextField!
    
    
    @IBOutlet weak var passFieldSign: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var signTap: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func validateFields() -> String? {
        
        // Check that all fields are filled in
        
        if firstNameFieldSign.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameFieldSign.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            mailFieldSign.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passFieldSign.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        
        let cleanedPassword = passFieldSign.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        func isPasswordValid(_ password : String) -> Bool{
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
            return passwordTest.evaluate(with: password)
        }
        
        if isPasswordValid(cleanedPassword) == false {
            // password isn't secure enough
            return "Please make sure your password is at least 8 characters"
        }
        
        
        return nil
    }
    
    @IBAction func SignUpTapped(_ sender: Any) {
        
        //Validate the fields
        let error = validateFields()
        
        if error != nil {
            //error with the fields
           showError(error!)
        }
        else {
            //Create the user
            Auth.auth().createUser(withEmail: "", password: "") { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    //there are an error creating user
                    self.showError("Error creating user")
                }
                else {
                    let db = Firestore.firestore()
                    
                    
                    // user was created successfully
                  //  let db = Firestore.firestore()
                }
                
            }
            
            
            
            //Transition to the homeView
        }
        
        
        
        
    }
    
    func showError(_ message: String) {
       
        errorLabel.text = message
        errorLabel.alpha = 1
        
        
    }
    
}

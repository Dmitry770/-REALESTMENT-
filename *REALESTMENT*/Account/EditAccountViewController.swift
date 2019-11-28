//
//  EditAccountViewController.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 25/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import CoreData

class EditAccountViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameAccountTextField: UITextField!
    @IBOutlet weak var lastNameAccountTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var nationalityTextField: UITextField!
    @IBOutlet weak var adressLineTextField: UITextField!
    @IBOutlet weak var postalCodeTextField: UITextField!
    @IBOutlet weak var telNumberTextField: UITextField!
    
    var action: ((Account)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loadPhotoTapped(_ sender: Any) {
    }
    @IBAction func continueSaveTapped(_ sender: Any) {
        if ((firstNameAccountTextField.text != "" || lastNameAccountTextField.text != "") && (firstNameAccountTextField.text != nil || lastNameAccountTextField.text != nil )){
    let userRef = Database.database().reference().child("users").child(Auth.auth().currentUser!.uid)
            if let fName = firstNameAccountTextField.text,
               let lName = lastNameAccountTextField.text,
               let date = dateOfBirthTextField.text,
               let nationality = nationalityTextField.text,
               let adressLine = adressLineTextField.text,
               let postalCode = postalCodeTextField.text,
               let telNumber = telNumberTextField.text{
            userRef.updateChildValues(["firstname" : fName ])
            userRef.updateChildValues(["lastname" : lName ])
            userRef.updateChildValues(["dateofbirth" : date ])
            userRef.updateChildValues(["nationality" : nationality ])
            userRef.updateChildValues(["adressline" : adressLine ])
            userRef.updateChildValues(["postalcode" : postalCode ])
            userRef.updateChildValues(["telnumber" : telNumber ])
                let account = Account(name: fName, lastName: lName, dateOfBirth: date, nationality: nationality, adress: adressLine, postalCode: postalCode, telephone: telNumber)
                
                action!(account)
                // coreDate test
                       let appDelegate = UIApplication.shared.delegate as! AppDelegate
                       let context = appDelegate.persistentContainer.viewContext
        
                       let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
                       let person = NSManagedObject(entity: entity!, insertInto: context)
                       
                       person.setValue(fName, forKey: "firstname")
                       person.setValue(lName, forKey: "lastname")
                       person.setValue(date, forKey: "dateOfBirth")
                       person.setValue(nationality, forKey: "nationality")
                       person.setValue(adressLine, forKey: "adress")
                       person.setValue(postalCode, forKey: "postalCode")
                       person.setValue(telNumber, forKey: "telephone")
                       
                       do {
                           try context.save()
                       } catch {
                           print("Failed saving")
                       }
            }
}
        else {
            let alert = UIAlertController(title: "Warning!", message: "Enter First name or Last name", preferredStyle: .alert)
            let buttonOk = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(buttonOk)
            present(alert, animated: true)
        }
        
        navigationController?.popViewController(animated: true)
}
}

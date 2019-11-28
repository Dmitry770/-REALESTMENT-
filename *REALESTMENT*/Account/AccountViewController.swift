//
//  AccountViewController.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 28/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import UIKit
import CoreData


class AccountViewController: UIViewController {
    
    var people = [Users]()

    @IBOutlet weak var firstNameAccountLabel: UILabel!
    @IBOutlet weak var lastNameAccountLabel: UILabel!
    @IBOutlet weak var dateOfBirthAccountLabel: UILabel!
    @IBOutlet weak var nationalityAccountLabel: UILabel!
    @IBOutlet weak var adressAccountLabel: UILabel!
    @IBOutlet weak var postalCodeAccountLabel: UILabel!
    @IBOutlet weak var telephoneAccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EditAccountViewController
        vc.action = { (value)
            in
            self.firstNameAccountLabel.text = value.name
            self.lastNameAccountLabel.text = value.lastName
            self.dateOfBirthAccountLabel.text = value.dateOfBirth
            self.nationalityAccountLabel.text = value.nationality
            self.adressAccountLabel.text = value.adress
            self.postalCodeAccountLabel.text = value.postalCode
            self.telephoneAccountLabel.text = value.telephone
        }
    }
    
    func showFromCoreDate(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        // may be predicate
        people = try! context.fetch(fetchRequest) as! [Users]
        
        for person in people {
            firstNameAccountLabel.text = person.firstname
            lastNameAccountLabel.text = person.lastname
            dateOfBirthAccountLabel.text = person.dateOfBirth
            nationalityAccountLabel.text = person.nationality
            adressAccountLabel.text = person.adress
            postalCodeAccountLabel.text = person.postalCode
            telephoneAccountLabel.text = person.telephone
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

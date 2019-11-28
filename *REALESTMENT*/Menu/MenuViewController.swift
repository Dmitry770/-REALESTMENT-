//
//  MenuViewController.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 21/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    let myTitle = ["Settings", "Help", "About", "Sign out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTitle.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        cell.labelTextMenu.text = myTitle[indexPath.row]
        // image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            guard let vc = storyboard?.instantiateViewController(identifier: "MyInvestmentsViewController") else {fatalError("Unable to create ViewController")}
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            guard let vc = storyboard?.instantiateViewController(identifier: "FavouritesViewController") else {fatalError("Unable to create ViewController")}
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            guard let vc = storyboard?.instantiateViewController(identifier: "MyInvestmentsViewController") else {fatalError("Unable to create ViewController")}
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            guard let vc = storyboard?.instantiateViewController(identifier: "HomeViewController") else {fatalError("Unable to create ViewController")}
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("Unable to creste ViewController")
        }
    }
}

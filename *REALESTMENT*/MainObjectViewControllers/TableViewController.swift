//
//  TableViewController.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 05/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var menuButtonItem: UIBarButtonItem!
    
    var menuVC: MenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNews {
            DispatchQueue.main.async {
                  self.tableView.reloadData()
            }
        }
        menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as? MenuViewController
        objectsArray = articles
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//       tableView.reloadData()
//    }
    
    @IBAction func menuTapped(_ sender: Any) {
        // no working => any - UIbarbuttonItem
        if AppDelegate.isMenuVC {
            showMenu()
        }
        else {
            hideMenu()
        }
    }
    
    func showMenu() {
        UIView.animate(withDuration: 0.3) {
            self.menuVC.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.addChild(self.menuVC)
            self.view.addSubview(self.menuVC.view)
            AppDelegate.isMenuVC = false
        }
        
    }
    
    func hideMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.menuVC.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.width, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finished) in
            self.menuVC.view.removeFromSuperview()
            AppDelegate.isMenuVC = true
        }
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objectsArray.count
    }

    var objectsArray: [Article] = []
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let article = objectsArray[indexPath.row]
       
        cell.nameLabel.text = article.name
        cell.adressLabel.text = article.place
        cell.fundTargetLabel.text = article.fundingTarget
        cell.equShareLabel.text = article.equityShare
        cell.projectTermLabel.text = article.projectTerm
        cell.projectProgrLabel.text = article.projectProgress

        if let url = URL(string: article.imageUrl) {
            if let data = try? Data(contentsOf: url) {
                cell.imageBuilding.image = UIImage(data: data)
            }
        }
        return cell
    }
   
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToObj" {
        var rowNum: Int
        if (tableView.indexPathForSelectedRow != nil) {
            rowNum = tableView.indexPathForSelectedRow!.row
        } else {
            let button = sender as? UIButton
            let cell = button?.superview?.superview as? UITableViewCell
            let path = tableView.indexPath(for: cell!)
            rowNum = path!.row
        }
        (segue.destination as? OneObjViewController)!.article = articles[rowNum]
        }

     } 
   /*  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         performSegue(withIdentifier: "goToProject", sender: self)
     } */


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

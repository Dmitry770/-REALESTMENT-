//
//  OneObjViewController.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 09/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import UIKit

class OneObjViewController: UIViewController {
    
    var article: Article!
    
    @IBOutlet weak var imageObj: UIImageView!
    @IBOutlet weak var nameObjLabel: UILabel!
    @IBOutlet weak var placeObjLabel: UILabel!
    @IBOutlet weak var adressObjLabel: UILabel!
    @IBOutlet weak var projectProgressObjLabel: UILabel!
    @IBOutlet weak var projectBudjetObjLabel: UILabel!
    @IBOutlet weak var startDateObjLabel: UILabel!
    @IBOutlet weak var completionDateObjLabel: UILabel!
    @IBOutlet weak var constructorsObjLabel: UILabel!
    @IBOutlet weak var fundingTargetObjLabel: UILabel!
    @IBOutlet weak var equityShareObjLabel: UILabel!
    @IBOutlet weak var closingDateObjLabel: UILabel!
    @IBOutlet weak var minInvestmentObjLabel: UILabel!
    @IBOutlet weak var aboutObjLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      nameObjLabel.text = article.name
      placeObjLabel.text = article.place
        
       if let url = URL(string: article.imageUrl) {
            if let data = try? Data(contentsOf: url) {
            imageObj.image = UIImage(data: data)
    }
        
        adressObjLabel.lineBreakMode = .byWordWrapping
         adressObjLabel.numberOfLines = 0
         adressObjLabel.text = article.adress
        projectProgressObjLabel.text = article.projectProgress
        projectBudjetObjLabel.text = article.projectBudget
        startDateObjLabel.text = article.startDate
        completionDateObjLabel.text = article.completionDate
        constructorsObjLabel.lineBreakMode = .byWordWrapping
         constructorsObjLabel.numberOfLines = 0
         constructorsObjLabel.text = article.constructors
        fundingTargetObjLabel.text = article.fundingTarget
        equityShareObjLabel.text = article.equityShare
        closingDateObjLabel.text = article.closingDate
        minInvestmentObjLabel.text = article.minInvestment
        aboutObjLabel.lineBreakMode = .byWordWrapping
         aboutObjLabel.numberOfLines = 0
         aboutObjLabel.text = article.about
    }
}
    
    @IBAction func buyTokensTapped(_ sender: Any) {
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

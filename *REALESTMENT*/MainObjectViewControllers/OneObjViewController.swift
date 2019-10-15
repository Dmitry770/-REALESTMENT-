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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
     
        
       nameObjLabel.text = article.name
        placeObjLabel.text = article.place
        
       if let url = URL(string: article.imageUrl) {
            if let data = try? Data(contentsOf: url) {
            imageObj.image = UIImage(data: data)
            }
        // else imageObj = downloadImage
    }
        adressObjLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        adressObjLabel.numberOfLines = 0
        adressObjLabel.text = article.adress
        
        
        
        
        
    
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

//
//  TableViewCell.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 07/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageBuilding: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var fundTargetLabel: UILabel!
    @IBOutlet weak var equShareLabel: UILabel!
    @IBOutlet weak var projectTermLabel: UILabel!
    @IBOutlet weak var projectProgrLabel: UILabel!
    @IBAction func learMoreTap(_ sender: UIButton) {
    }
    
    @IBOutlet weak var learnMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

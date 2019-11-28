//
//  MenuTableViewCell.swift
//  *REALESTMENT*
//
//  Created by Macintosh on 21/10/2019.
//  Copyright © 2019 Macintosh. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTextMenu: UILabel!
    
    @IBOutlet weak var imageMenu: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

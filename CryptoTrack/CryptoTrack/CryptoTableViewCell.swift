//
//  CryptoTableViewCell.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 10/30/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencyPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

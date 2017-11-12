//
//  topPerformerTableViewCell.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/10/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit

class topPerformerTableViewCell: UITableViewCell {

    @IBOutlet weak var threePctChg: UIView!
    @IBOutlet weak var twoPctChg: UILabel!
    @IBOutlet weak var onePctChg: UILabel!
    @IBOutlet weak var threeCurr: UILabel!
    @IBOutlet weak var twoCurr: UILabel!
    @IBOutlet weak var oneCurr: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

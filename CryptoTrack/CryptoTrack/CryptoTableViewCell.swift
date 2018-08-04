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
    @IBOutlet weak var currencyCap: UILabel!
    @IBOutlet weak var currencyID: UILabel!
    var symbols : [UIImage] = [
        UIImage(named : "BTC.png")!,
        UIImage(named : "ETH.png")!,
        UIImage(named : "DASH.png")!,
        UIImage(named : "ETC.png")!,
        UIImage(named : "EOS.png")!,
        UIImage(named : "LTC.png")!,
        UIImage(named : "MIOTA.png")!,
        UIImage(named : "NEM.png")!,
        UIImage(named : "NEO.png")!,
        UIImage(named : "OMG.png")!,
        UIImage(named : "XLM.png")!,
        UIImage(named : "XMR.png")!,
        UIImage(named : "XRP.png")!
    ]

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

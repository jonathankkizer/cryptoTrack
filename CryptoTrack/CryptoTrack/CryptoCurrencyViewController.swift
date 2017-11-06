//
//  CryptoCurrencyViewController.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/6/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit
import CryptoCurrencyKit

class CryptoCurrencyViewController: UIViewController {

    var cryptoCurrency: Ticker?
    
    @IBOutlet weak var priceUSD: UILabel!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var priceMarketCap: UILabel!
    @IBOutlet weak var oneHourPctChange: UILabel!
    @IBOutlet weak var twentyFourHourPctChange: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cryptoName.text = cryptoCurrency?.name
        priceUSD.text = formatCurrency(value: (cryptoCurrency?.priceUSD)!)
        priceMarketCap.text = formatCurrency(value: (cryptoCurrency?.marketCapUSD)!)
        oneHourPctChange.text = "\(cryptoCurrency!.percentChange1h!)" + "%"
        twentyFourHourPctChange.text = "\(cryptoCurrency!.percentChange24h!)" + "%"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

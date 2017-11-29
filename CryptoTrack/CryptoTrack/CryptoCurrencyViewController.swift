//
//  CryptoCurrencyViewController.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/6/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit
import CryptoCurrencyKit

// creates array to contain user cryptoCurrencies

class CryptoCurrencyViewController: UIViewController {
    
    var cryptoCurrency: Ticker?
    
    @IBOutlet weak var priceUSD: UILabel!
    @IBOutlet weak var cryptoName: UILabel!
    @IBOutlet weak var priceMarketCap: UILabel!
    @IBOutlet weak var oneHourPctChange: UILabel!
    @IBOutlet weak var twentyFourHourPctChange: UILabel!
    
    @IBOutlet weak var userCoinAmount: UITextField!
    @IBOutlet weak var userCoinPurchasePrice: UITextField!
    
    public func reloadCurrentView() {
        self.viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        self.renderCryptoCurrencyView()
        
        // Do any additional setup after loading the view.
    }

    func renderCryptoCurrencyView() {
        cryptoName.text = cryptoCurrency?.name
        priceUSD.text = formatCurrencyUSD(value: (cryptoCurrency?.priceUSD)!)
        priceMarketCap.text = formatCurrencyUSD(value: (cryptoCurrency?.marketCapUSD)!)
        oneHourPctChange.text = "\(cryptoCurrency!.percentChange1h!)" + "%"
        twentyFourHourPctChange.text = "\(cryptoCurrency!.percentChange24h!)" + "%"
        
        if userCoins.count > 0 || cryptoCurrencyViewSafeToUnwrap! {
            for j in userCoins {
                if cryptoCurrency?.id == j.userCurrency! {
                    userCoinAmount.text = j.userCoinAmount
                    userCoinPurchasePrice.text = j.userCoinPrice
                    break
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func coinDepositSaveButton(_ sender: Any) {
        // takes user coins and purchase price, creates a new class and appends it to userCryptoCurrencies array; saves array to Firebase
        print(userCoinAmount.text!)
        print(userCoinPurchasePrice.text!)
        let idKey = cryptoCurrency?.id as! String
        
        if userCoinAmount.text!.isEmpty {
            userCoinAmount.text = "0"
        }
        
        if userCoinPurchasePrice.text!.isEmpty {
            userCoinPurchasePrice.text = "0"
        }
        
        let newUserCoin = userCoin(userCoinAmount: userCoinAmount.text!, userCoinPrice: userCoinPurchasePrice.text!, userCurrency: idKey)
        DataStore.shared.addCoin(coin: newUserCoin)
        //print("Coin added")
        DataStore.shared.loadCoin()
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

//
//  QuickCryptoTableViewController.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/27/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit
import CryptoCurrencyKit


class QuickCryptoTableViewController: UITableViewController {
    
    // cryptoCurrencies is array that contains the below cryptoCurrencyX objects; used to access later when drawing views, etc. with indexPath.row
    public var cryptoCurrencies = [Ticker]()
    // instantied to reference the tickers return results in cryptocurrencykit closure below
    public var cryptoCurrency1: Ticker?
    public var cryptoCurrency2: Ticker?
    public var cryptoCurrency3: Ticker?
    public var cryptoCurrency4: Ticker?
    public var cryptoCurrency5: Ticker?
    public var cryptoCurrency6: Ticker?
    public var cryptoCurrency7: Ticker?
    public var cryptoCurrency8: Ticker?
    public var cryptoCurrency9: Ticker?
    public var cryptoCurrency10: Ticker?
    public var cryptoCurrency11: Ticker?
    public var cryptoCurrency12: Ticker?
    public var cryptoCurrency13: Ticker?
    public var cryptoCurrency14: Ticker?
    public var cryptoCurrency15: Ticker?
    public var cryptoCurrency16: Ticker?
    public var cryptoCurrency17: Ticker?
    public var cryptoCurrency18: Ticker?
    public var cryptoCurrency19: Ticker?
    public var cryptoCurrency20: Ticker?
    public var cryptoCurrency21: Ticker?
    public var cryptoCurrency22: Ticker?
    public var cryptoCurrency23: Ticker?
    public var cryptoCurrency24: Ticker?
    public var cryptoCurrency25: Ticker?
    
    public var safeToUnwrap: Bool? = false
    
    // calls out to cryptoCurrencyKit, and sets previously created cryptoCurrencyX equal to return results
    // then flips safeToUnwrap and reloads view; necessary because otherwise view attempts to load view which returns nil values
    func getCurrencies() {
        CryptoCurrencyKit.fetchTickers(limit: 25) { r in
            switch r {
            case .success(let tickers):
                //print(tickers)
                self.cryptoCurrency1 = tickers[0]
                self.cryptoCurrencies.append(self.cryptoCurrency1!)
                self.cryptoCurrency2 = tickers[1]
                self.cryptoCurrencies.append(self.cryptoCurrency2!)
                self.cryptoCurrency3 = tickers[2]
                self.cryptoCurrencies.append(self.cryptoCurrency3!)
                self.cryptoCurrency4 = tickers[3]
                self.cryptoCurrencies.append(self.cryptoCurrency4!)
                self.cryptoCurrency5 = tickers[4]
                self.cryptoCurrencies.append(self.cryptoCurrency5!)
                self.cryptoCurrency6 = tickers[5]
                self.cryptoCurrencies.append(self.cryptoCurrency6!)
                self.cryptoCurrency7 = tickers[6]
                self.cryptoCurrencies.append(self.cryptoCurrency7!)
                self.cryptoCurrency8 = tickers[7]
                self.cryptoCurrencies.append(self.cryptoCurrency8!)
                self.cryptoCurrency9 = tickers[8]
                self.cryptoCurrencies.append(self.cryptoCurrency9!)
                self.cryptoCurrency10 = tickers[9]
                self.cryptoCurrencies.append(self.cryptoCurrency10!)
                self.cryptoCurrency11 = tickers[10]
                self.cryptoCurrencies.append(self.cryptoCurrency11!)
                self.cryptoCurrency12 = tickers[11]
                self.cryptoCurrencies.append(self.cryptoCurrency12!)
                self.cryptoCurrency13 = tickers[12]
                self.cryptoCurrencies.append(self.cryptoCurrency13!)
                self.cryptoCurrency14 = tickers[13]
                self.cryptoCurrencies.append(self.cryptoCurrency14!)
                self.cryptoCurrency15 = tickers[14]
                self.cryptoCurrencies.append(self.cryptoCurrency15!)
                self.cryptoCurrency16 = tickers[15]
                self.cryptoCurrencies.append(self.cryptoCurrency16!)
                self.cryptoCurrency17 = tickers[16]
                self.cryptoCurrencies.append(self.cryptoCurrency17!)
                self.cryptoCurrency18 = tickers[17]
                self.cryptoCurrencies.append(self.cryptoCurrency18!)
                self.cryptoCurrency19 = tickers[18]
                self.cryptoCurrencies.append(self.cryptoCurrency19!)
                self.cryptoCurrency20 = tickers[19]
                self.cryptoCurrencies.append(self.cryptoCurrency20!)
                self.cryptoCurrency21 = tickers[20]
                self.cryptoCurrencies.append(self.cryptoCurrency21!)
                self.cryptoCurrency22 = tickers[21]
                self.cryptoCurrencies.append(self.cryptoCurrency22!)
                self.cryptoCurrency23 = tickers[22]
                self.cryptoCurrencies.append(self.cryptoCurrency23!)
                self.cryptoCurrency24 = tickers[23]
                self.cryptoCurrencies.append(self.cryptoCurrency24!)
                self.cryptoCurrency25 = tickers[24]
                self.cryptoCurrencies.append(self.cryptoCurrency25!)
                
                // reloads tableView once data has been fetched and parsed
                self.tableView.reloadData()
                // kicks into "else" condition in tableView so as to force unwrap previous Ticker objects
                self.safeToUnwrap = true
                print("Cryptocurrencies Assigned!")
            case .failure(let error):
                print("Houston, We've Had A Problem")
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrencies()
        self.title = "Quick View"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoCurrencies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        
        if safeToUnwrap == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCellid", for: indexPath) as! CryptoTableViewCell
            cell.currencyName?.text = "🛠🛠🛠"
            cell.currencyPrice?.text = "🛠🛠🛠"
            return cell
        } else {
            // draws cells once data has been fetched and declared safe to force unwrap; uses indexPath.row to determine which object in CryptoCurrencies to draw where; returns drawn cell
            // Implementation of "top performers" feature; sorts by percentChange over the past hour and displays the top three currencies based on this
            if indexPath.row == 0 {
                let sortedCurrencies = cryptoCurrencies.sorted(by: { $0.percentChange1h! > $1.percentChange1h!})
                let cell = tableView.dequeueReusableCell(withIdentifier: "topPerformer", for: indexPath) as! topPerformerTableViewCell
                cell.selectionStyle = .none
                cell.oneCurr.text = sortedCurrencies[0].name
                cell.onePctChg.text = "\(sortedCurrencies[0].percentChange1h!)" + "%"
                cell.twoCurr.text = sortedCurrencies[1].name
                cell.twoPctChg.text = "\(sortedCurrencies[1].percentChange1h!)" + "%"
                cell.threeCurr.text = sortedCurrencies[2].name
                cell.threePctChg.text = "\(sortedCurrencies[2].percentChange1h!)" + "%"
                
                return cell
                
            } else {
                
                // displays the currency listings
                let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCellid", for: indexPath) as! CryptoTableViewCell
                cell.selectionStyle = .none
                let currentCurrency = cryptoCurrencies[indexPath.row-1]
                cell.currencyName?.text = currentCurrency.name
                cell.currencyID?.text = currentCurrency.symbol
                cell.currencyPrice?.text = formatCurrencyUSD(value: (currentCurrency.priceUSD)!)
                cell.currencyCap?.text = formatCurrencyUSD(value: (currentCurrency.marketCapUSD)!)

                
                return cell
            }
            
        }
    }
    
    // programmatically sets cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0 {
            return 125.00
        } else {
            return 100.00
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let CryptoCurrencyViewController = segue.destination as? CryptoCurrencyViewController {
            
            let indexSelectedRow = (tableView.indexPathForSelectedRow?.row)!-1
            //print(cryptoCurrencies[indexSelectedRow])
            
            CryptoCurrencyViewController.cryptoCurrency = cryptoCurrencies[indexSelectedRow]
            
            // How to retitle "Back" button so it doesn't just inherent the title of the last screen
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
        }
        
    }
    
    
}




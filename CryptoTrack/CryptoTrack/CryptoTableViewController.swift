//
//  CryptoTableViewController.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 10/30/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit

class CryptoTableViewController: UITableViewController {

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
    
    public var safeToUnwrap: Bool? = false
    
    // calls out to cryptoCurrencyKit, and sets previously created cryptoCurrencyX equal to return results
    // then flips safeToUnwrap and reloads view; necessary because otherwise view attempts to load view which returns nil values
    func getCurrencies() {
        CryptoCurrencyKit.fetchTickers { r in
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
        //self.tableView.reloadData()
        self.title = "Cryptocurrencies"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCellid", for: indexPath) as! CryptoTableViewCell
        print(indexPath.row)
        
        if safeToUnwrap == false {
            cell.currencyName?.text = "🛠🛠🛠"
            cell.currencyPrice?.text = "🛠🛠🛠"
            return cell
        } else {
            // draws cells once data has been fetched and declared safe to force unwrap; uses indexPath.row to determine which object in CryptoCurrencies to draw where; returns drawn cell
            let currentCurrency = cryptoCurrencies[indexPath.row]
            cell.currencyName?.text = currentCurrency.name
            cell.currencyID?.text = currentCurrency.symbol
            cell.currencyPrice?.text = "$" + "\(currentCurrency.priceUSD!)"
            cell.currencyCap?.text = "$" + "\(currentCurrency.marketCapUSD!)"
            return cell
        }
    }
    
    // programmatically sets cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.00
    }
}

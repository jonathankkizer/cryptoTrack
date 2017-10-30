//
//  CryptoTableViewController.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 10/30/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit

class CryptoTableViewController: UITableViewController {

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
    
    public var safeToUnwrap: Bool? = false
    
    func getCurrencies() {
        CryptoCurrencyKit.fetchTickers { r in
            switch r {
            case .success(let tickers):
                //print(tickers)
                self.cryptoCurrency1 = tickers[0]
                self.cryptoCurrency2 = tickers[1]
                self.cryptoCurrency3 = tickers[2]
                self.cryptoCurrency4 = tickers[3]
                self.cryptoCurrency5 = tickers[4]
                self.cryptoCurrency6 = tickers[5]
                self.cryptoCurrency7 = tickers[6]
                self.cryptoCurrency8 = tickers[7]
                self.cryptoCurrency9 = tickers[8]
                self.cryptoCurrency10 = tickers[9]
                self.tableView.reloadData()
                self.safeToUnwrap = true
                self.testing()
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
        self.tableView.reloadData()
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

    func testing() {
        print("--Test Func--")
        print(cryptoCurrency1!)
        print(cryptoCurrency1!.id)
        print("--END TEST FUNCTION--")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    var counter = 0
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCellid", for: indexPath) as! CryptoTableViewCell
        if safeToUnwrap == false {
            cell.currencyName?.text = "Loading Data!"
            cell.currencyPrice?.text = "Loading Data!"
            return cell
        } else {
            cell.currencyName?.text = "\(cryptoCurrency1!.id)"
            cell.currencyPrice?.text = "\(cryptoCurrency1!.priceUSD!)"
            return cell
        
        }
    }

}

//
//  ViewController.swift
//  test2_final
//
//  Created by Greg Arbouzov on 10/28/17.
//  Copyright © 2017 Greg Arbouzov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.coinmarketcap.com/v1/ticker/?limit=10" )
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print("Error")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJSON = try! JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                      
                        if let currency = myJSON as? NSArray{
                            if let bitcoin = currency[0] as? NSDictionary
                            {
                                print(bitcoin["24h_volume_usd"])
                            }
                            if let ethereum = currency[1] as? NSDictionary
                            {
                                print(ethereum["id"])
                            }
                            if let ripple = currency[2] as? NSDictionary
                            {
                                print(ripple["id"])
                            }
                            if let bitcoin_cash = currency[3] as? NSDictionary
                            {
                                print(bitcoin_cash["id"])
                            }
                            if let litecoin = currency[4] as? NSDictionary
                            {
                                print(litecoin["id"])
                            }
                            if let dash = currency[5] as? NSDictionary
                            {
                                print(dash["id"])
                            }
                            if let nem = currency[6] as? NSDictionary
                            {
                                print(nem["id"])
                            }
                            if let bitconnect = currency[7] as? NSDictionary
                            {
                                print(bitconnect["id"])
                            }
                            if let neo = currency[8] as? NSDictionary
                            {
                                print(neo["id"])
                            }
                            if let monero = currency[9] as? NSDictionary
                            {
                                print(monero["id"])
                            }
    
                        }
               
                    }
                    }
                    
                        
                    }
                    
                    
                    
                }
        
        
 
         task.resume()
    }
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    
        }
    
    



}


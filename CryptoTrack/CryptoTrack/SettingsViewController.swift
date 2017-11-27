//
//  SettingsViewController.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/27/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultCurrencySelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let existingCurrencyType = UserDefaults().string(forKey:"currencyType")
        if existingCurrencyType == "BTC" {
            defaultCurrencySelector.selectedSegmentIndex = 1
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingsSaveButton(_ sender: Any) {
        var currencyType: String = ""
        if defaultCurrencySelector.selectedSegmentIndex == 0 {
            currencyType = defaultCurrencySelector.titleForSegment(at: 0)!
        } else {
            currencyType = defaultCurrencySelector.titleForSegment(at: 1)!
        }
        UserDefaults().set(currencyType, forKey:"currencyType")
        print(currencyType)
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

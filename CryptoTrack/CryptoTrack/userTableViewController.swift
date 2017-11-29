//
//  userTableViewController.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/12/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard
var Users = defaults.stringArray(forKey: "savedUsers") ?? [String]()
public var currentUserInt: Int = 0

class userTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        self.title = "Users"
        super.viewDidLoad()
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
        // #warning Incomplete implementation, return the number of rows
        return Users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)

        let userRow = Users[indexPath.row]
        cell.textLabel!.text = userRow
        return cell
    }
    
    @IBAction func quickCurrencyButton(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "quickCryptoTableVC") as! QuickCryptoTableViewController
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = tableView.indexPathForSelectedRow
        if let LoginViewController = segue.destination as? LoginViewController {
            LoginViewController.usernameProvider = Users[(indexPath?.row)!]
            currentUserInt = (indexPath?.row)!
            print("Current User Int:")
            print(currentUserInt)
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}

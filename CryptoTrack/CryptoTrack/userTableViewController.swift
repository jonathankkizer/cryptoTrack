//
//  userTableViewController.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/12/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit

public var Users = [User]()

class userTableViewController: UITableViewController {

    func addPeople() {
        // for quick testing purposes
        let newUser1 = User(userName: "Joe", passWord: "a", currencyType: "USD")
        Users.append(newUser1)
        print(Users.count)
    }
    
    override func viewDidLoad() {
        //addPeople()
        super.viewDidLoad()

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
        // #warning Incomplete implementation, return the number of rows
        return Users.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)

        print(indexPath.row)
        let userRow = Users[indexPath.row]
        cell.textLabel!.text = userRow.userName

        print("LOADED!")
        return cell
    }

}

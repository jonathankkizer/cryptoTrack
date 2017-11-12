//
//  createUserViewController.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/12/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit

class createUserViewController: UIViewController {
    
    @IBOutlet weak var currencySelector: UISegmentedControl!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var alertController:UIAlertController? = nil
    
    @IBAction func createUserBtn(_ sender: Any) {
        if (userName.text?.isEmpty ?? true) || (passWord.text?.isEmpty ?? true) {
            
            //alert user
            self.alertController = UIAlertController(title: "Error", message: "You must enter values for all fields", preferredStyle: UIAlertControllerStyle.alert)
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            }
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
            
        } else {
            var currencyType: String = ""
            if currencySelector.selectedSegmentIndex == 0 {
                currencyType = currencySelector.titleForSegment(at: 0)!
            } else {
                currencyType = currencySelector.titleForSegment(at: 1)!
            }
            let newUser = User(userName: userName.text!, passWord: passWord.text!, currencyType: currencyType)
            Users.append(newUser)
            print(Users.count)
            }
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

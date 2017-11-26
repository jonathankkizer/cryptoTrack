//
//  createUserViewController.swift
//  CryptoTrack
//
//  Created by Jonathan Kizer on 11/12/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit

class createUserViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var currencySelector: UISegmentedControl!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passWord.delegate = self
        userName.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 'First Responder' is the same as 'input focus'.
        // We are removing input focus from the text field.
        textField.resignFirstResponder()
        return true
    }
    
    // Called when the user touches on the main view (outside the UITextField).
    //
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
            
        }
        else{
            var currencyType: String = ""
            if currencySelector.selectedSegmentIndex == 0 {
                currencyType = currencySelector.titleForSegment(at: 0)!
            } else {
                currencyType = currencySelector.titleForSegment(at: 1)!
            }
            
            
            UserDefaults().set(userName.text,forKey:"userName");
            
            UserDefaults().set(passWord.text,forKey:"passWord");
            
            UserDefaults().set(currencyType, forKey:"currencyType")
            
            UserDefaults().synchronize();
            
            Users.append(userName.text!)
            
            UserDefaults().set(Users, forKey: "savedUsers")
            
            self.alertController = UIAlertController(title: "", message: "Thank You for Registering.", preferredStyle: UIAlertControllerStyle.alert)
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            }
            self.alertController!.addAction(OKAction)
            //self.present(self.alertController!, animated: true, completion:nil)}
        }
    }
    
    
}


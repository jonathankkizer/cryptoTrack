//
//  LoginViewController.swift
//  CryptoTrack
//
//  Created by Tyree Pearson on 10/31/17.
//  Copyright © 2017 Jonathan Kizer. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var _username: UITextField!
    
    @IBOutlet weak var _password: UITextField!
    
    @IBOutlet weak var _login_button: UIButton!
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let preferences = UserDefaults.standard
        
        self.title = "User Login"
        
        if (preferences.object(forKey: "session") != nil)
        {
            loginDone()
        }
        else{
            loginToDo()
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        if (_login_button.titleLabel?.text == "Logout")
        {
            let preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            
            loginToDo()
            return
        }
        
        let username = _username.text
        let password = _password.text
        
        if (username == "" || password == "")
        {
            return
        }
        doLogin(username!, password!)
    
    }
    
    func doLogin(_ user: String,_ psw: String)
    {
        let url = URL(string: "")
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "Post"
        
        let paramToSend = "username" + user + "password" + psw
        
        request.httpBody = paramToSend.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error)
            in
            guard let _:Data = data else
            {
                return
            }
            let json: Any?
            
            do
            {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch
            {
                return
            }
            
            guard let server_response = json as? NSDictionary else
            {
                return
            }
            
            if let data_block = server_response ["data"] as? NSDictionary
            {
                if let session_data = data_block ["session"] as? String
                {
                    let preferences = UserDefaults.standard
                    preferences.set(session_data, forKey: "session")
                    DispatchQueue.main.async(execute : self.loginDone)
                }
            }
            
            
        })
        task.resume()
        
        
    }
    func loginToDo()
    {
        _username.isEnabled = true
        _password.isEnabled = true
        
        _login_button.setTitle("Login", for: .normal)
    }
    
    
    
    
    func loginDone()
    {
        _username.isEnabled = false
        _password.isEnabled = false
        
        _login_button.setTitle("Logout", for: .normal)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let CryptoTableViewController = segue.destination as? CryptoTableViewController {
            
            // How to retitle "Back" button so it doesn't just inherent the title of the last screen
            let backItem = UIBarButtonItem()
            backItem.title = "Log Out"
            navigationItem.backBarButtonItem = backItem
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

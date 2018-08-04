import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    var usernameProvider: String = ""
    
    @IBOutlet weak var _username: UITextField!
    
    @IBOutlet weak var _password: UITextField!
    
    @IBOutlet weak var _login_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _username.delegate = self
        _password.delegate = self
        _username.text = usernameProvider
        
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
        //Dispose of any resources that can be recreated.
    }
    
    var alertController:UIAlertController? = nil
    @IBAction func loginButton(_ sender: Any) {
        
        let userNameStored = UserDefaults().string(forKey:"userName")
        
        let passWordStored = UserDefaults().string(forKey:"passWord");
        
        //let currency = UserDefaults().string(forKey: "currencyType")
        
        if userNameStored == _username.text && passWordStored == _password.text
        {
            // Login is successful
            //print(currency!)
            UserDefaults().set(true,forKey:"isUserLoggedIn");
            UserDefaults().synchronize();
            let vc = storyboard!.instantiateViewController(withIdentifier: "cryptoTableVC") as! CryptoTableViewController
            let navigationController = UINavigationController(rootViewController: vc)
            self.present(navigationController, animated: true, completion: nil)
            
        }

            
        else {
            UserDefaults().set(false,forKey:"isUserLoggedIn");
            UserDefaults().synchronize();
            //alert user
            
            self.alertController = UIAlertController(title: "Error", message: "Incorrect Username or Password", preferredStyle: UIAlertControllerStyle.alert)
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            }
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
        }
        
        //   let username = _username.text
        // let password = _password.text
        
        //if (username == "" || password == "")
        //{
        //  return
        //}
        //doLogin(username!, password!)
        
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
        UserDefaults().set(false,forKey:"isUserLoggedIn")
        
        
    }
    
}



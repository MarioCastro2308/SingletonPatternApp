//
//  LoginViewController.swift
//  SingletonPatternApp
//
//  Created by Mario Castro on 12/08/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        if let email = txtFieldEmail.text, let password = txtFieldPassword.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in

                if let e = error {
                    print("Login error: \(e.localizedDescription)")
                } else{
                    self.performSegue(withIdentifier: "loginToMain", sender: self)
                }
            }
        }
    }
}

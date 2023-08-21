//
//  RegisterViewController.swift
//  SingletonPatternApp
//
//  Created by Mario Castro on 12/08/23.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btnSignUpAction(_ sender: UIButton) {
        if let email = txtFieldEmail.text, let password = txtFieldPassword.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error {
                    print("Register error: \(e.localizedDescription)")
                } else{
                    self.performSegue(withIdentifier: "registerToMain", sender: self)
                }
            }
        }
    }
}

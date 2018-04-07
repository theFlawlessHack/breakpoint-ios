//
//  LoginController.swift
//  breakpoint
//
//  Created by Jessica Joseph on 4/7/18.
//  Copyright © 2018 TFH Inc. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // Outlets
    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var passwordTextField: InsetTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func signPressed(_ sender: Any) {
        guard let email = emailTextField.text , emailTextField.text != nil else { return }
        guard let password = passwordTextField.text , passwordTextField.text != nil else { return }
        
        AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                debugPrint(error?.localizedDescription as Any)
            }
            AuthService.instance.registerUser(withEmail: email, andPassword: password, completion: { (success, error) in
                if success {
                    AuthService.instance.loginUser(withEmail: email, andPassword: password) { (success, nil) in
                        if success {
                            print("Successfully registered")
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                } else {
                    debugPrint(error?.localizedDescription as Any)
                }
            })
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LoginController: UITextFieldDelegate {
    
}

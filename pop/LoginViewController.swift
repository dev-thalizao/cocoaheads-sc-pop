//
//  ViewController.swift
//  pop
//
//  Created by Thales Frigo on 10/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import UIKit

class LoginTextField: UITextField, Shakeable {
    
}

class SigninButton: UIButton, Shakeable {

}

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: LoginTextField!
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var signinButton: SigninButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func siginTapped(_ sender: Any) {
        guard
            let username = usernameTextField.text,
            let password = passwordTextField.text
        else {
            return
        }
        
        APIService().login(username: username, password: password) { [weak self] (success) in
            if success {
                self?.performSegue(withIdentifier: "talkList", sender: self)
            } else {
                self?.signinButton.shake()
                self?.usernameTextField.shake()
                self?.passwordTextField.shake()
            }
        }
    }
}

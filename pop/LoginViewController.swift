//
//  ViewController.swift
//  pop
//
//  Created by Thales Frigo on 10/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {}

class SigninButton: UIButton {
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
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
            }
        }
    }
}

//
//  Protocols.swift
//  pop
//
//  Created by Thales Frigo on 13/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import Foundation
import UIKit

// SHAKEABLE



// REUSABLE && NIBLOADABLEVIEW



// RESULT ENUM



// NOTIFICATION CENTER


protocol Alertable {
    func alert(title: String, message: String)
}

extension Alertable where Self: UIViewController {
    func alert(title: String, message: String){
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Ok",
                                          style: .default,
                                          handler: nil)
        
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

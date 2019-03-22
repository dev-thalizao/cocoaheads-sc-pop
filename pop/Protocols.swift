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
protocol Shakeable {
    func shake()
}

extension Shakeable where Self: UIView {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}


// REUSABLE && NIBLOADABLEVIEW
protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView {
    static var nibName: String { get }
    static var nib: UINib { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
}



// RESULT ENUM
enum Result<T> {
    case success(T)
    case failure(Error)
}

enum Outcome {
    case success
    case failure(Error)
}


// NOTIFICATION CENTER
protocol NotificationType {
    
    static var name: Notification.Name { get }
    
    var name: Notification.Name { get }

    var userInfo: [AnyHashable: Any] { get }
    
    init?(notification: Notification?)
}

// BONUS - Alertable
protocol Alertable {
    func alert(title: String, message: String)
}

extension Alertable where Self: UIViewController {
    func alert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let defaultAction = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

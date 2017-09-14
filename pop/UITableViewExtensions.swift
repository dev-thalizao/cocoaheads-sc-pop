//
//  UITableViewExtensions.swift
//  pop
//
//  Created by Thales Frigo on 13/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ : T.Type) where T:Reusable, T:NibLoadableView {
        register(T.nib, forCellReuseIdentifier: T.reusableIdentifier)

    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: Reusable, T:NibLoadableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reusableIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue the cell \(T.reusableIdentifier)")
        }
        
        return cell
    }
}

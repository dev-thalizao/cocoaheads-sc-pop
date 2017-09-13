//
//  NotificationCenterExtensions.swift
//  pop
//
//  Created by Thales Frigo on 13/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import Foundation

extension NotificationCenter {
    func post(_ notification: NotificationType, object:Any? = nil){
        post(name: notification.name, object: object, userInfo: notification.userInfo)
    }
    
    func addObserver<T:NotificationType>(forType type: T.Type, object obj: Any? = nil, queue: OperationQueue? = nil, using block: @escaping (T?) -> Swift.Void){
        addObserver(forName: type.name, object: obj, queue: queue) { block( type.init(notification: $0) ) }
    }
}

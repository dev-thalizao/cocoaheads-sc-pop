//
//  Notifications.swift
//  pop
//
//  Created by Thales Frigo on 13/09/17.
//  Copyright © 2017 Thales Frigo. All rights reserved.
//

import Foundation

enum Notifications {
    struct ShowSpeaker: NotificationType {
        
        var talk: Talk
        
        init(talk: Talk) {
            self.talk = talk
        }
        
        init?(notification: Notification?) {
            guard
                let name = notification?.name,
                let talk = notification?.userInfo?["talk"] as? Talk,
                name == ShowSpeaker.name
                else {
                    return nil
            }
            
            self.talk = talk
        }
        
        var userInfo: [AnyHashable : Any] {
            return ["talk": talk]
        }
        
        static var name: Notification.Name {
            return Notification.Name(String(describing: self))
        }
        
        var name: Notification.Name {
            return ShowSpeaker.name
        }
    }
}
